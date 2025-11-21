> [!info] LINK & TAG
> https://shengyu7697.github.io/std-vector/
> 
> #cPlusPlus #vector

> [!example] Table of contents
> - [[#<font color = "8080c0">Initialization</font> | Initialization]]
> - [[#<font color = "8080c0">2-D vector</font> | 2-D vector]]
> - [[#<font color = "8080c0">Traverse</font>|Traverse]]
> - [[#<font color = "8080c0">Others</font>|Others]]

---

## <font color = "8080c0">Initialization</font>
```cpp
vector<int> ivec(10);    // 宣告1個vector，裡面有10個int空間
vector<int> ivec[10];    // 宣告10個vector，每一個都可以存int
						 // 應用:2-D vector


// [1, 2, 3]
vector<int> ivec;
ivec.push_back(1);
ivec.push_back(2);
ivec.push_back(3);


// [10, 10, 10]
int n = 3;
vector<int> ivec(n, 10);


// [1, 2, 3]
vector<int> ivec{1, 2, 3};


// [10, 20, 30]
int arr[] = { 10, 20, 30 };
int n = sizeof(arr) / sizeof(arr[0]);
vector<int> ivec(arr, arr + n);


// [10, 20, 30 ]
vector<int> vect1{ 10, 20, 30 };
vector<int> vect2(vect1.begin(), vect1.end());
```
### <font color = "8080c0">2d Initialization</font>
```cpp
// fill with 0
int row, col;
vector<vector<int>> v(row, vector<int>(col, 0));
```

---

## <font color = "8080c0">2-D vector</font>
### <font color = "3aa690">\<sol I\></font>
```cpp
vector<vector<int>> jvec(10)
```
![[Pasted image 20230418115908.png]]
### <font color = "3aa690">\<sol II\></font>
```cpp
vector<int> ivec[10];
```
![[Pasted image 20230418120204.png]]
```cpp
 ivec[0].push_back(num1);
 ivec[0].push_back(num2);
```

---

## <font color = "8080c0">Traverse</font>
```cpp
vector<int> v;


for (int i=0; i<v.size(); i++){}


// type:vector<int>::iteratot can be replaced with auto
for (vector<int>::iterator iter=v.begin(); iter!=v.end(); iter++){}


for (auto i : v){}
```

---

## <font color = "8080c0">Others</font>

```cpp
// add same value multi-times to vector
//add {1, 1, 1, 1, 1} to the end of vector
v.insert(v.end(), 5, 1);
```
