> [!info] LINK & TAG
> [cLibrary_reverse](https://cplusplus.com/reference/algorithm/reverse/)
> 
> #cPlusPlus #reverse

---

```cpp
#include<algorithm>

//reverse a vector
vector<int> v;
reverse(v.begin(), v.end());
```
- 雙指標法 time complexity: O(n)
	```
	template <typename BidirectionalIterator> 
	voidreverse(BidirectionalIteratorfirst,BidirectionalIterator last) {
		while (first != last && first != --last) { 
		//`first != last` 表示序列至少有一個元素，否則序列為空，不需要反轉。
			std::iter_swap(first++, last); 
		} 
	}
	```
