<!-- STUDENT TRAINING 30 days classwork notes. -->

# Week 1 — Basic Data Structures & Simple Functions (Python)

**Cohort:** Python Day 1 track (paired with Rust/Dart cohorts, same week)
**Scope:** Days 1–7 of the 30-day classwork plan, indexed against a new `python_by_example` book — a companion to `rust-by-example`, built the same way: one short Markdown page per concept under `src/`, each with a runnable snippet, a commented broken variant, and a fixed version.

**This week's existing report:**
- `PERSONAL-\PY-\DS-\STRING-\string_integer_ownership__python__0808_.md` — Day 1: variables, strings, lists, dicts, functions

---

## 0. Book scaffold to create (`python_by_example/`)

Mirrors the `rust-by-example/src/` layout so interns moving between tracks recognize the shape immediately. Create these folders/files under a new repo root `python_by_example/`:

| # | Path to create | Mirrors (rust-by-example) |
|---|------------------|------------------------------|
| 1 | `python_by_example/src/SUMMARY.md` | `src/SUMMARY.md` |
| 2 | `python_by_example/src/variable_bindings.md` | `src/variable_bindings.md` |
| 3 | `python_by_example/src/variable_bindings/declare.md` | `src/variable_bindings/declare.md` |
| 4 | `python_by_example/src/variable_bindings/reassign.md` | `src/variable_bindings/mut.md` |
| 5 | `python_by_example/src/variable_bindings/scope.md` | `src/variable_bindings/scope.md` |
| 6 | `python_by_example/src/primitives.md` | `src/primitives.md` |
| 7 | `python_by_example/src/primitives/literals.md` | `src/primitives/literals.md` |
| 8 | `python_by_example/src/primitives/strings.md` | `src/std/str.md` |
| 9 | `python_by_example/src/primitives/booleans.md` | `src/primitives/literals.md` |
| 10 | `python_by_example/src/collections.md` | `src/std.md` |
| 11 | `python_by_example/src/collections/list.md` | `src/std/vec.md` |
| 12 | `python_by_example/src/collections/tuple.md` | `src/primitives/tuples.md` |
| 13 | `python_by_example/src/collections/dict.md` | `src/std/hash.md` |
| 14 | `python_by_example/src/collections/set.md` | `src/std/hash.md` |
| 15 | `python_by_example/src/fn.md` | `src/fn.md` |
| 16 | `python_by_example/src/fn/default_args.md` | `src/fn.md` |
| 17 | `python_by_example/src/fn/lambda.md` | `src/fn/closures.md` |
| 18 | `python_by_example/src/flow_control.md` | `src/flow_control.md` |
| 19 | `python_by_example/src/flow_control/if_else.md` | `src/flow_control/if_else.md` |
| 20 | `python_by_example/src/flow_control/for_while.md` | `src/flow_control/for.md`, `while.md` |
| 21 | `python_by_example/src/flow_control/comprehensions.md` | `src/trait/iter.md` |
| 22 | `python_by_example/src/error.md` | `src/error.md` |
| 23 | `python_by_example/src/error/try_except.md` | `src/error/panic.md`, `result.md` |
| 24 | `python_by_example/src/custom_types/classes.md` | `src/custom_types/structs.md` |
| 25 | `python_by_example/src/conversion/casting.md` | `src/conversion.md` |
| 26 | `python_by_example/src/conversion/fstrings.md` | `src/conversion/string.md` |

---

## Day-by-Day Map (Week 1)

| # | Day | Focus | Book source(s) to create |
|---|-----|-------|----------------------------|
| 1 | Day 1 | Variables, strings, lists, dicts, functions | `variable_bindings/declare.md`, `primitives/strings.md`, `collections/list.md`, `collections/dict.md`, `fn.md` |
| 2 | Day 2 | Reassignment vs rebinding, scope | `variable_bindings/reassign.md`, `variable_bindings/scope.md` |
| 3 | Day 3 | Tuples, sets, booleans | `collections/tuple.md`, `collections/set.md`, `primitives/booleans.md` |
| 4 | Day 4 | Functions deep-dive: defaults, `*args`/`**kwargs`, lambdas | `fn/default_args.md`, `fn/lambda.md` |
| 5 | Day 5 | Flow control: `if`/`else`, `for`/`while` | `flow_control/if_else.md`, `flow_control/for_while.md` |
| 6 | Day 6 | Comprehensions, casting, f-strings | `flow_control/comprehensions.md`, `conversion/casting.md`, `conversion/fstrings.md` |
| 7 | Day 7 | `try`/`except`, class preview | `error/try_except.md`, `custom_types/classes.md` |

