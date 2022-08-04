// -----------------------------------------------------------------------------
// Global Declarations
// -----------------------------------------------------------------------------

// Import

// TODO include modifiers
import foo;
import foo.bar;
import typealias foo.bar;
import struct foo;
import class foo;
import enum foo;
import protocol foo;
import let foo;
import var foo;
import func foo;

// Constant

// TODO this is quite incomplete, add more cases as needed

let foo = 3;
let (foo) = 3;
let foo: Int = 4;
let (foo, bar) = (1, 2);
// TODO
// let (foo: baz, bar) = (1, 2);
let foo: Int = 1, bar = 2;

// Variable

// TODO this is quite incomplete, add more cases as needed

var foo = 1;
var bar: Int = 2;
var baz: Int;

var x {
  var x = 2
  var y = 3
}

var y { }

// Type
var x : Int? = 1

// TODO computed variables
// var computed: Int {
//     get { 4 }
//     set { }
// }

// Typealias

// TODO include modifiers
typealias foo = bar;
typealias foo<baz> = bar;
typealias foo<baz: Int> = bar;

// Function

// TODO include modifiers
func foo() { }
func foo() -> Int { return 5; }
func foo(x: Int, y: Int) { }
func foo(_: Int) { }
func foo(_ x: Int) { }
func foo(x y: Int) { }
// TODO
// func foo(x: inout Int) { }
func foo(x: Int = 5) { }
func foo(x: Int...) { }

infix func foo() { }
postfix func foo() { }
prefix func foo() { }
mutating func foo() { }
nonmutating func foo() { }
private func foo() { }
public func foo() { }
open func foo() { }
fileprivate func foo() { }
internal func foo() { }
private(set) func foo() { }
public(set) func foo() { }
open(set) func foo() { }
fileprivate(set) func foo() { }
internal(set) func foo() { }
@attr func foo ( ) { }

infix postfix prefix mutating nonmutating private public open fileprivate 
internal private(set) public(set) open(set) fileprivate(set) internal(set) 
@attr 
func foo () { }
// TODO
// func foo() throws { }
// func foo() throws -> Int { }
// func foo(f: () throws -> void) rethrows { }
// func foo() async { }
// func foo() async -> Int { return 5; }
// func foo() async throws { }

// Class etc.

class foo {
    // According to the grammar, and even the Swift spec, any declaration is
    // allowed here. But Swift rejects imports after parsing, so they are
    // omitted here.
    let foo = 1;
    var bar = 2;
    typealias asdf = Int;
    func f() { }
    init() { }
    init(foo: Int, bar: Int) { }
    enum baz { }
    struct stru { }
    class cla { }
    protocol prot { }
    deinit { }
    // TODO others
}
class bar: foo { }
class bar: foo, baz, asdf { }
class foo<bar, baz> { }
class foo<bar: baz> { }

infix postfix prefix mutating nonmutating private public open fileprivate 
internal private(set) public(set) open(set) fileprivate(set) internal(set) 
@attr 
class foo { }
// TODO
// class foo<bar> where bar: baz { }
// class foo<bar> where bar: baz, bar: asdf { }

// TODO test other varieties
struct foo { }

// TODO test other varieties
infix postfix prefix mutating nonmutating private public open fileprivate 
internal private(set) public(set) open(set) fileprivate(set) internal(set) 
@attr 
extension bar { }

extension bar { }

// TODO test other varieties
enum baz { }
enum Error: Int {
    case a = 1
    case b
}
enum Error: String {
    case a = "hi"
    case b
}
enum Error: Character {
    case a = "h"
    case b
}
enum Error: Float {
    case a = 0.0
    func foo() { return 2 }
    case b
}
enum SumType {
  case a(Int, String)
  case b
}
enum SumType<T> {
  case a(Int, String)
  case b(T)
}
enum SumTypeWithNames<T> {
  case a(x: Int, String)
  func foo() { return 2 }
  case b(z: T)
  case c(i: Int, Int, k: Character)
}

infix postfix prefix mutating nonmutating private public open fileprivate 
internal private(set) public(set) open(set) fileprivate(set) internal(set) 
@attr indirect 
enum bar { }

// For-in loops
for x in collection {
}
for await x in collection {
}
for try await x in collection {
}
for try? await x in collection {
}
for try! await x in collection {
}
for x in collection where true == true {
}

// While loops
while true {}
while case x = true {}
while async let x = true {}
while async var x : true = true {}

// Repeat-while loops
repeat {} while true
repeat {} while case x = true
repeat {} while async let x = 1

// Do-statements
do {
  var x = 2
} catch foo {}

do {
  var x = 2
} catch {}

do {
  var x = 2
} catch foo {
} catch bar where true == true {
} catch {
}

// If-statements
if true {}
if true {} else {}
if async let x = true {} else {}
if case x = true {} else if case x = false {} else {}

// Switch statements
switch foo {
}

switch foo {
  case y:
    var x = 2
    var x = 3
  case x where true == true:
    return 2
  case let x where true == true:
    return 2
  case var x:
    return 2
  case _:
    return 3
  default:
}

switch foo {
  // Literal patterns
  case 1, 2:
    return 1
  case true where true, false:
    return 2
}

// Protocol

protocol foo {
    // The grammar allows bodies for functions/initializers/deinitializers but
    // Swift actually does not.
    //
    // The grammar allows deinits here but Swift does not.
    func foo()
    init()
    var foo: Int { get }
    var foo: Int { get set }
    var foo: Int { set get }
    // TODO other options
}

protocol foo<T> { }
protocol foo: bar { }
protocol foo: bar, baz { }
// TODO
// protocol foo<T> where T: bar { }

foo: if 1 < 150 {
}

bar: for x in collection {
}

baz: while async let x = true {}

qux: do { var x = 2 } catch {}

corn: switch foo {}

learn: repeat {} while true

// Throws
throw badthing
throw badthingagain;

// Operator

prefix operator !!!;
infix operator !!!;
postfix operator !!!;
prefix operator !!!: precedence;
