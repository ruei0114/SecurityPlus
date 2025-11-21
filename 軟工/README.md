```shell
# 編譯
gcc -o p1 p1.c sem.c
gcc -o p2 p2.c sem.c
gcc -o p3 p3.c sem.c

# 執行
./p1 & ./p2 & ./p3 & 
```
## P1.c
```cpp
#include <stdio.h>
#include "awk_sem.h"

main() {
    int i = 0 ;
    // *** Please insert proper semaphore initialization here
    int sem1 = create_sem(".", 'A', 2); // p1 -> p2
    int sem2 = create_sem(".", 'B', 0); // P2 -> P3
    int sem3 = create_sem(".", 'C', 0); // P3 -> P1
    // int sem4 = create_sem(".", 'D', 1)

    do {
        // *** this is where you should place semaphore 
        P(sem1);
        P(sem1);
        printf("P1111111111 is here\n"); i++;
       
        // *** this is where you should place semaphore
        V(sem2);
   
    }  while (i < 100) ;
}
```
- `int sem1 = create_sem(".", 'A', 2);`
	- P1 wait 
	- P3 signal
	- 初始值 `2` : 因為 `p3` 會執行兩次  $\iff$ V(sem1) 會執行兩次
- `int sem2 = create_sem(".", 'B', 0);`
	- P2 wait 
	- P1 signal
- `int sem3 = create_sem(".", 'C', 0);`
	- P3 wait 
	- P2 signal
- `P(sem1);` : 有兩次，因為 `p3` 執行兩次
- `V(sem2);` : signal p2

---

## P2.c
```cpp
#include <stdio.h>
#include "awk_sem.h"

main() {
    int i = 0 ;
    // *** please insert proper semaphore initialization here
    int sem2 = get_sem(".", 'B');
    int sem3 = get_sem(".", 'C');

    do {
        // *** this is where you should place semaphore 
       P(sem2);
       printf("P222222222 is here\n"); i++ ;
       
       // *** this is where you should place semaphore
       V(sem3);
       V(sem3);
   
    }  while (i < 100);
}
```
- `P(sem2);` : 等待被 p1 喚醒
- `V(sem3);` : 有兩次，讓 `p3` 能夠執行兩次

---

## P3.c
```cpp
#include <stdio.h>
#include "awk_sem.h"

main() {
    int i = 0 ;
    // *** please insert proper semaphore initialization here
    int sem1 = get_sem(".", 'A');
    int sem3 = get_sem(".", 'C');

    do {
        // *** this is where you should place semaphore 
       P(sem3);
       printf("P3333333 is here\n"); i++ ;
       
       V(sem1);

       // *** this is where you should place semaphore
     
    }  while (i< 200);
}
```

- 執行兩次後喚醒 `p1` (V(sem) 呼叫了兩次)
