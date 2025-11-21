> [!info] LINK & TAG
> [變數與可變性 - Rust 程式設計語言 (rust-lang.tw)](https://rust-lang.tw/book-tw/ch03-01-variables-and-mutability.html)
> 
> #rust #variables 

> [!example] Table of contents
> - [[#<font color = "8080c0">Variable Mutability</font> |Variable Mutability]]
> - [[#<font color = "8080c0">Constants</font> | Constants]]
> - [[#<font color = "8080c0">Shadowing</font> | Shadowing]]

---

## <font color = "8080c0">Variable Mutability</font>
```rust
fn main() { 
	let x = 5; 
	x = 6; 
	// error: x不可變
}
```
```rust
fn main() {
	//設定可變變數 x = 5
    let mut x = 5;
    x = 6;
}
```

---

## <font color = "8080c0">Constants</font>
- <font color = "c2e3f4">常數讓數值與名稱綁定且不允許被改變</font>
- <font color = "c2e3f4">必須指明型別</font>
```rust
fn main() {
	// 秒*分鐘*小時 相較於直接打上10,800更有可讀性
	const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3;
}
```

---

## <font color = "8080c0">Shadowing</font>
```rust
fn main() {
    let x = 5;
    let x = x + 1;
    {
        let x = x * 2;
        println!("x 在內部範圍的數值為：{x}");
    }
    println!("x 的數值為：{x}");
}
```
```
$ cargo run
   Compiling variables v0.1.0 (file:///projects/variables)
    Finished dev [unoptimized + debuginfo] target(s) in 0.31s
     Running `target/debug/variables`
x 在內部範圍的數值為：12
x 的數值為：6
```
- <font color = "c2e3f4">mut 與shadowing不同的地方是，我們能有效地再次運用 `let` 產生新的變數，可以在重新運用相同名稱時改變它的型別。</font>
```rust
fn main() {
    let spaces = "   ";
    let spaces = spaces.len();
}
```
