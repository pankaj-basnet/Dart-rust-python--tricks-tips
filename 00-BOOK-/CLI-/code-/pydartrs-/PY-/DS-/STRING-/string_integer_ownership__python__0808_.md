# Python Classwork — Day 1: Variables, Strings, Lists, Dicts, Functions

**Track:** Python fundamentals (new intern cohort, pre-Django)
**Goal by end of day:** be comfortable reading and writing the basic building blocks used throughout `wikidata_client.py`-style code — variables, strings, lists, dicts, and small functions with `.get()` fallbacks.

---

## 1. Topics/Subtopics/Syntax Reference Table

| # | Topic | Subtopic | Syntax | One-line meaning |
|---|-------|----------|--------|-------------------|
| 1 | Variables | Assignment | `x = 5` | No type keyword needed; Python infers the type |
| 2 | Variables | Reassignment | `x = "now text"` | Same name can hold a different type later (dynamic typing) |
| 3 | Strings | Literal | `s = "saha"` | Text in quotes |
| 4 | Strings | Concatenation | `s + "bi"` | Joins two strings into a new one |
| 5 | Strings | f-string | `f"headword: {s}"` | Embeds variables directly inside text |
| 6 | Strings | Methods | `s.strip()`, `s.lower()` | Built-in functions attached to string values |
| 7 | Lists | Literal | `[1, 2, 3]` | Ordered, indexable, changeable collection |
| 8 | Lists | Indexing | `items[0]` | Access by position, starting at 0 |
| 9 | Lists | Slicing | `items[:50]` | Take a sub-range without writing a loop |
| 10 | Lists | Append | `items.append(x)` | Add one item to the end |
| 11 | Dicts | Literal | `{"key": "value"}` | Unordered (insertion-ordered) collection accessed by key |
| 12 | Dicts | Safe read | `d.get("key", default)` | Read a key, falling back to a default instead of crashing |
| 13 | Dicts | Write | `d["key"] = value` | Add or overwrite a key |
| 14 | Functions | Definition | `def f(x): return x` | Reusable block of code, input in, output out |
| 15 | Functions | Default args | `def f(x, limit=30):` | Parameter with a fallback value if caller omits it |
| 16 | Loops | For loop | `for item in items:` | Runs the block once per item, in order |
| 17 | Comprehension | List comprehension | `[x for x in items if cond]` | Builds a new filtered/transformed list in one line |
| 18 | Booleans | Comparison | `flag = value == "1"` | Turns a comparison into `True`/`False` |
| 19 | Error handling | try/except | `try: ... except Exception as e: ...` | Runs code, catches failures instead of crashing the program |

---

## 2. Variables and strings

```python
# Variables: no type declaration needed — Python figures it out at runtime.
headword = "saha"          # str
limit = 30                 # int
is_fuzzy = True             # bool

# f-strings: the cleanest way to build text with variables inside it.
print(f"Searching for '{headword}' with limit={limit}")

# Common string methods you'll use constantly when reading request data:
raw = "  Saha  "
clean = raw.strip()        # "Saha"  — removes leading/trailing whitespace
clean_lower = clean.lower()  # "saha" — case-insensitive comparisons

# Error example — mixing types without conversion:
# age = "Result: " + 5
# TypeError: can only concatenate str (not "int") to str
# Fix:
age = "Result: " + str(5)   # convert int to str first
```

---

## 3. Lists — ordered collections

```python
# A list keeps items in the order you put them in, and you can access
# any item by its position (index), starting at 0.
words = ["saha", "sahabi", "sahayili"]

print(words[0])    # "saha"   — first item
print(words[-1])   # "sahayili" — last item, negative indexing counts from the end

# Slicing takes a sub-range without a loop — exactly like sense_rows[:50]
# from the Django report you'll see next week.
first_two = words[:2]      # ["saha", "sahabi"]

# Growing a list:
words.append("sahigu")
print(words)  # ["saha", "sahabi", "sahayili", "sahigu"]

# Error example — indexing past the end:
# print(words[10])
# IndexError: list index out of range
# Fix: check length first, or use a safe pattern:
if len(words) > 10:
    print(words[10])
else:
    print("not enough items")
```

