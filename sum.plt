:- begin_tests(sum).
:- use_module(sum, [sum/3]).

test(sum, true(Solutions == Expected)) :-
    findall((X, Y), sum([1,2,3], X, Y), Solutions),
    Expected = [
        ([1, 2], [3]), 
        ([2, 1], [3]), 
        ([3], [1, 2]), 
        ([3], [2, 1])
    ].

test("Fails with single element", [fail]) :- sum([1], _, _).

:- end_tests(sum).