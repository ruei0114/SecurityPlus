> [!info] LINK & TAG
> [Hello, World! - Rust 程式設計語言 (rust-lang.tw)](https://rust-lang.tw/book-tw/ch01-02-hello-world.html)
> 
> #rust #hello_world


```rust
fn main() {  
    // println! 會呼叫一支 Rust 巨集（macro）。如果是呼叫函式的話，那則會是 println（去掉 !）  
    println!("Hello, world!");  
}
```

---

## <font color = "8080c0">compile</font>
```
$ rustc main.rs
```
### Linux and macOS
```
$ ls
main  main.rs
```
### Windows
```
> dir /B %= /B 選項代表只顯示檔案名稱 =%
main.exe    #執行檔
main.pdb    #除錯資訊文件
main.rs     #原始碼
```

---

## <font color = "8080c0">run</font>
```
$ ./main # 在 Windows 上則是 .\main.exe
```