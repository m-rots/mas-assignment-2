:- begin_tests(tower_blocks).
:- use_module(tower_blocks, [exactlyThreeTower/1]).

test(exactlyThreeTower, all(X == [b])) :-
    exactlyThreeTower(X).

:- end_tests(tower_blocks).