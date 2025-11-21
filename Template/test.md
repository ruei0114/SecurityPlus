# 📘 演算法章節複習：Divide and Conquer

## 🧠 流程圖
> 使用 Excalidraw 畫圖 or 手繪貼照片（可附圖）

## 📌 模擬範例 trace
輸入：[3, 1, 4, 2]  
步驟：...

## 🧪 Pseudocode
```pseudo
function mergeSort(arr):
    if len(arr) <= 1: return arr
    mid = len(arr) // 2
    left = mergeSort(arr[:mid])
    right = mergeSort(arr[mid:])
    return merge(left, right)
