# Rust Classwork — Day 1: `String`, `&str`, Ownership, `&mut`, and `&integer`

**Group:** iagriclauproaug00808
**Track:** Rust basics (paired with your Django/Python work — comments below connect each Rust idea to something you already do in `wikidata_client.py` / `views.py`)
**Style reference:** rust-by-example book (`scope/borrow/alias.md` pattern) — runnable snippet, then commented broken variants showing the compiler error, then a working fix.

---

## 0. Why interns coming from Django should care

In Django/Python, `q = request.query_params.get('q', '')` gives you a `str` and you never think about who "owns" it or whether someone else can change it underneath you. Python quietly keeps every string alive with a reference counter and garbage collector.

Rust has no garbage collector. Instead, **every value has exactly one owner**, and the compiler checks — at compile time, for free, with zero runtime cost — that you never read a value that's already been dropped, and never have two people trying to *write* to the same value at once. This is the trade you make for Rust's speed and safety: more rules the compiler enforces up front, nothing left to chance at runtime.

---

## 1. Topics/Subtopics/Syntax Reference Table

| # | Topic | Subtopic | Syntax | One-line meaning |
|---|-------|----------|--------|-------------------|
| 1 | Ownership | Move | `let b = a;` | `a` (a `String`) is moved into `b`; `a` is no longer usable |
| 2 | Ownership | Clone | `let b = a.clone();` | Deep-copies the data; both `a` and `b` remain valid |
| 3 | String types | `String` | `let s: String = String::from("saha");` | Owned, growable, heap-allocated text |
| 4 | String types | `&str` | `let s: &str = "saha";` | Borrowed string slice; usually a view into a `String` or a literal |
| 5 | Borrowing | Immutable borrow | `let r = &s;` | Read-only reference; any number allowed at once |
| 6 | Borrowing | Mutable borrow | `let r = &mut s;` | Read/write reference; only **one** allowed at a time, and no immutable borrows alongside it |
| 7 | Borrowing | Aliasing rule | — | Either many `&s` **or** one `&mut s`, never both, in the same scope at the same time |
| 8 | Integers | Copy type | `let y = x;` | Integers implement `Copy`; `x` stays valid after this — no move happens |
| 9 | Integers | Reference | `let r: &i32 = &x;` | Borrowing an integer works the same way as borrowing a `String`, just cheaper since integers are tiny |
| 10 | Integers | Mutable reference | `let r: &mut i32 = &mut x;` | Same aliasing rule applies to integers as to strings |
| 11 | Functions | Borrowing params | `fn f(s: &str)` | Takes a *view* of a string without taking ownership — caller keeps using it after |
| 12 | Functions | Owning params | `fn f(s: String)` | Takes ownership — caller loses access unless they clone first |

---

## 2. `String` — owned, growable text

```rust,editable
fn main() {
    // `String::from` allocates on the heap — this is YOUR string, you own it.
    // Compare to Python: q = str(request.query_params.get('q', ''))
    let mut headword = String::from("saha");

    // Because `headword` is declared `mut`, we can grow it in place.
    headword.push_str("bi"); // headword is now "sahabi"
    println!("headword = {}", headword);

    // Ownership MOVE: assigning a String to a new variable transfers ownership.
    let moved_headword = headword;

    // Error! `headword` was moved into `moved_headword` on the line above.
    // The Django equivalent would be: two variables pointing at one dict,
    // edit through either, both see it change — Rust refuses to let that
    // happen silently for owned values, so it invalidates the old name instead.
    // println!("{}", headword);
    // TODO ^ uncomment to see: error[E0382]: borrow of moved value: `headword`

    println!("moved_headword = {}", moved_headword);
}
```
`D:\src\RUST-\TUT-\2025-\RUST-BY-EXAMPLE-\BOOK-\rust-by-example\src\scope\move\move_examples\strings1.rs`

**Fix — clone instead of move, when you genuinely need two independent copies:**
```rust,editable
fn main() {
    let headword = String::from("saha");
    let headword_copy = headword.clone(); // deep copy — two separate allocations

    // Now BOTH are valid — this is the Rust equivalent of Python's
    // implicit "everything is a reference, copy when you mean it" behaviour,
    // except in Rust you write `.clone()` explicitly, so cost is visible.
    println!("{} / {}", headword, headword_copy);
}
```

---

## 3. `&str` — borrowed string slice

```rust,editable
// Compare to your DRF view: def get(self, request) reads request.query_params
// but never *owns* the underlying HTTP request buffer — it just looks at it.
// &str is Rust's version of "just let me look, I don't need to own this".
fn print_headword(s: &str) {
    println!("headword (borrowed): {}", s);
}

fn main() {
    let headword = String::from("saha");

    // `&headword` here converts (via "deref coercion") a &String into a &str.
    print_headword(&headword);

    // headword is STILL valid here — print_headword only borrowed it,
    // it did not take ownership, so nothing was moved.
    println!("still usable: {}", headword);

    // A string literal is ALREADY a &str — no heap allocation needed at all.
    let lang_code: &str = "dag";
    print_headword(lang_code);
}
```
`D:\src\RUST-\TUT-\2025-\RUST-BY-EXAMPLE-\BOOK-\rust-by-example\src\scope\borrow\str_slice.rs`

---

## 4. `&mut String` — mutable borrow, and the aliasing rule

This section mirrors the `alias.md` pattern you were given, but using a `String` field instead of a `Point`, so it maps directly onto `parsed['headword']` from your `_parse_entity()` work.

