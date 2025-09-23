# MTOP-Codes
The codes in GAMS AND IBM ILOG on the Multiple Travelling Officers Optimization Problem

**Multi-Travelling Officers Problem (MTOP) Optimization**

This project addresses the Multiple Travelling Officers Problem (MTOP) to optimize patrol schedules in urban smart city environments. Leveraging Mixed Integer Linear Programming (MILP), the model balances travel distance, officer availability, and overstaying probabilities to maximize efficiency in parking enforcement.

**🚀 Project Overview**

_Problem Scope:_ Optimizing patrol schedules for 10 parking bays, 3 officers, and 10 time periods.

_Objective:_

Single-objective: Maximize fines collected.

Multi-objective: Balance fines collected, minimize travel time, and reduce operational costs.

_Constraints Considered:_

- Officer availability

- Maximum working hours

- Overstay probability thresholds (0.2–0.9)

- Single visit per bay

**🛠️ Tools & Methodology**

Optimization Technique: Mixed Integer Linear Programming (MILP)

_Solvers Used_: 

GAMS & IBM ILOG CPLEX

_Key Features:_

- Incorporates stochastic overstaying probabilities into routing

- Handles trade-offs via weighted multi-objective formulation

- Models real-world constraints in urban parking enforcement

**📊 Results**

- Single-Objective (Max fines) → Optimal solution: 270 (0% optimality gap)

- Multi-Objective (Balanced) → Optimal solution: 85.31 (0% optimality gap)

- Demonstrated alignment between overstaying probabilities and fines collected, validating model applicability.

**🔮 Future Scope**

-> Integration of real-time IoT parking sensor data for dynamic scheduling.

-> Multi-day planning with officer fatigue and shift constraints.

-> Scalable framework for larger urban networks.

**👩‍💻 Authors**

Yoshita Banerjee

Monali Gupta

_Submitted as part of course project for CL643 – Mathematical Tools for Optimization, IIT Guwahati._
