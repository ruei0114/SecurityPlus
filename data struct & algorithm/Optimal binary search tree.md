page:: 74
![4.6.2 [New] Optimal Binary Search Tree Successful and Unsuccessful Probability - Dynamic Programming](https://www.youtube.com/watch?v=wAy6nDMPYAE)

## **Pseudocode**
```pseudo
Optimal-BST(p[1..n], q[0..n], n):
	// 初始化
	// j-i=0
	// 第一斜行
	for i from 1 to n+1:
		w[i, i-1] = q[i-1]
		c[i, i-1] = q[i-1]
		
	// 除了初始化的，還有 n 斜行
	for l from 1 to n:
		// 每斜行有 n, n-1, n-2, ... 次要算
		for i from 1 to n-l+1:
			// 11, 22, 33, 44
			// 12, 23, 34
			// 13, 24
			// 14
			j = i+l-1
			c[i, j] = ∞
			w[i, j] = w[i, j-1]+p[j]+q[j]
			// 嘗試每個 r
			for r from i to j:
				cost = c[i, r-1]+c[r, j]+w[i, j]
				if cost<c[i, j]:
					c[i, j] = cost
					root[i, j] = r
			
	return c, root
```

---

## **Tracing Example**
- [ ] p76