---

## 1. Topics (20)

| # | Topic | Book file to create |
|---|-------|-----------------------|
| 1 | Variable assignment | `variable_bindings/declare.md` |
| 2 | Reassignment (Python has no `mut`/immutable split by default) | `variable_bindings/reassign.md` |
| 3 | Scope (function-local vs global) | `variable_bindings/scope.md` |
| 4 | Numeric literals | `primitives/literals.md` |
| 5 | Strings | `primitives/strings.md` |
| 6 | Booleans | `primitives/booleans.md` |
| 7 | Lists | `collections/list.md` |
| 8 | Tuples | `collections/tuple.md` |
| 9 | Dictionaries | `collections/dict.md` |
| 10 | Sets | `collections/set.md` |
| 11 | Function definition | `fn.md` |
| 12 | Default arguments | `fn/default_args.md` |
| 13 | Lambda expressions | `fn/lambda.md` |
| 14 | `if`/`elif`/`else` | `flow_control/if_else.md` |
| 15 | `for` and `while` loops | `flow_control/for_while.md` |
| 16 | List/dict/set comprehensions | `flow_control/comprehensions.md` |
| 17 | `try`/`except`/`finally` | `error/try_except.md` |
| 18 | Classes (preview) | `custom_types/classes.md` |
| 19 | Type casting | `conversion/casting.md` |
| 20 | f-strings and `.format()` | `conversion/fstrings.md` |

---

## 2. Subtopics (50)

| # | Subtopic | Parent topic # | Book file |
|---|----------|-----------------|-----------|
| 1 | Dynamic typing, no type keyword | 1 | `variable_bindings/declare.md` |
| 2 | Multiple assignment `a, b = 1, 2` | 1 | `variable_bindings/declare.md` |
| 3 | Chained assignment `a = b = 1` | 1 | `variable_bindings/declare.md` |
| 4 | Reassigning a name to a new type | 2 | `variable_bindings/reassign.md` |
| 5 | `is` vs `==` (identity vs equality) | 2 | `variable_bindings/reassign.md` |
| 6 | Function-local scope | 3 | `variable_bindings/scope.md` |
| 7 | `global` keyword | 3 | `variable_bindings/scope.md` |
| 8 | `nonlocal` keyword (nested functions) | 3 | `variable_bindings/scope.md` |
| 9 | `int` literals, `_` separators | 4 | `primitives/literals.md` |
| 10 | `float` literals, scientific notation | 4 | `primitives/literals.md` |
| 11 | Single/double/triple-quoted strings | 5 | `primitives/strings.md` |
| 12 | String concatenation and repetition | 5 | `primitives/strings.md` |
| 13 | String slicing `s[1:3]` | 5 | `primitives/strings.md` |
| 14 | String methods (`.strip()`, `.split()`, `.join()`) | 5 | `primitives/strings.md` |
| 15 | `True`/`False`, truthiness of other types | 6 | `primitives/booleans.md` |
| 16 | Comparison and boolean operators (`and`/`or`/`not`) | 6 | `primitives/booleans.md` |
| 17 | List literal, indexing, slicing | 7 | `collections/list.md` |
| 18 | `.append()`, `.extend()`, `.insert()` | 7 | `collections/list.md` |
| 19 | `.remove()`, `.pop()`, `del` | 7 | `collections/list.md` |
| 20 | Nested lists | 7 | `collections/list.md` |
| 21 | Tuple literal and immutability | 8 | `collections/tuple.md` |
| 22 | Tuple unpacking | 8 | `collections/tuple.md` |
| 23 | Single-item tuple syntax `(x,)` | 8 | `collections/tuple.md` |
| 24 | Dict literal and key/value access | 9 | `collections/dict.md` |
| 25 | `.get(key, default)` safe read | 9 | `collections/dict.md` |
| 26 | `.keys()`, `.values()`, `.items()` | 9 | `collections/dict.md` |
| 27 | `.update()` and merging dicts | 9 | `collections/dict.md` |
| 28 | Set literal and uniqueness | 10 | `collections/set.md` |
| 29 | Set operations (union, intersection) | 10 | `collections/set.md` |
| 30 | `def` syntax and `return` | 11 | `fn.md` |
| 31 | Positional vs keyword arguments | 11 | `fn.md` |
| 32 | Type hints (`def f(x: int) -> int:`) | 11 | `fn.md` |
| 33 | Default parameter values | 12 | `fn/default_args.md` |
| 34 | Mutable default argument pitfall | 12 | `fn/default_args.md` |
| 35 | `*args` and `**kwargs` | 12 | `fn/default_args.md` |
| 36 | `lambda` syntax | 13 | `fn/lambda.md` |
| 37 | Lambda as a `sorted(key=...)` argument | 13 | `fn/lambda.md` |
| 38 | `if`/`elif`/`else` chains | 14 | `flow_control/if_else.md` |
| 39 | Ternary expression `x if cond else y` | 14 | `flow_control/if_else.md` |
| 40 | `for item in iterable:` | 15 | `flow_control/for_while.md` |
| 41 | `range()` | 15 | `flow_control/for_while.md` |
| 42 | `while` loop and `break`/`continue` | 15 | `flow_control/for_while.md` |
| 43 | `enumerate()` | 15 | `flow_control/for_while.md` |
| 44 | List comprehension `[x for x in y]` | 16 | `flow_control/comprehensions.md` |
| 45 | Filtered comprehension `[x for x in y if cond]` | 16 | `flow_control/comprehensions.md` |
| 46 | Dict comprehension | 16 | `flow_control/comprehensions.md` |
| 47 | `try`/`except`/`else`/`finally` | 17 | `error/try_except.md` |
| 48 | Catching specific exception types | 17 | `error/try_except.md` |
| 49 | `class`, `__init__`, `self` | 18 | `custom_types/classes.md` |
| 50 | `int()`, `str()`, `float()` casting and f-strings | 19, 20 | `conversion/casting.md`, `conversion/fstrings.md` |

