%Jesus Eduardo Zenteno Rodríguez 
%ID: 175126
% Represent a state as [CL,ML,B,CR,MR]
start([3,3,left,0,0]).	%Beginning State
goal([0,0,right,3,3]).	%Final State

verify_iflegal(Cannibals_Left,Missionaries_Left,Cannibals_Right,Missionaries_Right) :-	%Predicate that examines if the movements are legal
	Cannibals_Left>=0,	%Cannibals on the left must be greater or equal than zero
    Missionaries_Left>=0, %Missionaries on the left must be greater or equal than zero
    Cannibals_Right>=0,%Cannibals on the right must be greater or equal than zero
    Missionaries_Right>=0, %Missionaries on the right must be greater or equal than zero
   
	(Missionaries_Left>=Cannibals_Left ; Missionaries_Left=0), %Check if the number of missionaries is greater or equal on the left side, or there is none missionaries  
	(Missionaries_Right>=Cannibals_Right ; Missionaries_Right=0).%Check if the number of missionaries is greater or equal on the right side, or there is none missionaries

%Left to right movements
% Possible moves: All the legal movements that we can make 
% First Movement: Two missionaries cross left to right
move([Cannibals_Left,Missionaries_Left,left,Cannibals_Right,Missionaries_Right],
     [Cannibals_Left,Two_Missionaries_Left,right,Cannibals_Right,Two_Missionaries_Right]):-
    
	Two_Missionaries_Right is Missionaries_Right+2,	%Assign the values if two missionaries move to right side
	Two_Missionaries_Left is Missionaries_Left-2,	%Assign the values if two missionaries leaves to left side
	verify_iflegal(Cannibals_Left,Two_Missionaries_Left,Cannibals_Right,Two_Missionaries_Right).  %Verify the movement

% Second Movement: Two cannibals cross left to right.
move([Cannibals_Left,Missionaries_Left,left,Cannibals_Right,Missionaries_Right],
     [Two_Cannibals_Left,Missionaries_Left,right,Two_Cannibals_Right,Missionaries_Right]):-
	
	Two_Cannibals_Right is Cannibals_Right+2, %Assign in Cannibals_Right the two cannibals that moves to the right side
	Two_Cannibals_Left is Cannibals_Left-2,	 %Assign in Cannibals_left the two cannibals that leaves left side
	verify_iflegal(Two_Cannibals_Left,Missionaries_Left,Two_Cannibals_Right,Missionaries_Right). %Verify the movement

% Third Movement: One missionary and one cannibal cross left to right on the same boat.
move([Cannibals_Left,Missionaries_Left,left,Cannibals_Right,Missionaries_Right],
     [One_Cannibal_Left,One_Missionary_Left,right,One_Cannibal_Right,One_Missionary_Right]):-
	
	One_Cannibal_Right is Cannibals_Right+1,%A cannibal is moved to right side
	One_Cannibal_Left is Cannibals_Left-1,	%A cannibal leaves teh left side
	One_Missionary_Right is Missionaries_Right+1,	%A Misionary is moved to right side in the same boat
	One_Missionary_Left is Missionaries_Left-1,	%A Missionary leaves the left side
	verify_iflegal(One_Cannibal_Left,One_Missionary_Left,One_Cannibal_Right,One_Missionary_Right). %Verify the movement

% Fourth Movement: One missionary crosses left to right.
move([Cannibals_Left,Missionaries_Left,left,Cannibals_Right,Missionaries_Right],
     [Cannibals_Left,One_Missionary_Left,right,Cannibals_Right,One_Missionary_Right]):-
	
	One_Missionary_Right is Missionaries_Right+1,	%The missionary goes to the right side
	One_Missionary_Left is Missionaries_Left-1,		%The variable of the missionaries on the left side is decreased by one
	verify_iflegal(Cannibals_Left,One_Missionary_Left,Cannibals_Right,One_Missionary_Right).	%Verify the movement

% Fith movement: One cannibal crosses left to right.
move([Cannibals_Left,Missionaries_Left,left,Cannibals_Right,Missionaries_Right],
     [One_Cannibal_Left,Missionaries_Left,right,One_Cannibal_Right,Missionaries_Right]):-
	
	One_Cannibal_Right is Cannibals_Right+1,	%One cannibal moves to the right side
	One_Cannibal_Left is Cannibals_Left-1,		%A cannibal leaves teh left side
	verify_iflegal(One_Cannibal_Left,Missionaries_Left,One_Cannibal_Right,Missionaries_Right).	%Verify the movement


