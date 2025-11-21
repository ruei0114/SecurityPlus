> [!info] LINK & TAG
> [to_string](https://www.freecodecamp.org/news/int-to-string-in-cpp-how-to-convert-an-integer-with-tostring/)
> [stoi](https://www.freecodecamp.org/news/string-to-int-in-c-how-to-convert-a-string-to-an-integer-example/)
> [sstream](https://dotblogs.com.tw/v6610688/2013/11/08/cplusplus_stringstream_int_and_string_convert_and_clear)
>  
> #cPlusPlus#string⇄int

---

## <font color = "8080c0">to_string</font>
```cpp
#include<string>
std::string s = std::to_string(42);
```

---

## <font color = "8080c0">stoi</font>
```cpp
#include<string>
string str = 7;
int num = stoi(str);
```

---

## <font color = "8080c0">sstream</font>
```cpp
#include<sstream>

stringstream ss;

// int 轉到 string (str to int 顛倒操作)
int num = 123456;
ss << num;
string str;
ss >> str;

//清空stringstream，必須兩行都有，原因看文章
ss.str("");
ss.clear();

```