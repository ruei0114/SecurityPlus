page:: 78

![4.9 Longest Common Subsequence (LCS) - Recursion and Dynamic Programming](https://www.youtube.com/watch?v=sSno9rV8Rhg)
## **Pseudocode**
```pseudo
LCS(X, Y):    // 字串 X, Y
	m = length(X)
	n = length(Y)
	
	// 初始化第一行第一列 = 0
	for i from 0 to m:
		dp[i][0] = 0
	for j from 0 to n:
		dp[0][j] = 0
		
	for i from 1 to m:
		for j from 1 to n:
			if X[i] == Y[j]:
				// 1+LCS(X[:i-1], Y[:j-1])
				dp[i][j] = 1 + dp[i-1][j-1]
				
				// 紀錄 : 來自左上
				b[i][j] = (i-1, j-1)
			else:
				dp[i][j] = max{dp[i-1][j], dp[i][j-1]}
				
				if dp[i][j] == dp[i-1][j]:
					b[i][j] = (i-1, j)
				else:
					b[i][j] = (i, j-1)
	
	return dp, b
```

```pseudo
Print-LCS(b, X, m, n):
	while m>=0 and n>=0:
		// 如果是左上:是 subsequence
		if b[m][n] = (m-1, n-1):
			subsequence += X[m]
			m -= 1
			n -= 1
		else if b[m][n] = (m-1, n):
			m -= 1
		else:
			n -= 1
	subsequence.reverse
	print(subsequence)
```

---

## **Tracing Example**
- [x] 
