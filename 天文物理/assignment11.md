name : 楊承叡
student ID : 110502545 
date of submission : 2025-05-15
assignment number : #11

---

## Script
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from astropy.coordinates import Galactic, ICRS
from astropy import units as u

colspecs = [(113, 120), (121, 128)]
colnames = ['GLON2', 'GLAT2']
data = pd.read_fwf('table2.dat', colspecs=colspecs, names=colnames)

data['GLON2'] = pd.to_numeric(data['GLON2'], errors='coerce')
data['GLAT2'] = pd.to_numeric(data['GLAT2'], errors='coerce')

data_clean = data.dropna(subset=['GLON2', 'GLAT2'])

galactic_longitudes_deg = data_clean['GLON2'].values
galactic_latitudes_deg = data_clean['GLAT2'].values

lon_rad = np.radians((galactic_longitudes_deg + 180) % 360 - 180)
lat_rad = np.radians(galactic_latitudes_deg)

fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection="mollweide")

scatter = ax.scatter(lon_rad, lat_rad, s=10, alpha=0.6, label='HII Regions')

ax.grid(True)

ax.set_title("Locations of HII Regions in Galactic Coordinates (Mollweide Projection)")
ax.set_xlabel("Galactic Longitude (radians)")
ax.set_ylabel("Galactic Latitude (radians)")
ax.legend()

xticks = np.arange(-np.pi, np.pi + np.pi / 6, np.pi / 6)
ax.set_xticks(xticks)
xticklabels = [f'{np.degrees(x):.0f}°' for x in xticks]
ax.set_xticklabels(xticklabels)

yticks = np.arange(-np.pi / 2, np.pi / 2 + np.pi / 6, np.pi / 6)
ax.set_yticks(yticks)
yticklabels = [f'{np.degrees(y):.0f}°' for y in yticks]
ax.set_yticklabels(yticklabels)

plt.show()
plt.savefig('hii_regions_galactic_mollweide.png', dpi=300, bbox_inches='tight')
plt.close(fig)

print("\nHII region locations have been visualized and saved as hii_regions_galactic_mollweide.png")
```


---

## Output of Execution
![[Pasted image 20250515130602.png]]

---

## Description

### 1. **Data Loading**

```python
colspecs = [(113, 120), (121, 128)]
colnames = ['GLON2', 'GLAT2']
data = pd.read_fwf('table2.dat', colspecs=colspecs, names=colnames)
```

- Reads specific column ranges from file (`table2.dat`).
- `GLON2` and `GLAT2` represent galactic longitude and latitude, respectively.

### 2. **Data Cleaning**

```python
data['GLON2'] = pd.to_numeric(data['GLON2'], errors='coerce')
data['GLAT2'] = pd.to_numeric(data['GLAT2'], errors='coerce')
data_clean = data.dropna(subset=['GLON2', 'GLAT2'])
```

- Converts values to numeric type, coercing invalid entries to NaN.
- Drops rows with missing galactic coordinates.

### 3. **Coordinate Transformation**

```python
lon_rad = np.radians((galactic_longitudes_deg + 180) % 360 - 180)
lat_rad = np.radians(galactic_latitudes_deg)
```

- Converts galactic longitudes and latitudes from degrees to radians.
- Adjusts longitude range to [-180°, 180°] for correct Mollweide mapping.

### 4. **Mollweide Projection Plotting**

```python
fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection="mollweide")
scatter = ax.scatter(lon_rad, lat_rad, s=10, alpha=0.6, label='HII Regions')
```

- Creates a Matplotlib figure using Mollweide projection.
- Plots HII region positions as scatter points with transparency.

### 5. **Axes and Labels**

```python
ax.grid(True)
ax.set_title("Locations of HII Regions in Galactic Coordinates (Mollweide Projection)")
ax.set_xlabel("Galactic Longitude (radians)")
ax.set_ylabel("Galactic Latitude (radians)")
ax.legend()
```

- Adds grid lines, labels, a title, and a legend for clarity.

### 6. **Custom Ticks**

```python
xticks = np.arange(-np.pi, np.pi + np.pi / 6, np.pi / 6)
xticklabels = [f'{np.degrees(x):.0f}°' for x in xticks]
ax.set_xticks(xticks)
ax.set_xticklabels(xticklabels)

yticks = np.arange(-np.pi / 2, np.pi / 2 + np.pi / 6, np.pi / 6)
yticklabels = [f'{np.degrees(y):.0f}°' for y in yticks]
ax.set_yticks(yticks)
ax.set_yticklabels(yticklabels)
```

- Converts tick positions from radians to degrees for better readability.

### 7. **Save and Display the Plot**

```python
plt.show()
plt.savefig('hii_regions_galactic_mollweide.png', dpi=300, bbox_inches='tight')
plt.close(fig)
```

- Displays the figure.
- Saves the plot to a high-resolution PNG image file.

### 8. **Confirmation Message**

```python
print("\nHII region locations have been visualized and saved as hii_regions_galactic_mollweide.png")
```

- Outputs a confirmation message to the console.