---

## 3. Syntax Quick Reference (100)

| # | Syntax | Meaning | Subtopic # |
|---|--------|---------|------------|
| 1 | `x = 5` | assignment, type inferred | 1 |
| 2 | `a, b = 1, 2` | multiple assignment | 2 |
| 3 | `a = b = 1` | chained assignment | 3 |
| 4 | `x = "text"` | reassign name to a new type | 4 |
| 5 | `a is b` | identity comparison | 5 |
| 6 | `a == b` | equality comparison | 5 |
| 7 | `def f(): x = 1` | function-local scope | 6 |
| 8 | `global x` | modify a global from inside a function | 7 |
| 9 | `nonlocal x` | modify an enclosing function's variable | 8 |
| 10 | `42` | plain `int` literal | 9 |
| 11 | `1_000_000` | underscore digit separator | 9 |
| 12 | `3.14` | `float` literal | 10 |
| 13 | `2.5e3` | scientific notation | 10 |
| 14 | `'saha'`, `"saha"` | string literal, either quote style | 11 |
| 15 | `'''multi\nline'''` | triple-quoted string | 11 |
| 16 | `"a" + "b"` | string concatenation | 12 |
| 17 | `"ab" * 3` | string repetition | 12 |
| 18 | `s[1:3]` | string slice | 13 |
| 19 | `s[::-1]` | reversed string via slicing | 13 |
| 20 | `s.strip()` | remove whitespace | 14 |
| 21 | `s.split(",")` | split into a list | 14 |
| 22 | `",".join(items)` | join a list into a string | 14 |
| 23 | `True`, `False` | boolean literals | 15 |
| 24 | `bool("")` | falsy check (empty string is `False`) | 15 |
| 25 | `a and b`, `a or b`, `not a` | boolean operators | 16 |
| 26 | `[1, 2, 3]` | list literal | 17 |
| 27 | `items[0]` | index access | 17 |
| 28 | `items[:2]` | slice | 17 |
| 29 | `items.append(x)` | add to end | 18 |
| 30 | `items.extend(other)` | concatenate in place | 18 |
| 31 | `items.insert(0, x)` | insert at position | 18 |
| 32 | `items.remove(x)` | remove first matching value | 19 |
| 33 | `items.pop()` | remove and return last item | 19 |
| 34 | `del items[0]` | delete by index | 19 |
| 35 | `[[1, 2], [3, 4]]` | nested list | 20 |
| 36 | `(1, 2, 3)` | tuple literal | 21 |
| 37 | `t[0]` | tuple index (read-only) | 21 |
| 38 | `a, b = (1, 2)` | tuple unpacking | 22 |
| 39 | `(x,)` | single-item tuple | 23 |
| 40 | `{"k": "v"}` | dict literal | 24 |
| 41 | `d["k"]` | direct key access (raises `KeyError` if missing) | 24 |
| 42 | `d.get("k", default)` | safe key access | 25 |
| 43 | `d.keys()` | view of keys | 26 |
| 44 | `d.values()` | view of values | 26 |
| 45 | `d.items()` | view of (key, value) pairs | 26 |
| 46 | `d.update(other)` | merge another dict in | 27 |
| 47 | `{1, 2, 3}` | set literal | 28 |
| 48 | `a \| b` | set union | 29 |
| 49 | `a & b` | set intersection | 29 |
| 50 | `def f(x): return x` | function definition | 30 |
| 51 | `f(x=1)` | keyword argument call | 31 |
| 52 | `def f(x: int) -> int:` | type hints | 32 |
| 53 | `def f(x, limit=30):` | default parameter value | 33 |
| 54 | `def f(x, items=[]):` (bad) | mutable default pitfall | 34 |
| 55 | `def f(*args, **kwargs):` | variadic positional/keyword args | 35 |
| 56 | `lambda x: x * 2` | anonymous function | 36 |
| 57 | `sorted(items, key=lambda x: x.lower())` | lambda as sort key | 37 |
| 58 | `if x: ... elif y: ... else: ...` | conditional chain | 38 |
| 59 | `x if cond else y` | ternary expression | 39 |
| 60 | `for item in items:` | for-each loop | 40 |
| 61 | `for i in range(5):` | numeric range loop | 41 |
| 62 | `for i in range(1, 10, 2):` | range with start/stop/step | 41 |
| 63 | `while cond:` | while loop | 42 |
| 64 | `break` | exit loop early | 42 |
| 65 | `continue` | skip to next iteration | 42 |
| 66 | `for i, x in enumerate(items):` | index + value together | 43 |
| 67 | `[x for x in items]` | list comprehension | 44 |
| 68 | `[x for x in items if x > 1]` | filtered comprehension | 45 |
| 69 | `{k: v for k, v in pairs}` | dict comprehension | 46 |
| 70 | `{x for x in items}` | set comprehension | 46 |
| 71 | `try: ... except Exception as e: ...` | catch any exception | 47 |
| 72 | `try: ... except (TypeError, ValueError):` | catch multiple types | 48 |
| 73 | `try: ... except: ... else: ...` | run only if no exception | 47 |
| 74 | `try: ... finally: ...` | always runs, error or not | 47 |
| 75 | `raise ValueError("bad input")` | raise an exception | 47 |
| 76 | `class Lexeme:` | class definition | 49 |
| 77 | `def __init__(self, headword):` | constructor | 49 |
| 78 | `self.headword = headword` | instance attribute | 49 |
| 79 | `lex = Lexeme("saha")` | instantiate a class | 49 |
| 80 | `int("5")` | string to int | 50 |
| 81 | `str(5)` | int to string | 50 |
| 82 | `float("3.14")` | string to float | 50 |
| 83 | `f"headword: {s}"` | f-string interpolation | 50 |
| 84 | `f"{value:.2f}"` | f-string with format spec | 50 |
| 85 | `"{} - {}".format(a, b)` | `.format()` style (pre-f-string) | 50 |
| 86 | `len(items)` | length of list/str/dict/set | — |
| 87 | `type(x)` | runtime type of a value | — |
| 88 | `isinstance(x, int)` | type check | — |
| 89 | `x in items` | membership test | — |
| 90 | `assert x > 0, "must be positive"` | assertion with message | — |
| 91 | `def f() -> None:` | explicit "no return value" hint | — |
| 92 | `import module` | import a module (preview) | — |
| 93 | `from module import name` | selective import (preview) | — |
| 94 | `@staticmethod` | class decorator (preview) | — |
| 95 | `@property` | computed attribute decorator (preview) | — |
| 96 | `with open("f.txt") as fh:` | context manager (preview) | — |
| 97 | `yield x` | generator function (preview) | — |
| 98 | `x: list[str] = []` | typed empty list annotation | — |
| 99 | `None` | Python's null value | — |
| 100 | `x is None` | null check | — |

---

## 4. See also

[print_display]: ../hello/print/print_display.md
[fstrings-ref]: https://docs.python.org/3/reference/lexical_analysis.html#f-strings
[pep8]: https://peps.python.org/pep-0008/

- `PERSONAL-\PY-\DS-\STRING-\string_integer_ownership__python__0808_.md` — full worked Day 1 report this README indexes
- `python_by_example/src/collections/dict.md` — companion to row 41–42 (`.get()` safe access), same pattern taught in the Django `LexemeSearchAPIView` reports
- `python_by_example/src/custom_types/classes.md` — preview only; full OOP week comes later in the 30-day plan

<!-- 1 week basic data structures and simple functions -->

<!-- python_by_example/PERSONAL-/PY-/DS-/README.md -->