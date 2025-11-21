```rust
fn function_name(parameter1: parameter1_type,...) -> return_type{

}
```
- <font color = "c2e3f4">參數(parameter)一定要指定type</font>
## Statement and Expression
- <font color = "c2e3f4">statement(陳述式) 不回傳數值</font>
- <font color = "c2e3f4">e.g.</font>
	```rust
	fn main(){
		let x = (let y = 6);
		// 陳述式(let y = 6)不回傳數值
		// error
	}
	```
	```rust
	fn main() {  
	    let x = 6;  
	    let x = {  
	        let x = x;  
	        x + 1  
	        // expression return x+1
	    };  
	    println!("{x}");  
	}
	// output 7
	```
- <font color = "c2e3f4">最後一行expression(表達式)作為函式回傳</font>
	```rust
	fn main() {
	    let x = plus_one(5);
	
	    println!("x 的數值為：{x}");
	}
	fn plus_one(x: i32) -> i32 {
	    x + 1;
	    // 回傳 x+1
	}
	```
- <font color = "c2e3f4">可用 return 提早回傳</font>