page:: 146
## **Pseudocode**
```pseudo
Prim(G, w, r):
	// r 是 MST 的 root
	
	// initialize
	for each u ∈ G:
		u.key = ∞
		u.π = NIL
	r.key = 0
	
	// Q 是 minimum priority queue
	Q = G.V
	
	while Q != ∅:
		u = Extract-Min(Q)
		for each v ∈ G.adj[u]:
			if v ∈ Q and w(u, v)<v.key:
				v.π = u
				v.key = w(u, v)
				Q.Decrease-Key(v)
	
	// MST
	MST = {(parent[v], v) | v ∈ V and parent[v] ≠ NIL}
	return MST
```

每次加入未出現的 vertex ，保證不會有 cycle

---

## **Tracing Example**
- [x] p147
