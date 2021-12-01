:- begin_tests(navigate).
:- use_module(navigate, [
    route_by_bike/2,
    route/2,
    route/3
]).

test(route_by_bike, true(Got == Expected)) :-
    findall((F, T), route_by_bike(F, T), Got),
    Expected = [
        (wn_entrance, mb_entrance), 
        (botanic_garden, wn_entrance), 
        (botanic_garden, mb_entrance)
    ].

test(route_2, true(Got == Expected)) :-
    findall((F, T), route(F, T), Solutions),
    sort(Solutions, Got),
    Expected = [
        (botanic_garden, mb_6th_floor), 
        (botanic_garden, mb_entrance), 
        (botanic_garden, wn_entrance), 
        (botanic_garden, wn_k137), 
        (mb_entrance, mb_6th_floor), 
        (wn_entrance, mb_6th_floor), 
        (wn_entrance, mb_entrance), 
        (wn_entrance, wn_k137)
    ].

test(route_3, true(Got == Expected)) :-
    findall((F, T, M), route(F, T, M), Solutions),
    sort(Solutions, Got),
    Expected = [
        (botanic_garden, mb_6th_floor, 10), 
        (botanic_garden, mb_entrance, 5), 
        (botanic_garden, wn_entrance, 4), 
        (botanic_garden, wn_k137, 6), 
        (mb_entrance, mb_6th_floor, 5), 
        (wn_entrance, mb_6th_floor, 6), 
        (wn_entrance, mb_entrance, 1), 
        (wn_entrance, wn_k137, 2)
    ].

:- end_tests(navigate).