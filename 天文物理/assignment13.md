name : 楊承叡
student ID : 110502545 
date of submission : 2025-05-28
assignment number : #13

---

## Script
```python
# Script to analyze NEA.txt, calculate perihelion/aphelion distances, and identify Earth-crossing asteroids

def parse_packed_designation(packed):
    """Convert packed designation to readable form if necessary."""
    return packed.strip()

# Earth's orbital boundaries (approximate)
EARTH_PERIHELION = 0.983  # AU
EARTH_APHELION = 1.017    # AU

# Initialize counter for Earth-crossing asteroids
earth_crossers_count = 0
earth_crossers = []

try:
    with open("NEA.txt", "r") as file:
        for line in file:
            # Extract relevant fields using fixed-width columns
            packed_designation = line[0:7].strip()              # Columns 1-7: Packed designation
            eccentricity = float(line[70:79].strip())          # Columns 71-79: Eccentricity
            semi_major_axis = float(line[92:103].strip())      # Columns 93-103: Semi-major axis
            flags = line[161:165].strip()                      # Columns 162-165: Flags
            readable_designation = line[166:194].strip()       # Columns 167-194: Readable designation

            # Check if the object is an NEO (bit 11, value 2048)
            if flags and int(flags, 16) & 2048:
                # Calculate perihelion and aphelion distances
                perihelion = semi_major_axis * (1 - eccentricity)
                aphelion = semi_major_axis * (1 + eccentricity)

                # Check if the asteroid crosses Earth's orbit
                if perihelion <= EARTH_APHELION and aphelion >= EARTH_PERIHELION:
                    earth_crossers_count += 1
                    # Use readable designation if available, otherwise packed designation
                    designation = readable_designation if readable_designation else parse_packed_designation(packed_designation)
                    earth_crossers.append({
                        "designation": designation,
                        "semi_major_axis": semi_major_axis,
                        "eccentricity": eccentricity,
                        "perihelion": perihelion,
                        "aphelion": aphelion
                    })

    # Print results in a formatted table
    print("Earth-Crossing Near-Earth Asteroids:")
    print(f"{'Designation':<30} {'a (AU)':>10} {'e':>10} {'q (AU)':>10} {'Q (AU)':>10}")
    print("-" * 70)
    for asteroid in earth_crossers:
        print(f"{asteroid['designation']:<30} {asteroid['semi_major_axis']:>10.7f} {asteroid['eccentricity']:>10.7f} {asteroid['perihelion']:>10.7f} {asteroid['aphelion']:>10.7f}")

    print(f"\nTotal number of possible Earth-crossing asteroids: {earth_crossers_count}")

except FileNotFoundError:
    print("Error: NEA.txt file not found.")
except Exception as e:
    print(f"Error processing file: {e}")
```


---

## Output of Execution
![[Pasted image 20250528185248.png]]

---

## Description

### 1. **Constants**

```python
EARTH_PERIHELION = 0.983  # Earth's perihelion in AU
EARTH_APHELION = 1.017    # Earth's aphelion in AU
```

These values define Earth’s orbital bounds to compare with asteroid orbits.

---

### 2. **File Reading and Data Extraction**

The script reads each line from `NEA.txt`, extracting fields using fixed-width column positions:

```python
packed_designation = line[0:7].strip()        # Packed ID (columns 1–7)
eccentricity = float(line[70:79].strip())     # Eccentricity (columns 71–79)
semi_major_axis = float(line[92:103].strip()) # Semi-major axis a (columns 93–103)
flags = line[161:165].strip()                 # Object flags (columns 162–165)
readable_designation = line[166:194].strip()  # Human-readable name (columns 167–194)
```

---

### 3. **NEO Identification**

This bitwise check determines if an object is a **Near-Earth Object (NEO)**:

```python
int(flags, 16) & 2048
```

The `2048` value corresponds to bit 11 being set in the hexadecimal `flags` field, indicating NEO status.

---

### 4. **Perihelion and Aphelion Calculation**

For each NEO:

```python
perihelion = a * (1 - e)
aphelion = a * (1 + e)
```

Where `a` is the semi-major axis, and `e` is the eccentricity.

---

### 5. **Earth-Crossing Check**

An object is classified as **Earth-crossing** if:

```python
perihelion ≤ Earth’s aphelion AND aphelion ≥ Earth’s perihelion
```

This means the asteroid’s orbit overlaps Earth’s orbital zone.

---

### 6. **Result Output**

For each Earth-crossing asteroid, it prints:

- Designation (readable or packed)
    
- Semi-major axis `a`
    
- Eccentricity `e`
    
- Perihelion `q`
    
- Aphelion `Q`
    

Formatted neatly in a table, followed by a count of total Earth-crossing NEAs found.

---

### 7. **Error Handling**

- `FileNotFoundError`: If `NEA.txt` is missing.
    
- Generic `Exception`: For unexpected errors (e.g., parsing issues).