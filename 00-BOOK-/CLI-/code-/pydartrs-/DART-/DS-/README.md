<!-- STUDENT TRAINING 30 days classwork notes. -->

# Week 1 — Basic Data Structures & Simple Functions (Dart)

**Cohort:** Dart CLI Day 1 track (paired with Rust/Python cohorts, same week)
**Scope:** Days 1–7 of the 30-day classwork plan, indexed against a new `dart_by_example` book — a companion to `rust-by-example`, built the same way: one short Markdown page per concept under `src/`, each with a runnable snippet, a commented broken variant, and a fixed version, plus CLI project steps.

**This week's existing report:**
- `PERSONAL-\DART-\DS-\STRING-\string_integer_ownership_dart_0808_.md` — Day 1: `var`/`final`/`const`, `String`, `List`, `Map`, null safety, functions

---

## 0. Book scaffold to create (`dart_by_example/`)

Mirrors the `rust-by-example/src/` layout so interns moving between tracks recognize the shape immediately. Create these folders/files under a new repo root `dart_by_example/`:

| # | Path to create | Mirrors (rust-by-example) |
|---|------------------|------------------------------|
| 1 | `dart_by_example/src/SUMMARY.md` | `src/SUMMARY.md` |
| 2 | `dart_by_example/src/variable_bindings.md` | `src/variable_bindings.md` |
| 3 | `dart_by_example/src/variable_bindings/declare.md` | `src/variable_bindings/declare.md` |
| 4 | `dart_by_example/src/variable_bindings/final_const.md` | `src/custom_types/constants.md` |
| 5 | `dart_by_example/src/variable_bindings/scope.md` | `src/variable_bindings/scope.md` |
| 6 | `dart_by_example/src/primitives.md` | `src/primitives.md` |
| 7 | `dart_by_example/src/primitives/literals.md` | `src/primitives/literals.md` |
| 8 | `dart_by_example/src/primitives/strings.md` | `src/std/str.md` |
| 9 | `dart_by_example/src/primitives/booleans.md` | `src/primitives/literals.md` |
| 10 | `dart_by_example/src/null_safety.md` | *(no direct Rust analog — closest: `src/std/option.md`)* |
| 11 | `dart_by_example/src/null_safety/nullable_types.md` | `src/std/option.md` |
| 12 | `dart_by_example/src/null_safety/null_aware_operators.md` | `src/std/option.md` |
| 13 | `dart_by_example/src/collections.md` | `src/std.md` |
| 14 | `dart_by_example/src/collections/list.md` | `src/std/vec.md` |
| 15 | `dart_by_example/src/collections/map.md` | `src/std/hash.md` |
| 16 | `dart_by_example/src/collections/set.md` | `src/std/hash.md` |
| 17 | `dart_by_example/src/fn.md` | `src/fn.md` |
| 18 | `dart_by_example/src/fn/arrow_syntax.md` | `src/fn/closures.md` |
| 19 | `dart_by_example/src/fn/named_params.md` | `src/fn.md` |
| 20 | `dart_by_example/src/flow_control.md` | `src/flow_control.md` |
| 21 | `dart_by_example/src/flow_control/if_else.md` | `src/flow_control/if_else.md` |
| 22 | `dart_by_example/src/flow_control/for_while.md` | `src/flow_control/for.md`, `while.md` |
| 23 | `dart_by_example/src/collections/collection_if_for.md` | *(Dart-specific — no direct Rust analog)* |
| 24 | `dart_by_example/src/error/try_catch.md` | `src/error/panic.md`, `result.md` |
| 25 | `dart_by_example/src/custom_types/classes.md` | `src/custom_types/structs.md` |
| 26 | `dart_by_example/src/conversion/casting.md` | `src/conversion.md` |
| 27 | `dart_by_example/src/conversion/interpolation.md` | `src/conversion/string.md` |

---

## Day-by-Day Map (Week 1)

