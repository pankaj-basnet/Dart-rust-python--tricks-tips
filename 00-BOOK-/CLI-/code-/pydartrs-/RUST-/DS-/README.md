<!-- STUDENT TRAINING 30 days classwork notes. -->

Week 1 (Days 1–7) of the 30-day plan:

- **Day-by-day map** — 7 rows, each tied to real `rust-by-example/src/` files (variable_bindings → primitives → custom_types → scope/borrow → scope/move+raii/box → flow_control+vec+option).
- **20 topics table** — each pointing at its actual book file path.
- **50 subtopics table** — linked back to parent topic # and book file.
- **100 syntax entries table** — linked back to subtopic #, covering everything from `let`/`mut` through moves, borrows, aliasing, structs, `Vec`/`Box`, `Option`, with a tail of "preview" rows (`HashMap`, `Rc`, `Result`, `mod`/`use`) that point ahead to later weeks' book files without teaching them yet.
- **See also** section kept in your exact link-reference style, plus links to the three Day 1 reports it's built to complement.


<!-- STUDENT TRAINING 30 days classwork notes. -->

# Week 1 — Basic Data Structures & Simple Functions

**Group:** iagriclauproaug00808 (Rust) — paired cohorts on Python Day 1 and Dart CLI Day 1
**Scope:** Days 1–7 of the 30-day classwork plan. Everything here maps to real files in `rust-by-example/src/`, plus this week's own reports under `PERSONAL-`.

**This week's reports:**
- `PERSONAL-\RUST-\DS-\string_integer_ownership__rust__0808_.md` — Day 1: `String`, `&str`, `&mut`, ownership, `i32`/`&i32`
- `PERSONAL-\PY-\DS-\STRING-\string_integer_ownership__python__0808_.md` — Day 1 (Python cohort)
- `PERSONAL-\DART-\DS-\STRING-\string_integer_ownership_dart_0808_.md` — Day 1 (Dart CLI cohort)

---

## Day-by-Day Map (Week 1)

| # | Day | Focus | Primary book source(s) |
|---|-----|-------|--------------------------|
| 1 | Day 1 | Variables, `String`/`&str`, ownership, `&mut`, integers | `src/variable_bindings/declare.md`, `src/scope/move.md`, `src/std/str.md` |
| 2 | Day 2 | Mutability, freezing, scope | `src/variable_bindings/mut.md`, `src/variable_bindings/freeze.md`, `src/variable_bindings/scope.md` |
| 3 | Day 3 | Primitives: literals, tuples, arrays/slices | `src/primitives/literals.md`, `src/primitives/tuples.md`, `src/primitives/array.md` |
| 4 | Day 4 | Custom types: structs, constants | `src/custom_types/structs.md`, `src/custom_types/constants.md` |
| 5 | Day 5 | Borrowing deep-dive: `ref`, `mut`, aliasing | `src/scope/borrow.md`, `src/scope/borrow/ref.md`, `src/scope/borrow/mut.md`, `src/scope/borrow/alias.md` |
| 6 | Day 6 | Move semantics deep-dive, RAII, `Box` | `src/scope/move/mut.md`, `src/scope/move/partial_move.md`, `src/scope/raii.md`, `src/std/box.md` |
| 7 | Day 7 | Flow control + `Vec`, `String` conversions, `Option` intro | `src/flow_control/if_else.md`, `src/flow_control/loop.md`, `src/std/vec.md`, `src/conversion/string.md`, `src/error/option_unwrap.md` |

---

## 1. Topics (20)

| # | Topic | Book file |
|---|-------|-----------|
| 1 | Variable declaration | `src/variable_bindings/declare.md` |
| 2 | Mutability (`mut`) | `src/variable_bindings/mut.md` |
| 3 | Freezing | `src/variable_bindings/freeze.md` |
| 4 | Scope and shadowing | `src/variable_bindings/scope.md` |
| 5 | Literals | `src/primitives/literals.md` |
| 6 | Tuples | `src/primitives/tuples.md` |
| 7 | Arrays and slices | `src/primitives/array.md` |
| 8 | Structs | `src/custom_types/structs.md` |
| 9 | Constants (`const`/`static`) | `src/custom_types/constants.md` |
| 10 | Ownership and move | `src/scope/move.md` |
| 11 | Mutability under move | `src/scope/move/mut.md` |
| 12 | Partial moves | `src/scope/move/partial_move.md` |
| 13 | Borrowing | `src/scope/borrow.md` |
| 14 | The `ref` pattern | `src/scope/borrow/ref.md` |
| 15 | Mutable borrows | `src/scope/borrow/mut.md` |
| 16 | Aliasing rules | `src/scope/borrow/alias.md` |
| 17 | RAII | `src/scope/raii.md` |
| 18 | `Box`, heap allocation | `src/std/box.md` |
| 19 | `Vec` (dynamic arrays) | `src/std/vec.md` |
| 20 | `String` ↔ `&str` conversion | `src/conversion/string.md`, `src/std/str.md` |

