
# Shooting method applied to Stability of Mixture layer problem.

In this problem, we implement an algorithm based on the shooting method using Matlab and Python the Shooting method is used to solve a boudary value problem (different from Cauchy problem). Our algorithm is tested on a turbulence problem related to Fluid dynamics. 

### Install
Download the project files (Either for Matlab or Python)
Run resolution1.m in the MATLAB Command Window (automatically adds project files to your MATLAB path, downloads the required files).
You can modify the code according to the problem you are trying to solve. The comments explain some data and values.

### Matlab version
I used MAtlab R2019b  but the main methods in general should work on version R2014b or newer. ode45 function requires version R2016a or newer. Some of the plot decorations require newer versions that support structure properties in figures. 


## Shooting method: An overview
In thid part, we will explain the shooting method in a more detailed way. The shooting method consists of rewriting this boundary problem as a differential equation.

The shooting method is a method for solving a boundary value problem by reducing it to a system of an initial value problem. In another way, we can say that we "shoot" out trajectories in different directions until we find a trajectory that has the desired boundary value.

The impletention of this method can be done using one of the numerical methods for partial differential equations, followed by a sophisticated Fixed-point iteration which should be adapted to the principale of shooting method.


The main Rayleigh Equation that we are trying to solve in this cas study is written by

<img src="https://i.ibb.co/HppHBBn/Capture-d-e-cran-2019-12-07-a-15-28-30.png" class="center" width="350"  >


After applying our algorithm, the figure bellow compare between the numerical results and the approximative analytic solution (which cannot predict the exact value when alpha is superior to 0.65. In this case, the numerical solving is required). 

![alt text](https://i.ibb.co/Pc3x0Z0/untitled.png)


