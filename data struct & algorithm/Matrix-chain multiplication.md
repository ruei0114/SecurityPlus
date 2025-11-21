page:: 72

![4.3 Matrix Chain Multiplication - Dynamic Programming](https://www.youtube.com/watch?v=prx1psByp7U)
## **Pseudocode**
```pseudo
Matrix-Chain(P):
	// initialize
	n = length(p)
	for i from 1 to n:
		m[i][i] = 0
		
	// 斜的總共有幾次
	for l from 2 to n:
		// 每輪斜的有幾格
		for i from 1 to n-l+1:
			j = i+l-1
			// 嘗試每個可能的分割點
			for k from i to j-1:
				// 看影片就知道
				cost = m[i][k]+m[k+1][j]+p[i-1]*p[k]*p[j]
				if cost<m[i][j]:
					m[i][j] = cost
					s[i][j] = k
	return m, s
```

---

## **Tracing Example**
p73