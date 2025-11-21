> [!info] LINK & TAG
> [資料型別 - Rust 程式設計語言 (rust-lang.tw)](https://rust-lang.tw/book-tw/ch03-02-data-types.html)
> 
> #rust #data_types 

> [!example] Table of contents
> 1. <font color = "8080c0">Scalar Types</font>
> 	- [[#<font color = "8080c0">Tips</font> | Tips]]
> 	- [[#<font color = "8080c0">Integer Types</font> | Integer Types]]
> 	- [[#<font color = "8080c0">Floating-Point Types</font> | Floating-Point Types]]
> 	- [[#<font color = "efb730">Note Numeric Operations</font> | +-*/]]
> 	- [[#<font color = "8080c0">Boolean Type</font> | Boolean Type]]
> 	- [[#<font color = "8080c0">Character Type</font> | Character Type]]
> 1. <font color = "8080c0">Compound Types</font>
> 	- [[#<font color = "8080c0">Tuple Type</font> | Tuple Type]]
> 	- [[#<font color = "8080c0">Array Type</font> | Array Type]]

---

## Scalar Types
### <font color = "8080c0">Tips</font>
- <font color = "c2e3f4">數字中可加入底線方便閱讀 </font>
	- <font color = "c2e3f4">1000 == 1_000</font>
- <font color = "c2e3f4">數字後加型別(加底線增加可讀性)</font>
	- <font color = "c2e3f4">65.4321_f32</font>
- <font color = "c2e3f4">"as" 關鍵字型別轉換</font>
	```rust
	let decimal = 65.4321_f32;
	
	    // 錯誤！ 不提供隱式類型轉換（coercion）
	    let integer: u8 = decimal;
	    // ^error
	
	    // 可以顯式類型轉換（casting）
	    let integer = decimal as u8;
	    let character = integer as char;
	```
---
### <font color = "8080c0">Integer Types</font>
| Length | Signed | Unsigned |
| ------- |----------|------------|
| 8-bit     |i8|u8
| 16-bit   |i16|u16
| 32-bit   |i32|u32
| 64-bit   |i64|u64
| 128-bit |i128|u128
| arch   |isize|usize

### <font color = "8080c0">Floating-Point Types</font>
- <font color = "c2e3f4">IEEE-754</font>
- <font color = "c2e3f4">f32</font>
- <font color = "c2e3f4">f64</font>

#### <font color = "efb730">Note: Numeric Operations</font>
```rust
fn main() {
    // addition
    let sum = 5 + 10;

    // subtraction
    let difference = 95.5 - 4.3;

    // multiplication
    let product = 4 * 30;

    // division
    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3; // Results in -1

    // remainder
    let remainder = 43 % 5;
}
```
---
### <font color = "8080c0">Boolean Type</font>
```rust
fn main() {
    let t = true;
    let f: bool = false; // 型別詮釋的方式
}
```

### <font color = "8080c0">Character Type</font>
```rust
fn main() {
    let c = 'z';
    let z: char = 'ℤ'; // with explicit type annotation
    let heart_eyed_cat = '😻';
}
```
- <font color = "c2e3f4">一個 Unicode 純量數值    (中文、日文、韓文、表情符號以及零長度空格...)</font>

---

## Compound Types
### <font color = "8080c0">Tuple Type</font>
```rust
fn main() {
	let tup: (i32, f64, u8) = (500, 6.4, 1);

    let tup = (500, 6.4, 1);
    let (x, y, z) = tup;
    println!("y 的數值為：{y}");

	let x: (i32, f64, u8) = (500, 6.4, 1); 
	let five_hundred = x.0; 
	let six_point_four = x.1; 
	let one = x.2;
}

```

### <font color = "8080c0">Array Type</font>
- <font color = "c2e3f4">in stack</font>
```rust
fn main() {
    let a = [1, 2, 3, 4, 5];

	// 詮釋陣列型別在中括號寫出型別和元素個數，用分號區隔
	let a: [i32; 5] = [1, 2, 3, 4, 5];

	// 3個5
	let a = [3; 5];
}
```