---

## 4. Dictionaries — key/value lookups

```python
# A dict maps keys to values — like a real dictionary: look up a word,
# get its definition, instead of scanning every page.
lexeme = {
    "wikidata_id": "L12345",
    "headword": "saha",
    "part_of_speech": "noun",
}

print(lexeme["headword"])   # "saha" — direct access

# Error example — accessing a missing key directly:
# print(lexeme["english_gloss"])
# KeyError: 'english_gloss'

# Fix — the SAFE pattern used everywhere in real code:
gloss = lexeme.get("english_gloss", "")   # "" if the key doesn't exist
print(f"gloss = '{gloss}'")

# Writing/updating a key:
lexeme["english_gloss"] = "time / hour"
print(lexeme)
```

---

## 5. Functions

```python
# A function takes input, does something, returns output — a small,
# reusable, named block of logic.
def build_lexeme(wikidata_id, headword, part_of_speech="noun"):
    # `part_of_speech="noun"` is a DEFAULT argument — callers may omit it.
    return {
        "wikidata_id": wikidata_id,
        "headword": headword,
        "part_of_speech": part_of_speech,
    }

result = build_lexeme("L12345", "saha")
print(result)

result2 = build_lexeme("L67890", "sahabi", part_of_speech="noun")
print(result2)

# Error example — calling with wrong number of positional args:
# build_lexeme()
# TypeError: build_lexeme() missing 2 required positional arguments
```

---

## 6. Loops and list comprehensions

```python
words = ["saha", "sahabi", "sahayili"]

# Standard for loop:
for w in words:
    print(f"word: {w}")

# List comprehension — same idea, written in one line, building a NEW list:
uppercased = [w.upper() for w in words]
print(uppercased)  # ["SAHA", "SAHABI", "SAHAYILI"]

# Filtered comprehension — only keep items matching a condition:
long_words = [w for w in words if len(w) > 5]
print(long_words)  # ["sahabi", "sahayili"]
```

---

## 7. try/except — handling errors without crashing

```python
def safe_divide(a, b):
    try:
        return a / b
    except ZeroDivisionError as e:
        print(f"Error: {e}")
        return None

print(safe_divide(10, 2))   # 5.0
print(safe_divide(10, 0))   # prints error message, returns None instead of crashing
```

---

## 8. Setting up and running a Python script/CLI (steps)

| # | Step | Command | What happens |
|---|------|---------|----------------|
| 1 | Confirm Python is installed | `python --version` (or `python3 --version`) | Confirms interpreter is on PATH |
| 2 | Create a project folder | `mkdir dag_lexeme_py && cd dag_lexeme_py` | — |
| 3 | (Recommended) create a virtual environment | `python -m venv venv` | Isolates dependencies per project |
| 4 | Activate the virtual environment | `venv\Scripts\activate` (Windows) / `source venv/bin/activate` (Mac/Linux) | Switches `python`/`pip` to the project-local copy |
| 5 | Create your script file | create `main.py` | This is where today's code snippets go |
| 6 | Run the script | `python main.py` | Executes the file top to bottom |
| 7 | (Optional) install a package | `pip install requests` | Needed once you start making HTTP calls next |

---

## 9. Homework checklist for interns

| # | Task |
|---|------|
| 1 | Fix the `age = "Result: " + 5` TypeError example above |
| 2 | Write a function `first_n(items, n)` that returns the first `n` items of a list using slicing |
| 3 | Build a dict for one lexeme with `.get()` fallbacks for two optional keys that may be missing |
| 4 | Rewrite the `for` loop example in Section 6 as a list comprehension that only keeps words starting with `"sa"` |