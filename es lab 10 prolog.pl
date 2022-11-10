%ex1.1
% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

%ex1.2
% search2(Elem , List)
% looks for two consecutive occurrences of Elem
search2(X, [X,X|_]).
search2(X, [_|Xs]) :- search2(X, Xs).

%ex1.3
% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
% search_two(a,[b,c,a,a,d,e]). ? no
% search_two(a,[b,c,a,d,a,d,e]). ? yes
search_two(X, [X,_,X|_]).
search_two(X, [_|Xs]) :- search_two(X, Xs).

%ex1.4
% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
% search_anytwo(a,[b,c,a,a,d,e]). ? yes
% search_anytwo(a,[b,c,a,d,e,a,d,e]). ? yes
search_anytwo(X, [X|Y]) :- search(X, Y).
search_anytwo(X, [_|Y]) :- search_anytwo(X, Y).

%ex2.1
% size(List, Size)
% Size will contain the number of elements in List
size([], 0).
size([_|Xs], N) :- size(Xs, N2), N is N2 + 1.

%ex2.2
% size ( List , Size )
% Size will contain the number of elements in List,
% written using peano notation
size([], zero).
size([H|T], s(X)) :- size(T, X).
%size([a,b,c], X).

%ex2.3
% sum(List, Sum)
% sum([1, 2, 3], X). ? yes
sum([], 0).
sum([H|T], N) :- sum(T, N2), N is N2 + H.
%sum([1,2,3], X).

%ex2.4
%average(List, Average)
%average(List, Count, Sum, Average)
average(List, A) :- average(List, 0, 0, A).
average([], C, S, A) :- A is S/C.
average([H|T], C, S, A) :- 
	C2 is C + 1, 
	S2 is H + S, 
	average(T, C2, S2, A). 
%average([10,20,30], X).

%ex3.1
% same(List1, List2)
% are the two lists exactly the same?
same([],[]).
same([X|Xs], [X|Ys]) :- same(Xs, Ys).
%same([10,20,30], [10,20,30]).

%ex3.2
% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10, 20, 30, 40], [9, 19, 29, 39]).
all_bigger([X],[Y]) :- X > Y.
all_bigger([X|Xs], [Y|Ys]) :- X > Y, all_bigger(Xs, Ys).
%all_bigger([11,21,31], [10,20,30]).

%ex3.3
% sublist(List1, List2)
% List1 should contain elements all also in List2
% example: sublist([1, 2], [5, 3, 2, 1]).
sublist([], Y).
sublist([X|Xs], Y) :- search(X, Y), sublist(Xs, Y).
%sublist([11,21,31], [10,20,30,11, 21, 31]).

%ex4.1
% seq(N, List)
% example: seq(5, [0, 0, 0, 0, 0]).
seq(0, []).
seq(N, [0|T]) :- N2 is N - 1, seq(N2, T).

%ex4.2
% seqR(N, List)
% example: seqR(4, [4, 3, 2, 1, 0]).
seqR(0, [0]).
seqR(N, [N|T]) :- N2 is N - 1, seqR(N2, T).
%seqR(4, X).