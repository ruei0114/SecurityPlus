> [!info] LINK & TAG
> [Hello, Cargo! - Rust 程式設計語言 (rust-lang.tw)](https://rust-lang.tw/book-tw/ch01-03-hello-cargo.html)
> 
> #rust #cargo

> [!example] Table of contents
> - [[#<font color = "8080c0">check cargo</font> | check cargo]]
> - [[#<font color = "8080c0">quick note</font> | quick note]]
> - [[#<font color = "8080c0">new project</font> | new project]]
> - [[#<font color = "8080c0">build and run</font> | build and run]]

---

## <font color = "8080c0">check cargo</font>
```
$ cargo --version
```

---

## <font color = "8080c0">quick note</font>
- `cargo new` 產生專案。
- `cargo build` 建構專案。
- `cargo run` 同時建構並執行專案。
- `cargo check` 建構專案來檢查錯誤，但不會產生執行檔。

---

## <font color = "8080c0">new project</font>
```
$ cargo new hello_cargo
$ cd hello_cargo
```
### file hierarchy
```
hello_cargo
     |________src
     |         |________main.rs
     |________Cargo.toml
     |________.gitignore
```

---
## <font color = "8080c0">build and run</font>
### cargo build
```
$ cargo build
   Compiling hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 2.85 secs
    
$ ./target/debug/hello_cargo # 在 Windows 上的話則是 .\target\debug\hello_cargo.exe
Hello, world!
```
### file hierarchy
```
hello_cargo
     |________src
     |         |________main.rs
     |________target
     |         |________debug
     |                   |________hello_cargo
     |________Cargo.toml
     |________.gitignore
```
### cargo run
```
$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.0 secs
     Running `target/debug/hello_cargo`
Hello, world!
```
<font color = "c2e3f4">cargo run = cargo build + .exe</font>
### cargo check
```
$ cargo check
   Checking hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 0.32 secs

```
<font color = "c2e3f4">快速檢查你的程式碼，確保它能編譯通過但不會產生執行檔</font>