%Right to left movements
% 6th movement: Two missionaries cross right to left.
move([Cannibals_Left,Missionaries_Left,right,Cannibals_Right,Missionaries_Right],
     [Cannibals_Left,Two_Missionaries_Left,left,Cannibals_Right,Two_Missionaries_Right]):-
	
	Two_Missionaries_Right is Missionaries_Right-2,		%Assign the values if two missionaries move to left side
	Two_Missionaries_Left is Missionaries_Left+2,		%Assign the values if two missionaries leaves right side
	verify_iflegal(Cannibals_Left,Two_Missionaries_Left,Cannibals_Right,Two_Missionaries_Right).

% 7th movement: Two cannibals cross right to left.
move([Cannibals_Left,Missionaries_Left,right,Cannibals_Right,Missionaries_Right],
     [Two_Cannibals_Left,Missionaries_Left,left,Two_Cannibals_Right,Missionaries_Right]):-
	
	Two_Cannibals_Right is Cannibals_Right-2,	%Decrement the value of the cannibals on right side by 2
	Two_Cannibals_Left is Cannibals_Left+2,		%Two cannibals goes to the left side
	verify_iflegal(Two_Cannibals_Left,Missionaries_Left,Two_Cannibals_Right,Missionaries_Right).	%Verify the movement

%  8th Movement: One missionary and one cannibal cross right to left.
move([Cannibals_Left,Missionaries_Left,right,Cannibals_Right,Missionaries_Right],
     [One_Cannibal_Left,One_Missionary_Left,left,One_Cannibal_Right,One_Missionary_Right]):-
	
	One_Cannibal_Right is Cannibals_Right-1,	%A cannibal leaves right side (Cannibals_Right-1)
	One_Cannibal_Left is Cannibals_Left+1,		%A cannibal enters left side (Cannibals_Left+1)
	One_Missionary_Right is Missionaries_Right-1,	%A Missionary leaves right side (Missionaries_Right-1)
	One_Missionary_Left is Missionaries_Left+1,		%A Misionary enters left side (Missionaries_Left+1)
	verify_iflegal(One_Cannibal_Left,One_Missionary_Left,One_Cannibal_Right,One_Missionary_Right).	%Verify movement

% 9th movement: One missionary crosses right to left.
move([Cannibals_Left,Missionaries_Left,right,Cannibals_Right,Missionaries_Right],
     [Cannibals_Left,One_Missionary_Left,left,Cannibals_Right,One_Missionary_Right]):-
	
	One_Missionary_Right is Missionaries_Right-1,	%A Missionary leaves right side (Missionaries_Right-1)
	One_Missionary_Left is Missionaries_Left+1,		%A missionary goes to the left side
	verify_iflegal(Cannibals_Left,One_Missionary_Left,Cannibals_Right,One_Missionary_Right).	%Verify movement

%10th movement: One cannibal crosses right to left.
move([Cannibals_Left,Missionaries_Left,right,Cannibals_Right,Missionaries_Right],
     [One_Cannibal_Left,Missionaries_Left,left,One_Cannibal_Right,Missionaries_Right]):-
	
	One_Cannibal_Right is Cannibals_Right-1,	%A cannibal leaves right side
	One_Cannibal_Left is Cannibals_Left+1,		%A cannibal goes left side
	verify_iflegal(One_Cannibal_Left,Missionaries_Left,One_Cannibal_Right,Missionaries_Right).		%Verify movement


% Recursive call to solve the problem
path([CL1,ML1,B1,CR1,MR1],[CL2,ML2,B2,CR2,MR2],Explored,MovesList) :- 
   move([CL1,ML1,B1,CR1,MR1],[CL3,ML3,B3,CR3,MR3]), %With this transictions, it can start to make movements
   not(member([CL3,ML3,B3,CR3,MR3],Explored)), %Avoid that state repeats other states that it used
   path([CL3,ML3,B3,CR3,MR3],[CL2,ML2,B2,CR2,MR2],[[CL3,ML3,B3,CR3,MR3]|Explored],[ [[CL3,ML3,B3,CR3,MR3],[CL1,ML1,B1,CR1,MR1]] | MovesList ]).

% Solution found
path([CL,ML,B,CR,MR],[CL,ML,B,CR,MR],_,MovesList):- 
	output(MovesList).

% Printing
output([]) :- nl. 		%Prints the solution in the console
output([[A,B]|MovesList]) :- 
	output(MovesList), 
   	write(B), write(' GOES TO -> '), write(A), nl.

% Find the solution for the missionaries and cannibals problem
findSolution :- 
   path([3,3,left,0,0],[0,0,right,3,3],[[3,3,left,0,0]],_). %Start the program with the problem to aboard and find the 
%solution with the recursive call