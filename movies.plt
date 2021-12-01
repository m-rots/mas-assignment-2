:- begin_tests(movies).
:- use_module(movies, [
    listMovies/1,
    listMoviesByName/1,
    listMoviesByGenre/2,
    listMoviesByRank/2,
    numberMovies/3,
    db/1
]).

test(listMovies, true(Titles == Expected)) :-
    once(listMovies(Titles)),
    Expected = [
        "The Imitation Game",
        "The Godfather",
        "A Bad Movie",
        "Z Good Movie"
    ].

test(listMoviesByName, true(Titles == Expected)) :-
    once(listMoviesByName(Titles)),
    Expected = [
        "A Bad Movie",
        "The Godfather",
        "The Imitation Game",
        "Z Good Movie"
    ].

/*
ListMoviesByGenre
*/

test("listMoviesByGenre: drama", true(Titles == Expected)) :-
    once(listMoviesByGenre(genre("drama"), Titles)),
    Expected = [
        "The Imitation Game",
        "The Godfather"
    ].

test("listMoviesByGenre: crime", true(Titles == Expected)) :-
    once(listMoviesByGenre(genre("crime"), Titles)),
    Expected = [
        "The Godfather"
    ].

test("listMoviesByGenre: all genres returned", true(Sorted == Expected)) :-
    findall((G, T), listMoviesByGenre(G, T), Solutions),
    sort(Solutions, Sorted),
    Expected = [
        (genre("action"), ["A Bad Movie"]), 
        (genre("crime"), ["The Godfather"]), 
        (genre("drama"), ["The Imitation Game", "The Godfather"]), 
        (genre("thriller"), ["Z Good Movie"])
    ].

/*
listMoviesByRank
*/

test(listMoviesByRank, true(Titles == Expected)) :-
    db(DB), once(listMoviesByRank(DB, Titles)),
    Expected = [
        "Z Good Movie",
        "The Godfather",
        "The Imitation Game",
        "A Bad Movie"
    ].

/*
numberMovies
*/

test("numberMovies: crime", true(Count == 1)) :-
    db(DB), once(numberMovies(DB, genre("crime"), Count)).

test("numberMovies: drama", true(Count == 2)) :-
    db(DB), once(numberMovies(DB, genre("drama"), Count)).

test("numberMovies: all genres returned", true(Sorted == Expected)) :-
    db(DB),
    findall((Genre, Count), numberMovies(DB, Genre, Count), Solutions),
    sort(Solutions, Sorted),
    Expected = [
        (genre("action"), 1), 
        (genre("crime"), 1), 
        (genre("drama"), 2), 
        (genre("thriller"), 1)
    ].

:- end_tests(movies).