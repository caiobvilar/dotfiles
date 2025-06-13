# Basics
+ **Estimation** is the process of inferring the value of a quantity of interest from indirect, innacurate and uncertain observations;
+ **Tracking** is the estimation of the state of a moving object based on *remote measurements*. This is done using one or more sensors at fixed locations or on moving platforms;
	+ Tracking might seem to be a special case of estimation. However, it is wider in scope: not only does it use all the tools from estimation, but also requires extensiven use of statistical decision theory when some of the practical problems are considered.
+ **Filtering** is the estimation of the current state of a dynamic system (the reason for the name "filter" is that the process for obtaining the "best estimate" from noisy data amounts to "filtering out" the noise).
+ **Navigation** is the estimation of the state of the platform on which the sensor is located;
+ **Optimal Estimator** is the computational algorithm that processes observations (measurements) to yield an estimate of a variable of interest, which optimizes a certain criterion.
+ Estimation can be viewed as a scheme for *information extraction and enhancement*:
	+ Based on measurements (observations), we want to maximize our knowledge about a parameter, a state, a signal, an image, and so on;
+ In general, on can classify the variable that is to be estiumated into the following two categories:
	+ A parameter: time-invariant quantity (scalar, vector, matrix);
	+ The state of a dynamic system (usually a vector), which evolves in time according to a stochastic equation;
	+ Consequently one has two classes of estimators:
		+ Parameter Estimators;
		+ State Estimators.


![State Estimation-inmformation extraction and enhancement.svg](../../_resources/State%20Estimation-inmformation%20extraction%20and%20enhan.svg)


+ The figure above illustrates a block diagram of state estimation
	+ The first two blocks are black boxes. The only variales to which the estimator has access are the measurements, which are affected by the error sources in the form of "measurement noise"
+ The estimator uses knowledge about:
	+ The evolution of the variable (the system dynamics);
	+ The measurement model;
	+ The probabilistic characterization of the various random factors (disturbances);
	+ The prior information.
+ Optimal estimators make the best utilization of the data and the knowledge of the system and the disturbances. However, it is possibly sensitive to modeling errors and might be computationally expensive. In view of this, it is very important to have a clear understanding f the assumptions under which an algorithm is optimal and how they relate to the real world.

## Linear Algebra Review
### Definitions and Notations
A $matrix$ of dimensions $n \times m$ is the two-dimensional array

$
A =  [a_{ij}] = \left( \begin{matrix} a_{11} & \ldots & a_{1m} \\ \vdots & \ddots & \vdots \\ a_{n1} & \ldots & a_{nm} \end{matrix} \right)
$

the first dimension is the number or rows, and the second dimension is the number of columns. The elements of $A$ will be denoted as $a_{ij}$ or as $A_{ij}$

An $n$-dimensional **vector** is the one-dimensional array ($n \times 1$ matrix)

$
a = \left( \begin{matrix} a_{1} \\ \vdots \\ a_{n} \end{matrix} \right) \triangleq col(a_i)
$
which is a column vector.

Transposition of a matrix or vector is denoted by an apostrophe. So the Transpose of $A$ is

$
A =  [a_{ji}] = \left( \begin{matrix} a_{11} & \ldots & a_{n1} \\ \vdots & \ddots & \vdots \\ a_{1m} & \ldots & a_{nm} \end{matrix} \right)
$

and the column vector $a$ is
$a = \left[ a_1 \dots a_n \right]'$
the row vector obtained from transposing $a$ is
$a' = \left[ a_1 \dots a_n \right]$

A (square) matrix is said to be **symmetric** if
$A = A'$
or
$a_{ij} = a_{ji}$ $\forall{i,j}$

### Linear Algebra Operations