---

## 2. Subtopics (50)

| # | Subtopic | Parent topic # | Book file |
|---|----------|-----------------|-----------|
| 1 | Type inference on `let` | 1 | `variable_bindings/declare.md` |
| 2 | Explicit type annotation | 1 | `variable_bindings/declare.md` |
| 3 | Uninitialized `let` then assign later | 1 | `variable_bindings/declare.md` |
| 4 | `mut` keyword requirement | 2 | `variable_bindings/mut.md` |
| 5 | Compiler error on reassigning non-`mut` | 2 | `variable_bindings/mut.md` |
| 6 | Freezing a mutable variable via shadow-borrow | 3 | `variable_bindings/freeze.md` |
| 7 | Block scope `{ }` | 4 | `variable_bindings/scope.md` |
| 8 | Shadowing a variable name | 4 | `variable_bindings/scope.md` |
| 9 | Integer literal suffixes (`42i32`, `1u8`) | 5 | `primitives/literals.md` |
| 10 | Float literals | 5 | `primitives/literals.md` |
| 11 | Underscore separators in numbers | 5 | `primitives/literals.md` |
| 12 | Tuple construction | 6 | `primitives/tuples.md` |
| 13 | Tuple indexing (`.0`, `.1`) | 6 | `primitives/tuples.md` |
| 14 | Tuple destructuring | 6 | `primitives/tuples.md` |
| 15 | Fixed-size arrays `[T; N]` | 7 | `primitives/array.md` |
| 16 | Array slicing `&arr[1..3]` | 7 | `primitives/array.md` |
| 17 | Out-of-bounds panics | 7 | `primitives/array.md` |
| 18 | Struct definition (named fields) | 8 | `custom_types/structs.md` |
| 19 | Tuple structs | 8 | `custom_types/structs.md` |
| 20 | Unit structs | 8 | `custom_types/structs.md` |
| 21 | Field init shorthand | 8 | `custom_types/structs.md` |
| 22 | `const` vs `static` | 9 | `custom_types/constants.md` |
| 23 | Compile-time evaluation requirement | 9 | `custom_types/constants.md` |
| 24 | Move on assignment (heap types) | 10 | `scope/move.md` |
| 25 | `Copy` trait exemption for primitives | 10 | `scope/move.md` |
| 26 | Passing ownership into a function | 10 | `scope/move.md` |
| 27 | Reassigning a moved-from `mut` binding | 11 | `scope/move/mut.md` |
| 28 | Moving one field out of a struct | 12 | `scope/move/partial_move.md` |
| 29 | Effect of partial move on the whole struct | 12 | `scope/move/partial_move.md` |
| 30 | `&` immutable reference syntax | 13 | `scope/borrow.md` |
| 31 | Borrow instead of move into a function | 13 | `scope/borrow.md` |
| 32 | `ref` keyword in pattern matching | 14 | `scope/borrow/ref.md` |
| 33 | `ref mut` in pattern matching | 14 | `scope/borrow/ref.md` |
| 34 | `&mut` mutable reference syntax | 15 | `scope/borrow/mut.md` |
| 35 | Dereferencing with `*` to mutate | 15 | `scope/borrow/mut.md` |
| 36 | Many immutable borrows at once | 16 | `scope/borrow/alias.md` |
| 37 | Exactly one mutable borrow at a time | 16 | `scope/borrow/alias.md` |
| 38 | Reborrowing after last use (NLL) | 16 | `scope/borrow/alias.md` |
| 39 | Resource acquisition = initialization | 17 | `scope/raii.md` |
| 40 | Automatic `drop` at end of scope | 17 | `scope/raii.md` |
| 41 | `Box::new` heap allocation | 18 | `std/box.md` |
| 42 | Deref through a `Box` | 18 | `std/box.md` |
| 43 | `Vec::new()` and `vec!` macro | 19 | `std/vec.md` |
| 44 | `.push()` / `.pop()` | 19 | `std/vec.md` |
| 45 | Iterating a `Vec` with `for` | 19 | `std/vec.md` |
| 46 | `String::from()` vs literal `&str` | 20 | `conversion/string.md` |
| 47 | `.to_string()` / `.parse()` | 20 | `conversion/string.md` |
| 48 | `&str` methods (`.len()`, `.contains()`) | 20 | `std/str.md` |
| 49 | `if`/`else` as an expression | — (Day 7 add-on) | `flow_control/if_else.md` |
| 50 | `Option<T>`, `.unwrap()`, safe fallback | — (Day 7 add-on) | `error/option_unwrap.md` |

