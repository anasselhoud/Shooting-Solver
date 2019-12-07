# Shooting method applied to Stability of Mixture layer problem.

In this problem, we will program using Matlab and Python the Shooting method used to solving a boudary value problem (different from Cauchy problem). Our method is applied for a turbulence problem related to Fluid dynamics. 

## Install
Download the project files (Either for Matlab or Python)
Run resolution1.m in the MATLAB Command Window (automatically adds project files to your MATLAB path, downloads the required files).
You can modify the code according to the problem you are trying to solve. The comments explain some data and values.

## Matlab version
I used MAtlab R2019b  but the main methods in general should work on version R2014b or newer. ode45 function requires version R2016a or newer. Some of the plot decorations require newer versions that support structure properties in figures. 


## Shooting method: An overview
In thid part, I will explain the shooting method in a more detailed way. The shooting method consists of rewriting this boundary problem as a differential equation.


Copyright 2019 Anass Elhoud

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
