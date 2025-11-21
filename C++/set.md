## <font color = "8080c0">Initialization</font>
```cpp
// Initial with array
int arr[5] = {1, 2, 3, 4, 5};
set<int> s(arr, arr+5);

set<int> s{1, 2, 3, 4, 5};
```

---

## <font color = "8080c0">methods</font>
```cpp
set<int> s;

s.erase(); //刪除特定元素
s.clear(); //清空set
s.count(); //若存在元素回傳1, 否則回傳0
s.find();  //若存在元素回傳元素之iteration

```