| # | Day | Focus | Book source(s) to create |
|---|-----|-------|----------------------------|
| 1 | Day 1 | Variables (`var`/`final`/`const`), strings, `List`, `Map`, null safety, functions | `variable_bindings/declare.md`, `primitives/strings.md`, `null_safety/nullable_types.md`, `collections/list.md`, `collections/map.md`, `fn.md` |
| 2 | Day 2 | `final`/`const` deep-dive, scope | `variable_bindings/final_const.md`, `variable_bindings/scope.md` |
| 3 | Day 3 | Booleans, literals, `Set` | `primitives/literals.md`, `primitives/booleans.md`, `collections/set.md` |
| 4 | Day 4 | Null-aware operators, functions deep-dive | `null_safety/null_aware_operators.md`, `fn/arrow_syntax.md`, `fn/named_params.md` |
| 5 | Day 5 | Flow control: `if`/`else`, `for`/`while` | `flow_control/if_else.md`, `flow_control/for_while.md` |
| 6 | Day 6 | Collection-if/for, casting, string interpolation | `collections/collection_if_for.md`, `conversion/casting.md`, `conversion/interpolation.md` |
| 7 | Day 7 | `try`/`catch`, class preview | `error/try_catch.md`, `custom_types/classes.md` |

---

## 1. Topics (20)

| # | Topic | Book file to create |
|---|-------|-----------------------|
| 1 | Variable declaration (`var`) | `variable_bindings/declare.md` |
| 2 | `final` and `const` | `variable_bindings/final_const.md` |
| 3 | Scope | `variable_bindings/scope.md` |
| 4 | Numeric literals | `primitives/literals.md` |
| 5 | Strings | `primitives/strings.md` |
| 6 | Booleans | `primitives/booleans.md` |
| 7 | Nullable types (`?`) | `null_safety/nullable_types.md` |
| 8 | Null-aware operators (`??`, `?.`, `??=`) | `null_safety/null_aware_operators.md` |
| 9 | `List` | `collections/list.md` |
| 10 | `Map` | `collections/map.md` |
| 11 | `Set` | `collections/set.md` |
| 12 | Function definition | `fn.md` |
| 13 | Arrow syntax (`=>`) | `fn/arrow_syntax.md` |
| 14 | Named and optional parameters | `fn/named_params.md` |
| 15 | `if`/`else if`/`else` | `flow_control/if_else.md` |
| 16 | `for` and `while` loops | `flow_control/for_while.md` |
| 17 | Collection `if`/`for` (inside literals) | `collections/collection_if_for.md` |
| 18 | `try`/`catch`/`finally` | `error/try_catch.md` |
| 19 | Classes (preview) | `custom_types/classes.md` |
| 20 | Type casting and string interpolation | `conversion/casting.md`, `conversion/interpolation.md` |

---

## 2. Subtopics (50)

