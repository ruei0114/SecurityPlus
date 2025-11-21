page:: 85

![最浅显易懂的 KMP 算法讲解](https://www.youtube.com/watch?v=af1oqpnH1vA)
## **Pseudocode**
```pseudo
KMP(T, P):
	n = T.length
	m = P.length
	next = Compute_next(P)
	k = 0

	for i from 1 to n:
		while k > 0 and P[k+1] != T[i]:
			k = next[k]
		if P[k+1] == T[i]:
			k += 1
		if k == m:
			print "Pattern found at index, {i-m+1}"    // match
			k = next[k]    // 繼續找下一組
```

```pseudo
Compute_next(P):
	m = length[P]
	next = {0}
	k = 0    // 最長 prefix 的長度
	
	for j from 2 to m:
		while k > 0 and p[k+1] != p[j]:
			k = next[k]
		if p[k+1] == p[j]:
			k += 1
		next[j] = k
	return next
```
---

## **Tracing Example**
- [ ] 
