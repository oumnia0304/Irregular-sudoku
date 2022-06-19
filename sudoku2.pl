:- use_module(library(clpfd)).

sudoku(Matrix) :- length(Matrix, 9), %create Matrix, a list with 9 ELEMENTS
				maplist(same_length(Matrix), Matrix), %now Matrix is  matrix of 9 lines and 9 coloums
				append(Matrix, Vars), Vars ins 1..9,%all the elements of Matrix are between 1 and 9 
				maplist(all_distinct, Matrix), %all the elements in the lines have tio be distinct 
				transpose(Matrix, TransMatrix),%the line of Matrix became the coloums
				maplist(all_distinct, TransMatrix), %all the elements in the coloums ( that now correspond to lines) have to be distinct 
				Matrix = [L1,L2,L3,L4,L5,L6,L7,L8,L9], %Matrix is defined by 9 lines 
				L1 = [E11, E12, E13, E14, E15, E16, E17, E18, E19],%there I defined each line with 9 elements corresponding to the lines and  coloums position (E45 corresponds to the element line 4 coloum 5)
				L2 = [E21, E22, E23, E24, E25, E26, E27, E28, E29],
				L3 = [E31, E32, E33, E34, E35, E36, E37, E38, E39],
				L4 = [E41, E42, E43, E44, E45, E46, E47, E48, E49],
				L5 = [E51, E52, E53, E54, E55, E56, E57, E58, E59],
				L6 = [E61, E62, E63, E64, E65, E66, E67, E68, E69],
				L7 = [E71, E72, E73, E74, E75, E76, E77, E78, E79],
				L8 = [E81, E82, E83, E84, E85, E86, E87, E88, E89],
				L9 = [E91, E92, E93, E94, E95, E96, E97, E98, E99],
				
				all_distinct([E11, E12, E13, E14, E21, E23, E31, E41, E51]), %and there the element of each block that composed the irregular sudoku are all distinct
				all_distinct([E22, E32, E33, E42, E52, E62, E61, E71, E81]),
				all_distinct([E15, E24, E25, E26, E27, E28, E34, E44, E43]),
				all_distinct([E16, E17, E18, E19, E29, E39, E38, E37, E36]),
				all_distinct([E35, E45, E55, E54, E64, E74, E84, E83, E85]),
				all_distinct([E53, E63, E73, E72, E82, E91, E92, E93, E94]),
				all_distinct([E46, E47, E48, E49, E56, E59, E65, E66, E75]),
				all_distinct([E57, E67, E76, E77, E78, E86, E88, E95, E96]),
				all_distinct([E58, E68, E69, E79, E89, E87, E99, E98, E97]). 
	
%this is the irregular sudoku that we want to solve (same as in the picture)
sudoku1([
		[9,_,_,3,_,8,_,_,5],
		[_,8,_,_,4,_,_,1,_],
		[_,_,_,_,9,_,_,_,_],
		[7,_,_,_,_,_,_,_,2],
		[_,1,4,_,_,_,2,3,_],
		[2,_,_,_,_,_,_,_,4],
		[_,_,_,_,7,_,_,_,_],
		[_,2,_,_,8,_,_,5,_],
		[3,_,_,9,_,4,_,_,7]
		]).
		

/*
sudoku2(S), sudoku(S), maplist(label, S), maplist(portray_clause, S).
*/