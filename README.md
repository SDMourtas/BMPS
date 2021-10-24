# Binary Markowitz-based Portfolio Selection
The Markowitz mean-variance portfolio selection is widely acclaimed as a very important investment strategy. The binary Markowitz-based portfolio selection (BMPS) problem is a binary version of the original mean-variance portfolio selection problem introduced by Markowitz. Furthermore, a cardinality limit on the BMPS problem has been set to prevent over-diversification. Note that BMPS is an integer linear programming problem.\
The purpose of this package is to solve online the BMPS problem by using a V-shaped transfer function-based of the binary Beetle Antennae Search (VSBAS). Several algorithms from the literature are currently implemented, based on the available literature and our understanding. More precisely, the main articles used are the followings:
*	S.D.Mourtas, V.N.Katsikis, "V-Shaped BAS: Applications on large portfolios selection problem," Computational Economics (2021)
*	M.A. Medvedeva, V.N. Katsikis, S.D. Mourtas, T.E. Simos, "Randomized time-varying knapsack problems via binary beetle antennae search algorithm: Emphasis on applications in portfolio insurance," Math Meth Appl Sci, pp. 1-11, 2020.
*	K. Deb, Optimization for Engineering Design: Algorithms and Examples. PHI, second ed., July 2013.
*	X.S. Yang, Nature-inspired optimization algorithms. Elsevier, 2014.
*	S. Mirjalili, A. Lewis, "S-shaped versus V-shaped transfer functions for binary Particle Swarm Optimization," Swarm and Evolutionary Computation, vol. 9, pp. 1-14, 2013.
*	S. Mirjalili, S.M. Mirjalili, X. Yang, Binary Bat Algorithm, Neural Computing and Applications, In press, 2014, Springer.
Also, the package includes the following three Matlab functions for comparison purposes:
*	Seyedali Mirjalili (2021). Enhanced Binary Particle Swarm Optimization (BPSO) with 6 new transfer functions (https://www.mathworks.com/matlabcentral/fileexchange/42448-enhanced-binary-particle-swarm-optimization-bpso-with-6-new-transfer-functions), MATLAB Central File Exchange. Retrieved January 9, 2021.
*	Seyedali Mirjalili (2021). Binary Bat Algorithm (https://www.mathworks.com/matlabcentral/fileexchange/44707-binary-bat-algorithm), MATLAB Central File Exchange. Retrieved January 9, 2021.
*	Yarpiz (2021). Binary and Real-Coded Genetic Algorithms (https://www.mathworks.com/matlabcentral/fileexchange/52856-binary-and-real-coded-genetic-algorithms), MATLAB Central File Exchange. Retrieved January 9, 2021.
Note that these functions have been appropriately modified for the BMVPS problem. Also, more information about these algorithms can be found in https://yarpiz.com/, and http://www.alimirjalili.com. 
# M-files Description
*	Main_BMPS.m: the main function and parameters declaration
*	BMPS.m: problem setup and main procedure
*	problem.m: complementary function for the problem setup
*	example.m: complementary function for the portfolio case selection
*	objfun.m: objective function of the problem
*	MyCost.m: objective function of the problem used by ABC, DE and SMA algorithms
*	penfun.m: objective function of the problem plus the penalty value
*	VSBAS.m: V-shaped transfer function-based BBAS algorithm
*	VSTF.m: Binary V-shaped transfer function for BBAS antennae
*	BBAS.m: appropriately modified BBAS algorithm
*	BBA.m: appropriately modified BBA algorithm
*	BPSO.m: appropriately modified BPSO algorithm
*	bga.m: appropriately modified binary genetic algorithm
*	Crossover.m: complementary function of the bga algorithm
*	RouletteWheelSelection.m: complementary function of the bga algorithm
*	DoublePointCrossover.m: complementary function of the bga algorithm
*	UniformCrossover.m: complementary function of the bga algorithm
*	SinglePointCrossover.m: complementary function of the bga algorithm
*	Mutate.m: complementary function of the bga algorithm

# Installation
*	Unzip the file you just downloaded and copy the BMPS directory to a location,e.g.,/my-directory/
*	Run Matlab/ Octave, Go to /my-directory/BMPS/ at the command prompt
*	run 'Main_BMPS' (Matlab/Octave)

# Results
After running the Main_BMPS.m file, the package outputs are the following:
*	The optimal portfolio of BMPS problem created by VSBAS, BBAS, BBA and BPSO.
*	The time consumptions of VSBAS, BBAS, BBA and BPSO.
*	The graphic illustration of the average price of the objected function as well as the optimal portfolios expected return and variance.

# Environment
The BMPS package has been tested in Matlab 2018b on OS: Windows 10 64-bit.
