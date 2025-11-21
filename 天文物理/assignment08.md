name : 楊承叡
student ID : 110502545 
date of submission : 2025-04-16
assignment number : #08

---

## Script
```python
stars = []
with open('hip_main.dat', 'r') as file:
    for line in file:
        hip = int(line[9:14].strip())  
        vmag = float(line[42:46].strip()) if line[42:46].strip() else None  
        plx = float(line[80:86].strip()) if line[80:86].strip() else None  
        sptype = line[436:447].strip()  

        if vmag is None or plx is None or plx <= 0:
            continue

        distance = 1000 / plx  
  
        import math
        abs_magnitude = vmag - 5 * math.log10(distance) + 5

        stars.append({
            'HIP': hip,
            'distance': distance,
            'Vmag': vmag,
            'abs_magnitude': abs_magnitude,
            'sptype': sptype
        })

brightest_star = min(stars, key=lambda x: x['abs_magnitude'])

print(f"The brightest star (based on V-band absolute magnitude):")
print(f"HIP number: {brightest_star['HIP']}")
print(f"Distance (parsecs): {brightest_star['distance']:.2f}")
print(f"V-band apparent magnitude: {brightest_star['Vmag']:.2f}")
print(f"V-band absolute magnitude: {brightest_star['abs_magnitude']:.2f}")
print(f"Spectral type: {brightest_star['sptype']}")
```

---

## Output of Execution
![[Pasted image 20250416213905.png]]
---

## Description
- `distance = 1000 / plx` : Calculate distance in parsecs, converting parallax from mas to parsecs
- Calculate V-band absolute magnitude: M_v = m_v - 5 * log10(d) + 5
  ```
	import math 
	abs_magnitude = vmag - 5 * math.log10(distance) + 5
    ```
- `brightest_star = min(stars, key=lambda x: x['abs_magnitude'])` : 
  Find the brightest star based on absolute magnitude (smallest value).