name : 楊承叡
student ID : 110502545 
date of submission : 2025-06-07
assignment number : #14

---

## Script
```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

# Constants
g = 9.81  # Gravitational acceleration (m/s^2)
m = 0.1   # Mass of the ball (kg)
r = 0.05  # Radius of the ball (m)
v0 = 30.0  # Initial velocity (m/s)
theta = np.radians(40)  # Initial angle (converted to radians)
A = np.pi * r**2  # Cross-sectional area of the ball (m^2)
rho = 1.225  # Air density (kg/m^3), standard atmospheric density
C_D = 0.47   # Drag coefficient, typical for a spherical object

# Case A: Gravity only
def motion_no_drag(state, t):
    x, vx, y, vy = state
    dx_dt = vx
    dvx_dt = 0
    dy_dt = vy
    dvy_dt = -g
    return [dx_dt, dvx_dt, dy_dt, dvy_dt]

# Case B: Gravity and air drag
def motion_with_drag(state, t):
    x, vx, y, vy = state
    v = np.sqrt(vx**2 + vy**2)  # Velocity magnitude
    if v == 0:
        ax = ay = 0
    else:
        # Air drag force f_a = - (1/2) * C_D * A * rho * v^2, opposite to velocity
        f_a = 0.5 * C_D * A * rho * v**2
        ax = - (f_a / m) * (vx / v)
        ay = -g - (f_a / m) * (vy / v)
    return [vx, ax, vy, ay]

# Initial conditions
x0 = 0
y0 = 0
vx0 = v0 * np.cos(theta)
vy0 = v0 * np.sin(theta)
state0 = [x0, vx0, y0, vy0]

# Time points
t = np.linspace(0, 5, 1000)  # 0 to 5 seconds, 1000 points

# Numerical solution
sol_no_drag = odeint(motion_no_drag, state0, t)
sol_with_drag = odeint(motion_with_drag, state0, t)

# Extract positions
x_no_drag = sol_no_drag[:, 0]
y_no_drag = sol_no_drag[:, 2]
x_with_drag = sol_with_drag[:, 0]
y_with_drag = sol_with_drag[:, 2]

# Keep data where y >= 0 (before the ball hits the ground)
mask_no_drag = y_no_drag >= 0
mask_with_drag = y_with_drag >= 0
x_no_drag = x_no_drag[mask_no_drag]
y_no_drag = y_no_drag[mask_no_drag]
x_with_drag = x_with_drag[mask_with_drag]
y_with_drag = y_with_drag[mask_with_drag]

# Plot trajectories
plt.figure(figsize=(10, 6))
plt.plot(x_no_drag, y_no_drag, label='Gravity Only', color='blue')
plt.plot(x_with_drag, y_with_drag, label='Gravity with Air Drag', color='red', linestyle='--')
plt.xlabel('Horizontal Distance (m)')
plt.ylabel('Vertical Height (m)')
plt.title('Projectile Motion Trajectory Comparison')
plt.legend()
plt.grid(True)
plt.show()

# Calculate range and flight time
range_no_drag = x_no_drag[-1]
range_with_drag = x_with_drag[-1]
time_no_drag = t[mask_no_drag][-1]
time_with_drag = t[mask_with_drag][-1]

print(f"Case A (Gravity Only):")
print(f"  Range: {range_no_drag:.2f} m")
print(f"  Flight Time: {time_no_drag:.2f} s")
print(f"Case B (Gravity with Air Drag):")
print(f"  Range: {range_with_drag:.2f} m") 
print(f"  Flight Time: {time_with_drag:.2f} s")
```


---

## Output of Execution
![[Pasted image 20250607134023.png]]
```
Case A (Gravity Only): 
	Range: 90.29 m 
	Flight Time: 3.93 s 
Case B (Gravity with Air Drag): 
	Range: 39.72 m 
	Flight Time: 3.03 s
```

---

## Description

### 1. Constants Definition
```python
g = 9.81  # Gravitational acceleration (m/s^2)
m = 0.1   # Mass of the ball (kg)
r = 0.05  # Radius of the ball (m)
v0 = 30.0  # Initial velocity (m/s)
theta = np.radians(40)  # Initial angle (converted to radians)
A = np.pi * r**2  # Cross-sectional area of the ball (m^2)
rho = 1.225  # Air density (kg/m^3), standard atmospheric density
C_D = 0.47   # Drag coefficient, typical for a spherical object
```
- **Function**: Defines physical constants, including gravitational acceleration, ball mass and radius, initial velocity and angle, cross-sectional area, air density, and drag coefficient.
- **Physical Significance**:
  - $( \rho = 1.225 \, \text{kg/m}^3 )$: Standard air density at sea level.
  - $( C_D = 0.47 )$: Typical drag coefficient for a spherical object in turbulent flow (e.g., a baseball).
  - Angle converted to radians for trigonometric calculations.

---

