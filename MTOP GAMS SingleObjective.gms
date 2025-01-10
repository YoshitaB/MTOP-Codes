Sets
    i Parking bays /1*10/
    k Officers /1*3/
    t Time periods /1*10/;

Alias(i,j);

Table d(i,j) Distance between parking bays
       1     2     3     4     5     6     7     8     9    10
1      0   1.2   2.3   1.4   2.1   2.6   1.7   2.8   1.9   2.0
2    1.2     0   1.5   1.3   1.8   1.6   2.1   2.4   2.5   2.7
3    2.3   1.5     0   2.1   1.2   2.7   1.6   2.0   2.3   2.9
4    1.4   1.3   2.1     0   1.7   2.2   1.8   2.6   2.4   2.8
5    2.1   1.8   1.2   1.7     0   2.3   1.5   2.2   2.7   2.1
6    2.6   1.6   2.7   2.2   2.3     0   1.9   2.5   2.8   2.4
7    1.7   2.1   1.6   1.8   1.5   1.9     0   2.2   2.4   2.6
8    2.8   2.4   2.0   2.6   2.2   2.5   2.2     0   2.3   2.1
9    1.9   2.5   2.3   2.4   2.7   2.8   2.4   2.3     0   2.0
10   2.0   2.7   2.9   2.8   2.1   2.4   2.6   2.1   2.0     0;

Parameters
    f(i)  Fine for parking violation at each bay /1 50, 2 40, 3 60, 4 70, 5 30, 6 80, 7 50, 8 90, 9 30, 10 40/
    os(i) Probability of car overstaying at each parking bay /1 0.6, 2 0.5, 3 0.7, 4 0.4, 5 0.8, 6 0.3, 7 0.9, 8 0.2, 9 0.7, 10 0.6/
    max_time(t) Maximum time for officer tours /1 600, 2 600, 3 600, 4 600, 5 600, 6 600, 7 600, 8 600, 9 600, 10 600/
    mp Minimum probability threshold for visiting the parking bay /0.4/
    sal Base salary of each officer /100/;

Binary Variables
    x(i,k,t) whether officer k visits bay i at time t
    y(k) whether officer k is on patrol duty;

Variables
    z Objective function (maximize fines - salary);

Equations
    obj Objective function
    E1(i) Each parking bay visited at most once
    E2(k) Total travel time for each officer within the limit
    E3(i,k,t) Officer can only visit a node if active
    E4(i) Parking bay is only visited if overstay probability is sufficient;

* Objective: Maximize fines and minimize officer costs
obj..z =e= sum(i,sum(k,sum(t, f(i) * x(i,k,t)))) - sum(k, y(k) * sal);

* Constraint 1: Each parking bay visited at most once
E1(i)..sum(k,sum(t, x(i,k,t))) =l= 1;

* Constraint 2: Total travel time for each officer must not exceed max_time
E2(k)..sum(i,sum(j, d(i,j))* sum(t, x(i,k,t))) =l= sum(t,max_time(t) * y(k));

* Constraint 3: Officer can only visit only if he is active
E3(i,k,t)..x(i,k,t) =l= y(k);

* Constraint 4: Parking bay visited only if probability threshold is met
E4(i)..sum(k,sum(t, x(i,k,t)*os(i))) =g= mp * sum(k,sum(t, x(i,k,t)));

Model mtop /all/;
Solve mtop using mip maximizing z;
Display x.l,y.l,z.l;