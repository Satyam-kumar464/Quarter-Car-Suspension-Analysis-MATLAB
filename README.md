# Dynamic Analysis of a Quarter-Car Suspension System Using MATLAB/Simulink
## Overview

This project presents the dynamic analysis of a simplified two-degree-of-freedom
(2-DOF) quarter-car suspension system using MATLAB and Simulink under
sinusoidal road excitation.

The model represents one wheel assembly and the corresponding portion of the
vehicle body. The system consists of a sprung mass, unsprung mass, suspension
spring, suspension damper, tyre stiffness, and a prescribed sinusoidal road
profile.

The project combines mathematical modelling, numerical simulation using
MATLAB's `ode45` solver, and block-diagram implementation in Simulink.
<p align="center">
  <img width="1536" height="1024" alt="real_img" src="https://github.com/user-attachments/assets/adba9af6-805e-47b8-b985-5e610723d994" />
</p>
*Simplified 2-DOF quarter-car suspension model.*

## Objectives

- Develop a mathematical model of a 2-DOF quarter-car suspension system.
- Derive the equations of motion for the sprung and unsprung masses.
- Implement the model in MATLAB.
- Solve the governing differential equations using `ode45`.
- Implement the same system in Simulink.
- Analyze body and wheel displacement responses.
- Calculate suspension and tyre deflection.
- Evaluate vehicle body acceleration.
- Investigate the effect of suspension damping.
- Investigate the effect of vehicle velocity.

## Quarter-Car Model

The quarter-car model consists of two degrees of freedom:

- \(x_s\): sprung-mass displacement
- \(x_u\): unsprung-mass displacement

The model includes:

- Sprung mass \(m_s\)
- Unsprung mass \(m_u\)
- Suspension stiffness \(k_s\)
- Suspension damping \(c_s\)
- Tyre stiffness \(k_t\)
- Road displacement \(x_r(t)\)

## Governing Equations

### Sprung Mass

The equation of motion for the sprung mass is:

**mₛ ẍₛ = −kₛ(xₛ − xᵤ) − cₛ(ẋₛ − ẋᵤ)**

### Unsprung Mass

The equation of motion for the unsprung mass is:

**mᵤ ẍᵤ = kₛ(xₛ − xᵤ) + cₛ(ẋₛ − ẋᵤ) − kₜ(xᵤ − xᵣ)**

---

## Road Excitation

The road profile is modelled as a sinusoidal input:

**xᵣ(t) = A sin(2π(v/λ)t)**

where:

- **A** = road amplitude
- **v** = vehicle velocity
- **λ** = road wavelength

The excitation frequency is:

**f = v/λ**

and the angular frequency is:

**ω = 2πf**

For the baseline simulation:

| Parameter | Value |
|---|---:|
| Road amplitude, **A** | 0.05 m |
| Road wavelength, **λ** | 5 m |
| Vehicle velocity, **v** | 5 m/s |
| Excitation frequency, **f** | 1 Hz |
| Angular frequency, **ω** | 2π rad/s |

## Simulation Parameters

| Parameter | Symbol | Value | Unit |
|---|---:|---:|---|
| Sprung mass | \(m_s\) | 300 | kg |
| Unsprung mass | \(m_u\) | 40 | kg |
| Suspension stiffness | \(k_s\) | 15000 | N/m |
| Suspension damping | \(c_s\) | 1500 | N·s/m |
| Tyre stiffness | \(k_t\) | 150000 | N/m |
| Road amplitude | \(A\) | 0.05 | m |
| Road wavelength | \(\lambda\) | 5 | m |
| Vehicle velocity | \(v\) | 5 | m/s |
| Simulation time | \(t_{sim}\) | 1 | s |

## MATLAB Implementation

The mathematical model is implemented using two MATLAB files:

```text
MATLAB/
├── quarter_car_simulation.m
└── quarter_car_ode.m


```

# 14. Simulink implementation

The quarter-car system is also implemented using Simulink.

The Simulink folder contains:

```text
Simulink/
├── quarter_car_suspension.slx
└── quarter_car_parameters.m
```

---

## Performance Parameters

The following quantities are evaluated from the simulation:

| Performance Parameter | Definition |
|---|---|
| Maximum body displacement | Maximum absolute value of body displacement \(x_s\) |
| Maximum wheel displacement | Maximum absolute value of wheel displacement \(x_u\) |
| Maximum body acceleration | Maximum absolute value of body acceleration \(\ddot{x}_s\) |
| Maximum suspension deflection | Maximum absolute value of \(x_s-x_u\) |
| Maximum tyre deflection | Maximum absolute value of \(x_u-x_r\) |

## Results and Analysis

The dynamic response of the quarter-car model was investigated under
sinusoidal road excitation.

The analysis includes:

1. Baseline response
2. Effect of suspension damping
3. Effect of vehicle velocity

### Baseline Response

