% Each road follows one arrow in the graph.
road('Makkah', 'Madinah').
road('Makkah', 'Riyadh').

road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').

road('Taif', 'Dammam').
road('Taif', 'Tabuk').
road('Tabuk', 'Taif').

road('Dammam', 'Qatif').
road('Dammam', 'Riyadh').
road('Qatif', 'Madinah').
road('Qatif', 'Dammam').
road('Riyadh', 'Dammam').

% Start the search with the first city marked as visited.
travel(Start, End, Path) :-
    walk(Start, End, [Start], Path).

% Stop when we reach the destination.
walk(End, End, _, [End]).

% Follow an arrow to a city we have not visited yet.
walk(Current, End, Visited, [Current|Rest]) :-
    Current \= End,
    road(Current, Next),
    \+ member(Next, Visited),
    walk(Next, End, [Next|Visited], Rest).