| # | Subtopic | Parent topic # | Book file |
|---|----------|-----------------|-----------|
| 1 | `var` type inference | 1 | `variable_bindings/declare.md` |
| 2 | Explicit type annotation (`String s = ...`) | 1 | `variable_bindings/declare.md` |
| 3 | `dynamic` type | 1 | `variable_bindings/declare.md` |
| 4 | `final` — set once at runtime | 2 | `variable_bindings/final_const.md` |
| 5 | `const` — compile-time constant | 2 | `variable_bindings/final_const.md` |
| 6 | `const` vs `final` for collections | 2 | `variable_bindings/final_const.md` |
| 7 | Block scope `{ }` | 3 | `variable_bindings/scope.md` |
| 8 | Top-level vs local variables | 3 | `variable_bindings/scope.md` |
| 9 | `int` literals | 4 | `primitives/literals.md` |
| 10 | `double` literals | 4 | `primitives/literals.md` |
| 11 | Numeric underscores/formatting | 4 | `primitives/literals.md` |
| 12 | Single/double-quoted strings | 5 | `primitives/strings.md` |
| 13 | Multi-line strings (`'''...'''`) | 5 | `primitives/strings.md` |
| 14 | Raw strings (`r'...'`) | 5 | `primitives/strings.md` |
| 15 | String methods (`.trim()`, `.split()`, `.toUpperCase()`) | 5 | `primitives/strings.md` |
| 16 | `bool` literals and comparisons | 6 | `primitives/booleans.md` |
| 17 | Logical operators (`&&`, `\|\|`, `!`) | 6 | `primitives/booleans.md` |
| 18 | `String?` nullable declaration | 7 | `null_safety/nullable_types.md` |
| 19 | Non-nullable by default | 7 | `null_safety/nullable_types.md` |
| 20 | `late` keyword | 7 | `null_safety/nullable_types.md` |
| 21 | `??` null-coalescing operator | 8 | `null_safety/null_aware_operators.md` |
| 22 | `?.` null-aware member access | 8 | `null_safety/null_aware_operators.md` |
| 23 | `??=` null-aware assignment | 8 | `null_safety/null_aware_operators.md` |
| 24 | `!` null-assertion operator | 8 | `null_safety/null_aware_operators.md` |
| 25 | `List<T>` literal and typing | 9 | `collections/list.md` |
| 26 | Indexing and `.length` | 9 | `collections/list.md` |
| 27 | `.add()`, `.addAll()`, `.remove()` | 9 | `collections/list.md` |
| 28 | `.map()`, `.where()`, `.toList()` | 9 | `collections/list.md` |
| 29 | `Map<K, V>` literal | 10 | `collections/map.md` |
| 30 | Key access returning `null` if missing | 10 | `collections/map.md` |
| 31 | `.putIfAbsent()`, `.update()` | 10 | `collections/map.md` |
| 32 | `Set<T>` literal and uniqueness | 11 | `collections/set.md` |
| 33 | Set operations (`.union()`, `.intersection()`) | 11 | `collections/set.md` |
| 34 | Typed function signature | 12 | `fn.md` |
| 35 | `void` return type | 12 | `fn.md` |
| 36 | Arrow function body `=> expr;` | 13 | `fn/arrow_syntax.md` |
| 37 | When arrow syntax is NOT allowed (multi-statement bodies) | 13 | `fn/arrow_syntax.md` |
| 38 | Named parameters `{String x = 'a'}` | 14 | `fn/named_params.md` |
| 39 | Optional positional parameters `[int x]` | 14 | `fn/named_params.md` |
| 40 | `required` keyword for named params | 14 | `fn/named_params.md` |
| 41 | `if`/`else if`/`else` chains | 15 | `flow_control/if_else.md` |
| 42 | Ternary `cond ? a : b` | 15 | `flow_control/if_else.md` |
| 43 | `for (var i = 0; i < n; i++)` classic loop | 16 | `flow_control/for_while.md` |
| 44 | `for (final x in items)` for-in loop | 16 | `flow_control/for_while.md` |
| 45 | `while` / `do-while` | 16 | `flow_control/for_while.md` |
| 46 | `break` / `continue` | 16 | `flow_control/for_while.md` |
| 47 | Collection `if` inside a list literal | 17 | `collections/collection_if_for.md` |
| 48 | Collection `for` (spread-like) inside a list literal | 17 | `collections/collection_if_for.md` |
| 49 | `try`/`catch`/`finally`, `on ExceptionType` | 18 | `error/try_catch.md` |
| 50 | `class`, constructor shorthand `Lexeme(this.headword)` | 19 | `custom_types/classes.md` |

---

## 3. Syntax Quick Reference (100)