```rust,editable
struct Lexeme {
    headword: String,
    part_of_speech: String,
}

fn main() {
    let mut lex = Lexeme {
        headword: String::from("saha"),
        part_of_speech: String::from("noun"),
    };

    let borrowed_1 = &lex.headword;
    let borrowed_2 = &lex.headword;

    // Any number of immutable (&) borrows can coexist — like many senses
    // all reading the same parsed dict in your Django _parse_entity().
    println!("Two immutable views: {} / {}", borrowed_1, borrowed_2);

    // Error! Can't borrow `lex.headword` as mutable because it's currently
    // borrowed as immutable (borrowed_1 / borrowed_2 above are still "alive"
    // as far as the compiler's borrow checker is concerned up to their last use).
    // let mutable_borrow = &mut lex.headword;
    // TODO ^ Try uncommenting this line: error[E0502]

    // borrowed_1 / borrowed_2 are used for the last time just above,
    // so NOW it's legal to take a mutable borrow.
    let mutable_borrow = &mut lex.headword;
    mutable_borrow.push_str("bi"); // headword becomes "sahabi"

    // Error! Can't borrow as immutable while a mutable borrow is active.
    // println!("{}", lex.headword);
    // TODO ^ Try uncommenting this line: error[E0502]

    println!("After mutation: {}", mutable_borrow);

    // mutable_borrow's last use was just above, so we can borrow immutably again.
    println!("Final headword: {}", lex.headword);
}
```
`D:\src\RUST-\TUT-\2025-\RUST-BY-EXAMPLE-\BOOK-\rust-by-example\src\scope\borrow\alias_string.rs`

**Rule of thumb to say out loud in review sessions:** *"many readers, OR one writer — never both, at the same time."* This is exactly why Django's `lexeme_obj.senses.all().delete()` followed by re-creating rows (from your `upsert_lexeme`) is safe in Python but would need much more care in Rust — Rust would force you to prove no one else is reading `senses` while you clear and rebuild it.

---

## 5. Integers: `i32`, `&i32`, `&mut i32`

```rust,editable
fn main() {
    let x: i32 = 30; // like Wikidata's `limit=30` in client.search(q, limit=30)

    // Integers implement the `Copy` trait — assigning does NOT move.
    let y = x;
    // No error here! Unlike String, both x and y are valid — a cheap bitwise copy happened.
    println!("x = {}, y = {}", x, y);

    // Borrowing an integer works the same as borrowing a String.
    let x_ref: &i32 = &x;
    println!("borrowed x = {}", x_ref);

    let mut counter: i32 = 0;
    let counter_ref: &mut i32 = &mut counter;
    *counter_ref += 1; // `*` dereferences: "go through the reference, change the real value"
    println!("counter after mutation = {}", counter); // 1

    // Error! Same aliasing rule applies to integers as to strings.
    // let another_ref = &counter;
    // *counter_ref += 1;
    // println!("{}", another_ref);
    // TODO ^ uncomment: error[E0502] cannot borrow `counter` as immutable
    //         because it is also borrowed as mutable
}
```
`D:\src\RUST-\TUT-\2025-\RUST-BY-EXAMPLE-\BOOK-\rust-by-example\src\scope\borrow\integers.rs`

---

## 6. Bridging table: Django/Python idiom → Rust idiom

| # | Django/Python pattern you already use | Rust equivalent | Note |
|---|----------------------------------------|------------------|------|
| 1 | `q = request.query_params.get('q', '')` returns `str` | `let q: &str = params.get("q").unwrap_or("");` | `&str` because you're only reading |
| 2 | `parsed['headword'] = headword` builds a dict you keep | `let headword: String = String::from(...);` owned struct field | `String` because the struct owns it long-term |
| 3 | Passing a dict into a function just to read it | `fn f(s: &str)` | borrow, don't take ownership |
| 4 | Passing a dict into a function that mutates and returns it | `fn f(s: &mut String)` | mutable borrow |
| 5 | `int` passed around freely, copies happen invisibly | `i32` implements `Copy` — same invisible-copy behaviour, but explicit in the type system | no ownership drama for small integers |

---

## 7. Setting up a Rust CLI project (steps)

| # | Step | Command | What happens |
|---|------|---------|----------------|
| 1 | Confirm Rust toolchain is installed | `rustc --version` and `cargo --version` | Confirms `rustc` compiler and `cargo` build tool are on PATH |
| 2 | Create a new binary (CLI) project | `cargo new dag_lexeme_cli` | Generates `Cargo.toml` + `src/main.rs` with a starter `fn main() { println!("Hello, world!"); }` |
| 3 | Enter the project | `cd dag_lexeme_cli` | — |
| 4 | Edit `src/main.rs` | paste today's snippet into `fn main() { ... }` | This is where all classwork above should be pasted for compiling |
| 5 | Compile + run in one step | `cargo run` | Compiles then immediately executes the binary |
| 6 | Compile only (check for errors fast) | `cargo check` | Much faster than a full build; use this while debugging borrow-checker errors |
| 7 | Build an optimized release binary | `cargo build --release` | Output binary appears in `target/release/` |

---

## 8. Homework checklist for interns

| # | Task |
|---|------|
| 1 | Get `Section 2` (`String` move) to compile — fix by adding `.clone()` where needed |
| 2 | Get `Section 4` (`&mut String` aliasing) to compile with all `TODO` lines uncommented one at a time, observing each new compiler error message |
| 3 | Write a `fn word_len(s: &str) -> usize` that borrows a headword and returns its length, without taking ownership |
| 4 | Explain in one sentence, in your own words, why Python never made you think about any of this |