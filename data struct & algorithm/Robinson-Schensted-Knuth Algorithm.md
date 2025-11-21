page:: 80

[GROK](https://grok.com/share/bGVnYWN5_bfba8653-1aee-4b6d-92fd-b510b51e38e0)
## **Pseudocode**
```pseudo
// A 是輸入的數列
Greedy-LIS(A, n):
	p[1..n]    // p 紀錄直到 A[i] 所形成的 LIS 長度
	s = [A[1]]    // s 紀錄目前到 A[i] 的 LIS
	max = 1    // 目前 LIS 長度
	
	for i from 2 to n:
		// binary search 找到"大於 A[i] 的最小值" (Least Upper Bound) 位置
		// 若找不到 k , k = s.length+1
		k = Search-LUB(s, A[i])
		p[i] = k
		if k>max:
			s.append(a[i])
			max = k
		else:
			s[k] = A[i]
	return max, p
```

```pseudo
Construct-LIS(A, p, max):
	i = n
	j = max
	while j>0:
		if p[i]==j:    // Greedy-LIS 中找到 LIS 的地方
			LIS[j] = A[i]
			j -= 1
		i -= 1
	return LIS
```

---

## **Tracing Example**
- [x] 
