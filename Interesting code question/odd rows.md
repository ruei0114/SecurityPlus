Joana喜歡玩關於奇數的遊戲。有一天，她開始寫，每列都是奇數，如下表。

 1  
 3  5  7  
 9 11 13 15 17  
19 21 23 25 27 29 31  
...在某一列Joana寫下了55個奇數數字，你可以看出該列最後3個數字的乘積嗎？  
給你一個數字N，代表某一列有N個奇數數字，你的任務是把該列最後三個數相乘起來。 

**Input**

第一行表示輸入含有n組測試資料。

每組測試資料一列，有一個數字 N，表示某一列有 N 個奇數數字（_1 < N < 1000000000_）。

**Output**

對每組測試資料，輸出該列的最後三個數字的乘積。本問題中保證三個數字的積一定小於263。

|   |   |
|---|---|
|**Sample Input**|**Sample Output**|
|3<br><br>3  <br>5  <br>7|105  <br>3315  <br>24273|

---
```cpp
#include<iostream>  
#include<cstdio>  
using namespace std;  
  
int main(){  
    long long N, sum;  
    int n;  
    cin >> n;  
    for (int i=0; i<n; i++){  
        scanf( "%lld", &N );  
        sum = (N+1)/2; // row number;  
        sum = sum*sum*2-1; // the last number of that row;  
        sum = sum * (sum-2) * (sum-4);  
        printf( "%lld\n", sum );  
    }  
}
```