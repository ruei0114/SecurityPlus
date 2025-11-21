page:: 145
## **Pseudocode**
```pseudo
Kruskal's(G):
	MST = {}
	
	// e 預先排序
	for each e ∈ E taken in nondecreasing order by weight:
	
		// 使用 disjoint-set 檢查是否形成 cycle
		if adding e to MST doesn't form a cycle:
			MST.append(e)
	retrun MST
```

---

## **Tracing Example**
- [x] 
