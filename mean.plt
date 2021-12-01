:- begin_tests(mean).
:- use_module(mean, [mean/2]).

test("mean #1", all(Mean == [3])) :-
    mean([1,2,3,4,5], Mean).

test("mean #2", all(Mean == [4])) :-
    mean([1,4,5,6], Mean).

test("empty list equals 0", true(Mean == 0)) :-
    once(mean([], Mean)).

test("not a float", all(Mean == [3])) :-
    mean([1,6], Mean).

:- end_tests(mean).