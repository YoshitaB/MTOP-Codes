
int N =...;   //No. of parking bays
int M =...;   //No. of officers   
int T =...;   //No. of time periods

range Nodes = 1..N;
range Officers = 1..M;
range Time = 1..T;

// Parameters
float d[Nodes][Nodes] = ...;    //Distance between parking bays
float f[Nodes] = ...;           //Fines collected at each bay
float os[Nodes] = ...;          //Overstay probability at each bay
int max_time = ...;             // Officer working hours in minutes
float mp = ...;                 // Minimum probability threshold
int sal = ...;                  // Officer salary per period

// Decision Variables
dvar boolean x[Nodes][Officers][Time];  
dvar boolean y[Officers];              

// Objective Function
maximize sum(i in Nodes, k in Officers, t in Time) f[i] * x[i][k][t] - sum(k in Officers) sal * y[k];

subject to{
  
  	//Single visit constraint
    forall(i in Nodes){
        sum(k in Officers, t in Time) x[i][k][t] <= 1;}
        
    //Time limit constraint   
    forall(k in Officers){
    	sum(i in Nodes, j in Nodes, t in Time) (d[i][j] * x[i][k][t]) <= max_time * y[k];}
    	
    //Officer availability constraint
    forall(i in Nodes, k in Officers, t in Time){
        x[i][k][t] <= y[k];}
        
     //Minimum probability threshold     
     forall(i in Nodes){
        sum(k in Officers, t in Time) (x[i][k][t] * os[i]) >= mp * sum(k in Officers, t in Time) x[i][k][t];}
    
}