The baseline simulation uses:

\[
c_s=1500\;N\,s/m
\]

and

\[
v=5\;m/s
\]

The corresponding road excitation frequency is:

\[
f=1\;Hz
\]

<p align="center">
  <img width="1804" height="957" alt="all_3" src="https://github.com/user-attachments/assets/7563ad1c-fd40-4a11-a9e2-d72a0cdb563f" />

</p>

### Effect of Suspension Damping

The effect of suspension damping was investigated for:

\[
c_s=500,\;1000,\;1500\;N\,s/m
\]

while maintaining the vehicle velocity at:

\[
v=5\;m/s
\]

The maximum body displacement, suspension deflection, wheel displacement,
and body acceleration were compared for the different damping values.

<p align="center">
  <img width="1042" height="736" alt="body_des_vs_cs" src="https://github.com/user-attachments/assets/d21507c5-240d-4356-9d5c-215de48785e2" />

</p>
 <img width="1118" height="720" alt="sus_cs" src="https://github.com/user-attachments/assets/7df9678b-8952-4d66-a1b2-86fecb70e0ed" />

<p align="center">
  <img width="1074" height="661" alt="wheel_cs" src="https://github.com/user-attachments/assets/39f458cf-3dfc-4ff1-9469-cf96d12c6cda" />

</p>
<p align="center">
  <img width="1653" height="993" alt="acc_cs" src="https://github.com/user-attachments/assets/fdc301de-d752-4890-a7c7-5eaf0db27055" />

</p>

### Effect of Vehicle Velocity

The effect of vehicle velocity was investigated for:

\[
v=5,\;10,\;15\;m/s
\]

with the suspension damping maintained at:

\[
c_s=1500\;N\,s/m
\]

Since

\[
f=\frac{v}{\lambda},
\]

increasing vehicle velocity increases the frequency of the sinusoidal road
excitation.

<p align="center">
  <img width="1047" height="683" alt="body_v" src="https://github.com/user-attachments/assets/cc7eb9d2-cc82-4cfb-89ac-11f3268444fc" />

  </p>
<p align="center">
  <img width="1065" height="761" alt="sus_v" src="https://github.com/user-attachments/assets/e211187c-7e5c-4ddb-ac08-e3c0f5f2a86d" />

  </p>
<p align="center">
  <img width="1050" height="727" alt="wheel_v" src="https://github.com/user-attachments/assets/4639d709-be9c-4bb8-9249-09e795b0eb17" />

  </p>
<p align="center">
  <img width="1653" height="993" alt="acc_v" src="https://github.com/user-attachments/assets/dafdfc34-aa55-41e8-aef1-0526b7bd6dab" />

  </p>

  ## Key Observations

### Damping Study

For the tested damping values, increasing the suspension damping coefficient
reduced the maximum body displacement, suspension deflection, wheel
displacement, and body acceleration.

The maximum body displacement decreased from approximately 0.11230 m at
\(c_s=500\;N\,s/m\) to 0.06463 m at \(c_s=1500\;N\,s/m\).

### Velocity Study

Increasing vehicle velocity changes the road excitation frequency.

For the simulated cases, increasing velocity from 5 m/s to 15 m/s resulted in:

- Decreasing maximum body displacement
- Decreasing maximum suspension deflection
- Increasing maximum wheel displacement
- Increasing maximum body acceleration

These observations apply to the parameter range and sinusoidal excitation
used in this study.

## Tools and Technologies

- MATLAB
- Simulink
- MATLAB `ode45`

## Engineering Concepts Demonstrated

- Mechanical vibrations
- Vehicle dynamics
- Suspension systems
- Two-degree-of-freedom systems
- Free-body diagrams
- Differential equations
- Numerical methods
- MATLAB programming
- Simulink modelling
- Dynamic response analysis
- Parametric studies

## Model Limitations

The model uses several simplifying assumptions:

- Linear suspension spring
- Linear viscous damper
- Linear tyre stiffness
- Vertical motion only
- Constant vehicle velocity
- Sinusoidal road excitation
- No pitch or roll dynamics
- No tyre damping
- No nonlinear suspension characteristics
- No detailed suspension geometry
- Continuous tyre-road contact

## Future Work

Possible extensions of the model include:

- Nonlinear suspension characteristics
- Nonlinear tyre behaviour
- Random road profiles
- Frequency-response analysis
- Full-car modelling
- Pitch and roll dynamics
- Suspension geometry modelling
- Ride comfort evaluation using RMS acceleration
- Suspension parameter optimization
- Experimental validation

## Technical Report

A detailed mathematical formulation, modelling methodology, simulation
procedure, and discussion of results are provided in the technical report.

[View the Technical Report](Report/Quarter_Car_Suspension_Analysis.pdf)

## Author

**Satyam Kumar**

B.Tech. Mechanical Engineering  
Indian Institute of Technology Mandi