### 2. Equations of Motion
#### Case A: Gravity Only
```python
def motion_no_drag(state, t):
    x, vx, y, vy = state
    dx_dt = vx
    dvx_dt = 0
    dy_dt = vy
    dvy_dt = -g
    return [dx_dt, dvx_dt, dy_dt, dvy_dt]
```
- **Function**: Defines the equations of motion for a projectile under gravity alone, expressed as a system of first-order differential equations.
- **Physical Significance**:
  - Horizontal acceleration is zero $( \frac{dv_x}{dt} = 0 )$, so $( v_x )$ is constant.
  - Vertical acceleration is $( \frac{dv_y}{dt} = -g )$, resulting in a parabolic trajectory.
  - State vector `[x, vx, y, vy]` represents position and velocity components.

#### Case B: Gravity with Air Drag
```python
def motion_with_drag(state, t):
    x, vx, y, vy = state
    v = np.sqrt(vx**2 + vy**2)  # Velocity magnitude
    if v == 0:
        ax = ay = 0
    else:
        f_a = 0.5 * C_D * A * rho * v**2
        ax = - (f_a / m) * (vx / v)
        ay = -g - (f_a / m) * (vy / v)
    return [vx, ax, vy, ay]
```
- **Function**: Defines equations of motion including air drag, where drag force is proportional to the square of velocity and opposite to the velocity direction.
- **Physical Significance**:
  - Air drag force: $( f_a = \frac{1}{2} C_D A \rho v^2 )$, split into horizontal and vertical components.
  - Horizontal acceleration: $( a_x = -\frac{f_a}{m} \frac{v_x}{v} )$.
  - Vertical acceleration: $( a_y = -g - \frac{f_a}{m} \frac{v_y}{v} )$.
  - Checks for $( v = 0 )$ to avoid division by zero.
- **Note**: The return `[vx, ax, vy, ay]` is consistent with the state derivatives, matching the format of `motion_no_drag`.

---

### 3. Initial Conditions and Numerical Solution
```python
x0 = 0
y0 = 0
vx0 = v0 * np.cos(theta)
vy0 = v0 * np.sin(theta)
state0 = [x0, vx0, y0, vy0]
t = np.linspace(0, 5, 1000)
sol_no_drag = odeint(motion_no_drag, state0, t)
sol_with_drag = odeint(motion_with_drag, state0, t)
```
- **Function**:
  - Sets initial conditions: position $( x_0 = 0, y_0 = 0 )$ and velocity components $( v_{x0} = v_0 \cos \theta, v_{y0} = v_0 \sin \theta )$.
  - Uses `odeint` to numerically solve the differential equations for both cases over 0 to 5 seconds with 1000 time points.
- **Physical Significance**: Simulates a projectile launched at 40° with 30 m/s initial velocity.

---

### 4. Data Processing
```python
x_no_drag = sol_no_drag[:, 0]
y_no_drag = sol_no_drag[:, 2]
x_with_drag = sol_with_drag[:, 0]
y_with_drag = sol_with_drag[:, 2]
mask_no_drag = y_no_drag >= 0
mask_with_drag = y_with_drag >= 0
x_no_drag = x_no_drag[mask_no_drag]
y_no_drag = y_no_drag[mask_no_drag]
x_with_drag = x_with_drag[mask_with_drag]
y_with_drag = y_with_drag[mask_with_drag]
```
- **Function**:
  - Extracts x and y positions from the solution arrays (`sol_no_drag`, `sol_with_drag`).
  - Filters data to include only points where $( y \geq 0 )$, representing the trajectory before the ball hits the ground.
- **Physical Significance**: Ensures only physically relevant data (airborne motion) is used for plotting and analysis.

---

### 5. Plotting Trajectories
```python
plt.figure(figsize=(10, 6))
plt.plot(x_no_drag, y_no_drag, label='Gravity Only', color='blue')
plt.plot(x_with_drag, y_with_drag, label='Gravity with Air Drag', color='red', linestyle='--')
plt.xlabel('Horizontal Distance (m)')
plt.ylabel('Vertical Height (m)')
plt.title('Projectile Motion Trajectory Comparison')
plt.legend()
plt.grid(True)
plt.show()
```
- **Function**:
  - Creates a 10x6-inch plot showing two trajectories: blue solid line (gravity only) and red dashed line (gravity with air drag).
  - Adds axis labels, title, legend, and grid.
- **Physical Significance**: Visualizes how air drag reduces range and alters the trajectory from a parabola to a steeper curve.

---

### 6. Range and Flight Time Calculation
```python
range_no_drag = x_no_drag[-1]
range_with_drag = x_with_drag[-1]
time_no_drag = t[mask_no_drag][-1]
time_with_drag = t[mask_with_drag][-1]
print(f"Case A (Gravity Only):")
print(f"  Range: {range_no_drag:.2f} m")
print(f"  Flight Time: {time_no_drag:.2f} s")
print(f"Case B (Gravity with Air Drag):")
print(f"  Range: {range_with_drag:.2f} m")
print(f"  Flight Time: {time_with_drag:.2f} s")
```
- **Function**:
  - Calculates the range (final x-position) and flight time (final time point) for both cases.
  - Prints results with two decimal places.
- **Physical Significance**:
  - Case A has a longer range and flight time due to the absence of air drag.
  - Case B shows reduced range and time due to drag slowing the projectile.