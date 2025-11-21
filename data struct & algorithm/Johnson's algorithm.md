page:: 141

![Jhonson's Algorithm Explained](https://www.youtube.com/watch?v=MV7EAD9zL64)
[Grok](https://grok.com/share/bGVnYWN5_3c3c6641-7a31-4c7e-9984-9b0373ae9399)
## **Pseudocode**
```pseudo
Johnson's-algorithm(G, w):
	// 有向圖 G(V, E) ，權重 w(u, v)
	
	// 添加頂點 s ，添加權重 0 的邊
	V = V ∪ {s}
	E = E ∪ {(s,v) | v ∈ V} with w(s, v) = 0
	
	// 執行 bellman-ford ，並檢查是否有負循環
	has_negative_cycle = bellman-ford(G)
	if has_negative_cycle:
		return "Graph contains a negative-weight cycle"
	
	// 更新每邊權重
	for each (u, v) ∈ E:
		w(u, v) = w(u, v) + h(u) - h(v)
	
	// 對每頂點執行 Dijkstra
	for each u ∈ V:
		d'(u,·) = Dijkstra(G, w, u)
		
		for each v ∈ V:
			d(u,v) ← d'(u,v) - h(u) + h(v)
	return d
```

---

## **Tracing Example**
- [ ] 