| # | Syntax | Meaning | Subtopic # |
|---|--------|---------|------------|
| 1 | `var x = 5;` | inferred, mutable | 1 |
| 2 | `String s = 'saha';` | explicit type annotation | 2 |
| 3 | `dynamic x = 5;` | opts out of static type checking | 3 |
| 4 | `final x = 5;` | set once, no reassignment | 4 |
| 5 | `const x = 5;` | compile-time constant | 5 |
| 6 | `const list = [1, 2, 3];` | deeply immutable constant collection | 6 |
| 7 | `final list = [1, 2, 3];` | list reference fixed, contents still mutable | 6 |
| 8 | `{ var x = 1; }` | block-scoped variable | 7 |
| 9 | top-level `var count = 0;` (outside `main`) | global/top-level variable | 8 |
| 10 | `42` | `int` literal | 9 |
| 11 | `3.14` | `double` literal | 10 |
| 12 | `1e3` | scientific-notation double | 10 |
| 13 | `1000000` | plain large int (no separators needed) | 11 |
| 14 | `'saha'` | single-quoted string | 12 |
| 15 | `"saha"` | double-quoted string | 12 |
| 16 | `'''multi\nline'''` | multi-line string | 13 |
| 17 | `r'C:\path\no\escapes'` | raw string, no escape processing | 14 |
| 18 | `s.trim()` | remove whitespace | 15 |
| 19 | `s.split(',')` | split into a `List<String>` | 15 |
| 20 | `s.toUpperCase()` | case conversion | 15 |
| 21 | `true`, `false` | boolean literals | 16 |
| 22 | `a && b`, `a \|\| b`, `!a` | logical operators | 17 |
| 23 | `String? s;` | nullable type | 18 |
| 24 | `String s = 'saha';` (no `?`) | non-nullable, must be initialized | 19 |
| 25 | `late String s;` | deferred initialization, checked at first use | 20 |
| 26 | `String display = s ?? 'default';` | null-coalescing fallback | 21 |
| 27 | `s?.length` | null-aware member access | 22 |
| 28 | `s ??= 'default';` | assign only if currently null | 23 |
| 29 | `s!.length` | null-assertion (crashes if actually null) | 24 |
| 30 | `List<String> words = ['a', 'b'];` | typed list literal | 25 |
| 31 | `words[0]` | index access | 26 |
| 32 | `words.length` | list length | 26 |
| 33 | `words.add('c');` | append | 27 |
| 34 | `words.addAll(['c', 'd']);` | append many | 27 |
| 35 | `words.remove('a');` | remove by value | 27 |
| 36 | `words.map((w) => w.toUpperCase()).toList();` | transform to a new list | 28 |
| 37 | `words.where((w) => w.length > 3).toList();` | filter to a new list | 28 |
| 38 | `Map<String, String> m = {'k': 'v'};` | typed map literal | 29 |
| 39 | `m['k']` | key access | 29 |
| 40 | `m['missing']` | returns `null`, not a crash | 30 |
| 41 | `m.putIfAbsent('k', () => 'v');` | insert only if key absent | 31 |
| 42 | `m.update('k', (v) => v + '!');` | update existing value in place | 31 |
| 43 | `Set<String> s = {'a', 'b'};` | typed set literal | 32 |
| 44 | `a.union(b)` | set union | 33 |
| 45 | `a.intersection(b)` | set intersection | 33 |
| 46 | `String greet(String name) { return 'Hi $name'; }` | full function syntax | 34 |
| 47 | `void printSomething() { }` | no-return-value function | 35 |
| 48 | `String greet(String name) => 'Hi $name';` | arrow-syntax function | 36 |
| 49 | multi-statement body (must use `{ }`, not `=>`) | arrow syntax limitation | 37 |
| 50 | `void f({String x = 'a'}) { }` | named parameter with default | 38 |
| 51 | `void f([int x = 0]) { }` | optional positional parameter | 39 |
| 52 | `void f({required String x}) { }` | required named parameter | 40 |
| 53 | `if (x > 0) { } else if (x < 0) { } else { }` | conditional chain | 41 |
| 54 | `x > 0 ? 'pos' : 'neg'` | ternary expression | 42 |
| 55 | `for (var i = 0; i < 5; i++) { }` | classic counting loop | 43 |
| 56 | `for (final w in words) { }` | for-in loop | 44 |
| 57 | `while (cond) { }` | while loop | 45 |
| 58 | `do { } while (cond);` | do-while loop | 45 |
| 59 | `break;` | exit loop early | 46 |
| 60 | `continue;` | skip to next iteration | 46 |
| 61 | `[if (cond) 'a', 'b']` | collection-if inside a list literal | 47 |
| 62 | `[for (var i in items) i * 2]` | collection-for inside a list literal | 48 |
| 63 | `[...otherList]` | spread operator | 48 |
| 64 | `try { } catch (e) { }` | catch any exception | 49 |
| 65 | `try { } on FormatException catch (e) { }` | catch a specific exception type | 49 |
| 66 | `try { } finally { }` | always runs | 49 |
| 67 | `throw Exception('bad input');` | raise an exception | 49 |
| 68 | `class Lexeme { }` | class definition | 50 |
| 69 | `Lexeme(this.headword);` | constructor shorthand | 50 |
| 70 | `final String headword;` (inside a class) | immutable instance field | 50 |
| 71 | `int.parse('5')` | string to int | — |
| 72 | `double.parse('3.14')` | string to double | — |
| 73 | `5.toString()` | int to string | — |
| 74 | `'Headword: $s'` | string interpolation, bare variable | — |
| 75 | `'Length: ${s.length}'` | string interpolation, expression | — |
| 76 | `words.length` | property access (no parens, unlike a method) | — |
| 77 | `x is String` | runtime type check | — |
| 78 | `x as String` | explicit cast | — |
| 79 | `x == null` | null check without operators | — |
| 80 | `@override` | annotation to mark method overrides (preview) | — |
| 81 | `class Lexeme extends Object { }` | inheritance (preview) | — |
| 82 | `abstract class Repository { }` | abstract class (preview) | — |
| 83 | `mixin Loggable { }` | mixin (preview) | — |
| 84 | `enum PartOfSpeech { noun, verb }` | enum (preview) | — |
| 85 | `Future<String> fetch() async { }` | async function (preview) | — |
| 86 | `await fetch();` | await an async call (preview) | — |
| 87 | `Stream<int> counter() async* { }` | stream generator (preview) | — |
| 88 | `import 'dart:convert';` | import a core library (preview) | — |
| 89 | `import 'package:http/http.dart' as http;` | import a package (preview) | — |
| 90 | `assert(x > 0, 'must be positive');` | assertion with message | — |
| 91 | `x.runtimeType` | inspect a value's runtime type | — |
| 92 | `identical(a, b)` | reference-identity check | — |
| 93 | `List.generate(5, (i) => i * 2)` | generate a list from an index function | — |
| 94 | `words.sort();` | in-place sort | — |
| 95 | `words.reversed.toList();` | reversed list (new list) | — |
| 96 | `words.join(', ');` | join a list into a string | — |
| 97 | `words.contains('saha');` | membership test | — |
| 98 | `Iterable<String> it = words;` | iterable interface reference | — |
| 99 | `void main(List<String> args) { }` | CLI entry point with args | — |
| 100 | `print(args);` | print CLI arguments | — |

