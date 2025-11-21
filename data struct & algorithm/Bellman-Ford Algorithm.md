page:: 133

![Bellman-Ford in 4 minutes — Theory](https://www.youtube.com/watch?v=9PHkk0UavIM)
![Bellman-Ford in 5 minutes — Step by step example](https://www.youtube.com/watch?v=obWXjtg0L64)

## **Pseudocode**
```pseudo
Bellman-Ford(Graph G, Weight w, Source s):
	// initialize
	for each vertex v in G.V:
		v.distance = ∞
		v.previous = null
	s.distance = 0

	// Relax all edges |G.V|-1 times
	for i from 1 to |G.V|-1:
		for each (u, v) in G.E:
			if v.distance > u.distance + w(u, v):
				v.distance = u.distance + w(u, v)
				v.previous = u

	// 檢查負權重環
	for each (u, v) in G.E:
		if v.distance > u.distance + w(u, v):
			retun False    // 有負環
	return True    // 沒有負環
				
```

---

## **Tracing Example**
System of difference constraints (p136)