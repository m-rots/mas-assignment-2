:- begin_tests(blocks).
:- use_module(blocks, [
    atLeastThree/1,
    exactlyThree/1
]).

test(atLeastThree, all(X == [d,e])) :-
    atLeastThree(X).

test(exactlyThree, all(X == [d])) :-
    exactlyThree(X).

:- end_tests(blocks).