---

## 4. See also

[print_display]: ../hello/print/print_display.md
[dart-null-safety]: https://dart.dev/null-safety
[dart-lang-tour]: https://dart.dev/language

- `PERSONAL-\DART-\DS-\STRING-\string_integer_ownership_dart_0808_.md` — full worked Day 1 report this README indexes
- `dart_by_example/src/null_safety.md` — Dart-specific chapter with no direct Rust analog; closest conceptual sibling is `rust-by-example/src/std/option.md`
- `dart_by_example/src/custom_types/classes.md` — preview only; full OOP week (inheritance, mixins, abstract classes) comes later in the 30-day plan

---

## 5. CLI project setup steps (for every Dart day, reference)

| # | Step | Command |
|---|------|---------|
| 1 | Confirm Dart SDK | `dart --version` |
| 2 | Create console project | `dart create -t console dag_lexeme_cli` |
| 3 | Enter project | `cd dag_lexeme_cli` |
| 4 | Paste day's code into | `bin/dag_lexeme_cli.dart` → `void main() { ... }` |
| 5 | Fetch dependencies | `dart pub get` |
| 6 | Run | `dart run` |
| 7 | Compile to native binary | `dart compile exe bin/dag_lexeme_cli.dart` |

<!-- 1 week basic data structures and simple functions -->

<!-- dart_by_example/PERSONAL-/DART-/DS-/README.md -->