---

## 3. Syntax Quick Reference (100)

| # | Syntax | Meaning | Subtopic # |
|---|--------|---------|------------|
| 1 | `let x = 5;` | inferred, immutable binding | 1 |
| 2 | `let x: i32 = 5;` | explicit type annotation | 2 |
| 3 | `let x; x = 5;` | declare then assign | 3 |
| 4 | `let mut x = 5;` | mutable binding | 4 |
| 5 | `x = 6;` (no `mut`) | compiler error E0384 | 5 |
| 6 | `let x = x;` (shadow) | freezes further mutation via new immutable name | 6 |
| 7 | `{ let x = 1; }` | block-scoped variable, dropped at `}` | 7 |
| 8 | `let x = 1; let x = x + 1;` | shadowing, not mutation | 8 |
| 9 | `42i32` | typed integer literal | 9 |
| 10 | `42u8`, `42i64` | unsigned / sized integer suffixes | 9 |
| 11 | `1.5f32` | typed float literal | 10 |
| 12 | `1_000_000` | underscore digit separator | 11 |
| 13 | `let t = (1, "a", 3.0);` | tuple literal | 12 |
| 14 | `t.0`, `t.1` | tuple field access by position | 13 |
| 15 | `let (a, b, c) = t;` | tuple destructuring | 14 |
| 16 | `let arr: [i32; 3] = [1, 2, 3];` | fixed-size array | 15 |
| 17 | `let s = &arr[1..3];` | array slice | 16 |
| 18 | `arr[10]` (bad index) | panics at runtime | 17 |
| 19 | `struct Point { x: i32, y: i32 }` | named-field struct | 18 |
| 20 | `struct Pair(i32, i32);` | tuple struct | 19 |
| 21 | `struct Unit;` | unit struct | 20 |
| 22 | `Point { x, y }` | field init shorthand | 21 |
| 23 | `const LIMIT: i32 = 30;` | compile-time constant | 22 |
| 24 | `static LANG: &str = "dag";` | static, `'static` lifetime | 22 |
| 25 | `const X: i32 = compute();` (non-const fn) | compiler error | 23 |
| 26 | `let b = a;` (String) | moves `a` into `b` | 24 |
| 27 | `let y = x;` (i32) | copies, `x` still valid | 25 |
| 28 | `fn f(s: String)` | function takes ownership | 26 |
| 29 | `let mut s = String::from("a"); let s2 = s;` | `s` invalid after move | 27 |
| 30 | `let name = point.name;` | partial move of one field | 28 |
| 31 | `println!("{}", point.x);` after partial move | still OK if `x` wasn't moved | 29 |
| 32 | `let r = &s;` | immutable borrow | 30 |
| 33 | `fn f(s: &str)` | borrow instead of move | 31 |
| 34 | `match opt { Some(ref v) => ... }` | bind by reference in a pattern | 32 |
| 35 | `match opt { Some(ref mut v) => ... }` | bind by mutable reference | 33 |
| 36 | `let r = &mut s;` | mutable borrow | 34 |
| 37 | `*r += 1;` | dereference to mutate | 35 |
| 38 | `let a = &s; let b = &s;` | multiple immutable borrows OK | 36 |
| 39 | `let a = &s; let b = &mut s;` (while `a` alive) | compiler error E0502 | 37 |
| 40 | borrow ends at last use, then `&mut` allowed | non-lexical lifetimes | 38 |
| 41 | `{ let x = String::from("a"); }` | `x` dropped automatically at `}` | 39 |
| 42 | `drop(x);` | explicit early drop | 40 |
| 43 | `let b = Box::new(5);` | heap-allocate an `i32` | 41 |
| 44 | `*b + 1` | deref a `Box<i32>` | 42 |
| 45 | `let v: Vec<i32> = Vec::new();` | empty vector | 43 |
| 46 | `let v = vec![1, 2, 3];` | vector literal macro | 43 |
| 47 | `v.push(4);` | append an item | 44 |
| 48 | `v.pop();` | remove last item, returns `Option<T>` | 44 |
| 49 | `for x in &v { }` | iterate by reference | 45 |
| 50 | `for x in v { }` | iterate by value (consumes `v`) | 45 |
| 51 | `String::from("saha")` | owned string from literal | 46 |
| 52 | `let s: &str = "saha";` | borrowed string slice literal | 46 |
| 53 | `5.to_string()` | number to `String` | 47 |
| 54 | `"5".parse::<i32>()` | `&str` to number, returns `Result` | 47 |
| 55 | `s.len()` | byte length of a `&str` | 48 |
| 56 | `s.contains("sa")` | substring check | 48 |
| 57 | `s.push_str("bi")` | append to a `String` (needs `mut`) | — |
| 58 | `s.trim()` | remove leading/trailing whitespace | — |
| 59 | `s.to_lowercase()` | case conversion | — |
| 60 | `format!("{}-{}", a, b)` | build a `String` without printing | — |
| 61 | `let x = if cond { 1 } else { 2 };` | `if`/`else` as expression | 49 |
| 62 | `if let Some(x) = opt { }` | pattern-match a single case | — |
| 63 | `let opt: Option<i32> = None;` | nullable-equivalent type | 50 |
| 64 | `opt.unwrap()` | panics if `None` | 50 |
| 65 | `opt.unwrap_or(0)` | safe fallback value | 50 |
| 66 | `opt.is_some()` / `opt.is_none()` | boolean checks | 50 |
| 67 | `loop { break; }` | infinite loop with explicit break | — |
| 68 | `while cond { }` | conditional loop | — |
| 69 | `for i in 0..5 { }` | exclusive range loop | — |
| 70 | `for i in 0..=5 { }` | inclusive range loop | — |
| 71 | `match x { 1 => "one", _ => "other" }` | match expression with wildcard | — |
| 72 | `#[derive(Debug)]` | auto-generate `{:?}` formatting | — |
| 73 | `println!("{:?}", point);` | debug-print a struct | — |
| 74 | `impl Point { fn new() -> Self { } }` | associated function (preview) | — |
| 75 | `impl Point { fn dist(&self) -> f64 { } }` | method with `&self` (preview) | — |
| 76 | `type Kilometers = i32;` | type alias | — |
| 77 | `let x: i32 = 5 as i64 as i32;` | explicit cast | — |
| 78 | `x.checked_add(1)` | overflow-safe arithmetic, returns `Option` | — |
| 79 | `let v2: Vec<_> = v.iter().map(|x| x * 2).collect();` | iterator + closure + collect | — |
| 80 | `v.iter().filter(|x| **x > 1)` | iterator filter | — |
| 81 | `let (a, b) = (&s, &mut t);` | mixed borrow of two different bindings (legal) | — |
| 82 | `fn largest(list: &[i32]) -> i32` | slice parameter | 16 |
| 83 | `arr.len()` | array/slice length | 15 |
| 84 | `arr.iter()` | iterator over array elements | 15 |
| 85 | `Point { x: 0, ..other }` | struct update syntax | 21 |
| 86 | `let Point { x, y } = point;` | struct destructuring | 18 |
| 87 | `let _ = value;` | explicitly discard a value | — |
| 88 | `let () = f();` | unit-type binding | — |
| 89 | `assert_eq!(a, b);` | test-style equality assertion | — |
| 90 | `#[allow(dead_code)]` | suppress unused-code warning (see `attribute/unused.md`) | — |
| 91 | `mod mymod { }` | module declaration (preview, see `mod.md`) | — |
| 92 | `use std::collections::HashMap;` | import path (preview) | — |
| 93 | `let m: HashMap<String, String> = HashMap::new();` | map type (preview, see `std/hash.md`) | — |
| 94 | `Rc::new(value)` | reference-counted pointer (preview, see `std/rc.md`) | — |
| 95 | `Result<T, E>` | fallible-return type (preview, see `error/result.md`) | — |
| 96 | `fn f() -> Result<i32, String> { Ok(5) }` | function returning `Result` | — |
| 97 | `x?;` | early-return on `Err` (preview) | — |
| 98 | `panic!("message");` | abort with an error message | — |
| 99 | `s[..]` | full-slice syntax | 16 |
| 100 | `&s[..3]` | prefix slice of a string | 48 |

---

## 4. See also

[`static`][static]

[static]: ../lifetime/static_lifetime.md

[print_display]: ../hello/print/print_display.md

[enote]: https://en.wikipedia.org/wiki/Scientific_notation#E_notation
[rust op-prec]: https://doc.rust-lang.org/reference/expressions.html#expression-precedence
[op-prec]: https://en.wikipedia.org/wiki/Operator_precedence#Programming_languages

- `src/scope/move.md`, `src/scope/borrow.md` — core Week 1 reading
- `src/std/str.md`, `src/std/vec.md`, `src/std/box.md` — standard-library companions used throughout Week 1
- `src/conversion/string.md` — `String` ↔ number ↔ `&str` conversions referenced in row 51–54 above
- `src/error/option_unwrap.md` — `Option<T>` basics referenced in Day 7 / row 61–66 above
- `PERSONAL-\RUST-\DS-\string_integer_ownership__rust__0808_.md` — full worked Day 1 report this README indexes

<!-- 1 week basic data structures and simple functions -->

<!-- D:\src\RUST-\TUT-\2025-\RUST-BY-EXAMPLE-\BOOK-\rust-by-example\PERSONAL-\RUST-\DS-\README.md -->
