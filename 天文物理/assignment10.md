name : 楊承叡
student ID : 110502545 
date of submission : 2025-05-07
assignment number : #10

---

## Script
```python
import matplotlib.pyplot as plt
import numpy as np

class GlobularClusterPlotter:
    def __init__(self, data_file):
        self.data_file = data_file
        self.x_coords = []
        self.y_coords = []
        self.z_coords = []
        self.names = []

    def read_data(self):
        with open(self.data_file, 'r') as file:
            for line in file:
                if line.strip() and not line.startswith('ID'):
                    parts = line.split()
                    try:
                        x = float(parts[8])
                        y = float(parts[9])
                        z = float(parts[10])
                        name = parts[1] if len(parts[1]) > 1 else parts[0]
                        self.x_coords.append(x)
                        self.y_coords.append(y)
                        self.z_coords.append(z)
                        self.names.append(name)
                    except (IndexError, ValueError):
                        continue

    def create_plot(self):
        fig = plt.figure(figsize=(10, 8))
        ax = fig.add_subplot(111)
        ax.scatter(self.x_coords, self.y_coords, c='blue', marker='o',
                   s=50, label='Globular Clusters', alpha=0.6)
        ax.scatter(0, 0, c='red', marker='*', s=200,
                   label='Galactic Center')
        ax.scatter(8, 0, c='yellow', marker='o', s=150,
                   label='Sun')
        ax.set_title('Globular Clusters in the Milky Way (X-Y Plane)',
                     fontsize=14, pad=10)
        ax.set_xlabel('X (kpc)', fontsize=12)
        ax.set_ylabel('Y (kpc)', fontsize=12)
        ax.legend(fontsize=10)
        ax.grid(True, linestyle='--', alpha=0.7)
        ax.set_xlim(-150, 150)
        ax.set_ylim(-150, 150)
        plt.show()
        fig.savefig('globular_clusters_xy.png', dpi=300, bbox_inches='tight')
        plt.close(fig)

def main():
    plotter = GlobularClusterPlotter('mwgc.dat')
    plotter.read_data()
    plotter.create_plot()

if __name__ == "__main__":
    main()
```


---

## Output of Execution
![[Pasted image 20250507182845.png]]

---

## Description
1. **Class Design (`GlobularClusterPlotter`)**
   - The code uses an object-oriented approach by encapsulating data reading and plotting functionality in a class, improving code organization and maintainability.
   - The `__init__` method initializes the data file path and lists to store coordinates (X, Y, Z) and cluster names.

2. **Data Reading (`read_data`)**
   - Opens the `mwgc.dat` file and reads it line by line.
   - Skips empty lines or header rows, extracting X, Y, Z coordinates (columns 9, 10, 11) and the cluster name (preferring column 2, falling back to column 1 if column 2 is too short).
   - Uses `try-except` to handle potential formatting errors in the data.

3. **Plotting Functionality (`create_plot`)**
   - Utilizes Matplotlib’s pure object-oriented interface (`Figure` and `Axes`) for plotting.
   - Plots globular clusters as blue scatter points, the Galactic Center as a red star at (0, 0), and the Sun as a yellow circle at (8, 0), assuming R_0 = 8 kpc.
   - Configures plot attributes, including title, axis labels, legend, grid, and axis limits.
   - Saves the plot as a PNG file (`globular_clusters_xy.png`) with high resolution (dpi=300) and closes the figure to free memory.

4. **Main Function (`main`)**
   - Creates an instance of `GlobularClusterPlotter`, calls the data reading method, and generates the plot.