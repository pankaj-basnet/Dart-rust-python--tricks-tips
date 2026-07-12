The error in your code is primarily caused by **missing semicolons** (`;`). In Rust, if you don't put a semicolon at the end of a `println!` or a variable assignment, Rust thinks you are trying to "return" that line, which causes a conflict.

There is also a subtle logic "trap" with **Variable Shadowing** that we discussed earlier, which makes the code compile but might be confusing to read.

### The Fixed Code

```rust
pub fn unwrap_or_default(foo: Option<u32>, bar: u32) -> u32 {
    if let Some(bar) = foo {
        // Added semicolon here
        println!(" Some has value inside {}", bar); 

        return bar; // Added semicolon here
    }

    // This 'bar' refers to the second parameter of the function
    println!("default value (second parameter) : {}", bar);

    return bar; // Added semicolon here
}

fn main() {
    // Added semicolon after the function calls
    let result1 = unwrap_or_default(Some(123), 100);
    println!("result1 = {}", result1);

    let result2 = unwrap_or_default(None, 100);
    println!("result2 = {}", result2);
}
```

---

### What was causing the errors?

1.  **Missing Semicolons**: In the `main` function, `let result1 = ...` is a statement. Statements in Rust **must** end with a `;`. Without it, the compiler gets confused about where one instruction ends and the next begins.
2.  **The `println!` Semicolon**: Inside your `if let` block, you had `println!(...)` without a semicolon. Rust expected the next line to be part of the print statement, but found a `return` instead.

### Understanding the "Shadowing" in your output
When you run this, pay close attention to the variable named `bar`:

* **When `foo` is `Some(123)`**: The code creates a **new** temporary `bar` that equals `123`. The original `bar` (100) is hidden.
* **When `foo` is `None`**: The `if let` block is skipped. The code uses the **original** `bar` (100).



### A Pro-Tip for Beginners
In Rust, you can actually return a value without using the word `return` at all! You just leave the semicolon off the **very last line** of the function:

```rust
pub fn unwrap_or_default(foo: Option<u32>, bar: u32) -> u32 {
    if let Some(inner) = foo {
        inner // No 'return' and no ';' means "return this"
    } else {
        bar   // Return the fallback
    }
}
```


<!-- D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\z--rust-programming-language-\if_else__let__function\some__default_value__260319_.md -->