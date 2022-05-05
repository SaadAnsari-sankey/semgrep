import json
from typing import Any
from typing import Iterable
from typing import Mapping
from typing import Sequence

import semgrep.semgrep_interfaces.semgrep_output_v1 as v1
from semgrep.error import SemgrepError
from semgrep.formatter.base import BaseFormatter
from semgrep.rule import Rule
from semgrep.rule_match import RuleMatch


# This is for converting instances of classes generated by atdpy, which
# all have a 'to_json' method.
def to_json(x: Any) -> Any:
    return x.to_json()


class JsonFormatter(BaseFormatter):
    @staticmethod
    def _rule_match_to_CliMatch(rule_match: RuleMatch) -> v1.CliMatch:
        extra = v1.CliMatchExtra(
            message=rule_match.message,
            metadata=v1.RawJson(v1._Identity(rule_match.metadata)),
            severity=rule_match.severity.value,
            fingerprint=rule_match.syntactic_id,
            # 'lines' already contains '\n' at the end of each line
            lines="".join(rule_match.lines).rstrip(),
            metavars=rule_match.match.extra.metavars,
        )

        if rule_match.extra.get("dependency_matches"):
            extra.dependency_matches = v1.RawJson(
                v1._Identity(rule_match.extra.get("dependency_matches"))
            )
            extra.dependency_match_only = rule_match.extra.get("dependency_match_only")
        if rule_match.fix:
            extra.fix = rule_match.fix
        if rule_match.fix_regex:
            extra.fix_regex = rule_match.fix_regex
        if rule_match.is_ignored is not None:
            extra.is_ignored = rule_match.is_ignored

        return v1.CliMatch(
            check_id=v1.RuleId(rule_match.rule_id),
            path=str(rule_match.path),
            start=rule_match.start,
            end=rule_match.end,
            extra=extra,
        )

    def format(
        self,
        rules: Iterable[Rule],
        rule_matches: Iterable[RuleMatch],
        semgrep_structured_errors: Sequence[SemgrepError],
        cli_output_extra: v1.CliOutputExtra,
        extra: Mapping[str, Any],
    ) -> str:
        # Note that extra is not used here! Every part of the JSON output should
        # be specified in Semgrep_output_v1.atd and be part of CliOutputExtra
        output = v1.CliOutput(
            results=[
                self._rule_match_to_CliMatch(rule_match) for rule_match in rule_matches
            ],
            errors=[error.to_CliError() for error in semgrep_structured_errors],
            paths=cli_output_extra.paths,
            time=cli_output_extra.time,
        )
        # Sort keys for predictable output. This helps with snapshot tests, etc.
        return json.dumps(output.to_json(), sort_keys=True, default=to_json)
