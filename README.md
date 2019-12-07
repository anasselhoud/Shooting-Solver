
# Shooting method applied to Stability of Mixture layer problem.

In this problem, we will program using Matlab and Python the Shooting method used to solving a boudary value problem (different from Cauchy problem). Our method is applied for a turbulence problem related to Fluid dynamics. 

### Install
Download the project files (Either for Matlab or Python)
Run resolution1.m in the MATLAB Command Window (automatically adds project files to your MATLAB path, downloads the required files).
You can modify the code according to the problem you are trying to solve. The comments explain some data and values.

### Matlab version
I used MAtlab R2019b  but the main methods in general should work on version R2014b or newer. ode45 function requires version R2016a or newer. Some of the plot decorations require newer versions that support structure properties in figures. 


## Shooting method: An overview
In thid part, I will explain the shooting method in a more detailed way. The shooting method consists of rewriting this boundary problem as a differential equation.

![](https://i.ibb.co/HppHBBn/Capture-d-e-cran-2019-12-07-a-15-28-30.png =250x250)

<img src="https://i.ibb.co/HppHBBn/Capture-d-e-cran-2019-12-07-a-15-28-30.png" width="200">


