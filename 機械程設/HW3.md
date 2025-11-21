### **題目 1：修正 Scope 錯誤**

**錯誤原因：**  
`counter` 在 `increment_counter` 函式內被當作區域變數 (local variable) 修改，但 Python 在賦值 (`+= 1`) 之前不會視它為區域變數，因此會導致 `UnboundLocalError`。

**解法 1：使用 `global` 關鍵字**

```python
counter = 0

def increment_counter():
    global counter
    counter += 1
    return counter

print(increment_counter())
```

**解法 2：使用 `nonlocal`（若 `counter` 存在於內部函式的外層函式中）**

```python
def create_counter():
    counter = 0
    def increment_counter():
        nonlocal counter
        counter += 1
        return counter
    return increment_counter

counter_func = create_counter()
print(counter_func())
```

這樣可以避免污染全域變數，使 `counter` 變數只影響 `create_counter` 內部的狀態。

---

### **題目 2：decorator 與 mutable default argument**

**`log = []`的問題：**

1. `log=[]` 作為預設參數，它是**可變物件**，會被所有 `call_logger` 實例共用，導致 `greet()` 和 `bye()` 共享同一份記錄。
    

**修正方法：** 使用 `None` 作為預設值，在函式內部創建新的列表來避免共享。

```python
def call_logger(log=None): 
    if log is None:
        log = [] 

    def decorator(func): 
        def wrapper(): 
            log.append(func.__name__) 
            return func() 
        wrapper.log = log  # 儲存記錄
        return wrapper 

    return decorator 

@call_logger() 
def greet(): 
    return "Hello" 

@call_logger() 
def bye(): 
    return "Bye" 

print(greet())  
print(greet())
print(bye())  

# 測試函式各自的呼叫紀錄
print("greet.log:", greet.log)
print("bye.log:", bye.log)
```
![[Pasted image 20250327110916.png]]
`greet.log` 和 `bye.log` 記錄各自的呼叫次數，互不干擾。

---

### **題目 3：多層 decorator 執行順序**

```python
# 實作 decorator A 
def A(func):
    def wrapper():
        print("A start")
        func()
        print("A end")
    return wrapper

# 實作 decorator B 
def B(func):
    def wrapper():
        print("B start")
        func()
        print("B end")
    return wrapper

# core 函式
@A
@B
def core():
    print("Core logic")

# 呼叫 core
core()
```

**輸出結果：**

```
A start
B start
Core logic
B end
A end
```

**執行順序分析：**

1. `@B` 先包裝 `core()`，所以 `core()` 變成 `B(wrapper) → wrapper()`
    
2. `@A` 再包裝 `B(wrapper)`，所以最終變成 `A(wrapper) → wrapper()`
    
3. 執行時：
    
    - `A` 開始 (`A start`)
        
    - `B` 開始 (`B start`)
        
    - `core()` 執行 (`Core logic`)
        
    - `B` 結束 (`B end`)
        
    - `A` 結束 (`A end`)
        

---

### **題目 4：shallow copy**

**問題分析：**
1. 執行結果中 `data`**會被改變。**  因為 `students.copy()` 只對最外層的 `list` 進行拷貝，但**內部的字典仍然是原始物件的引用**。  當 `report` 修改 `s["passed"]` 時，實際上是在修改 `data` 內部的字典，因此 `data` 也會受到影響。

2. **不足夠。**  因為 `students.copy()` 只做了**淺拷貝 (Shallow Copy)**，並沒有複製內部的字典。  `report` 內部的字典仍然指向 `data` 裡的同一個字典，導致兩者互相影響。


```python
import copy

def generate_report(students): 
    report = copy.deepcopy(students)  # 深拷貝，確保內部字典也是新的
    for s in report: 
        s["passed"] = s["score"] >= 60 
    return report
```

這樣 `report` 和 `data` 會完全獨立，互不影響。✅