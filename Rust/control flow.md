## <font color = "8080c0">if</font>
```rust
fn main() {
    let number = 3;

    if number {
	    // error rust中number不會自動轉換為boolean
	    // 應改為 if number != 0
        println!("數字為三");
    }
}
```
```rust
fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("數字結果為：{number}");
}
```
## <font color = "8080c0">loop</font>
- <font color = "c2e3f4">無限循環</font>
- <font color = "c2e3f4">用break離開</font>
- <font color = "c2e3f4">continue 回到迴圈</font>
## <font color = "8080c0">while</font>
- <font color = "c2e3f4">就是 while</font>
## <font color = "8080c0">for</font>
```rust
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!("數值為：{element}");
    }
}
```
```rust
fn main() {
    for number in (1..4).rev() {
        println!("{number}!");
    }
    println!("升空！！！");
}

```
