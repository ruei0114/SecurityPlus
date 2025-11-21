## Bug 說明
- 在測試過程充發現連續按下 '=' 時的連續計算結果不正確
- code tracing 後判斷是 `num1` `num2` 沒有正確附值
- 以下是修正後的程式碼
```c
private void equals_Click(object sender, EventArgs e)
{
    if (currentNum == 2)
    {
        num2 = Convert.ToDouble(textBox1.Text);
    }
    switch (op)
    {
        case "+":
            result = num1 + num2;
            break;
        case "-":
            result = num1 - num2;
            break;
        case "*":
            result = num1 * num2;
            break;
        case "/":
            result = num1 / num2;
            break;
    }
    num1 = result;
    textBox1.Text = Convert.ToString(result);
    currentNum++;
    return;
}
```
---
## 截圖及影片說明
![[Pasted image 20250303104858.png]]
https://youtu.be/RkYX9cA7n2E
- 除了助教提供的案例外，新增兩個測試案例為連乘與連除
- 120*2 = = = = =
- 120/2 = = = = =