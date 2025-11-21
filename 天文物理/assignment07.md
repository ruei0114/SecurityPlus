name : 楊承叡
student ID : 110502545 
date of submission : 2025-04-09 
assignment number : #07

---

## Script
```python
with open("hip_main.dat.txt", "r") as file:
    total = 0
    count = 0
    
    for line in file:
        bv = line[245:251].strip()
        sptype = line[435:447].strip()

        if sptype == "G2V" and bv != "":
            count += 1
            total += float(bv)

    result = total / count
    print(f"Average B-V for G2V stars: {result}")
```

---

## Output of Execution
![[Pasted image 20250409161236.png]]

---

## Description
- **Condition Filtering and Calculation**:
    - Processes only lines where the spectral type is "G2V" and the B-V value is not empty.
    - count += 1: Keeps track of the number of qualifying stars.
    - total += float(bv): Converts the B-V value to a float and adds it to the running total.
- **Average Calculation**:
    - result = total / count: Computes the average B-V value for all qualifying stars.