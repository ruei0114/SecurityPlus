page:: 138
![4.2 All Pairs Shortest Path (Floyd-Warshall) - Dynamic Programming](https://www.youtube.com/watch?v=oNI0rf2P9gE)
## **Pseudocode**
```pseudo
Floyd-Warshall(W):    // W 是 G 的 adjacency matrix, G 無負 cycle
	// A0~An
	for k from 1 to n:
	
		// row
		for i from 1 to n:
		
			// column
			for j from 1 to n:
				W[i][j] = min{W[i][j], w[i][k]+w[k][j]}
	return W
```

---

## **Tracing Example**
- [x] 
