go:-
    hypothesis(Crop),
    write('This crop may be suitable for your environment: '),
    nl,
    write(Crop),
    nl,
    undo.

hypothesis(wheat) :- wheat, !.
hypothesis(paddy) :- paddy, !.
hypothesis(maize) :- maize, !.
hypothesis(potato) :- potato, !.
hypothesis(mustard) :- mustard, !.
hypothesis(millet) :- millet, !.
hypothesis(chickpeas) :- chickpeas, !.
hypothesis(peas) :- peas, !.
hypothesis(unknown).


wheat :-
    verify(is_temp>twenty_deg_c),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_alluvial),
    verify(is_watersupply_regular),
    verify(is_altitude>fifteenhundred_m ).

paddy:-
    verify(is_temp_twenty-fourty_c),
    verify(is_rainfall>onehundred_fifteen_cm),
    verify(is_soil_clay),
    verify(is_watersupply_regular),
    verify(is_altitude>three_thousand_m).

maize:-
    verify(is_temp>thirty_c),
    verify(is_rainfall_hundred_to_twohundred_cm),
    verify(is_watersupply_moderate),
    verify(is_soil_clay),
    verify(is_altitude>four_thousand_m ).

potato:-
    verify(is_temp_five_to_ten_c),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_sandy),
    verify(is_watersupply_rare),
    verify(is_altitude>thousand_m).

mustard:-
    verify(is_temp_fitteen_to_twentyfive_c),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_loamy),
    verify(is_watersupply_moderate),
    verify(is_altitude>thousand_m ).

millet:-
    verify(is_temp>twentyc),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_alluvial),
    verify(is_watersupply_rare),
    verify(is_altitude>twothousand_m).

chickpeas:-
    verify(is_temp>thirtyfive_c),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_siltloam),
    verify(is_watersupply_moderate),
    verify(is_altitude>two_thousand_m ).

peas:-
    verify(is_temp>thirty_c),
    verify(is_rainfall>hundred_cm),
    verify(is_soil_sandy),
    verify(is_watersupply_regular),
    verify(is_altitude>seven_hundred_fifty_m ),

nl.

ask(Question) :-
    write('Does your environment has the following attributes: '),
    write(Question),
    write('?'),
    read(Response),
    nl,
    (   (Response == yes ; Response == y)
    ->
    assert(yes(Question));
    assert(no(Question)), fail).

:- dynamic yes/1,no/1.

verify(S) :-
    (yes(S)
     ->
      true;
    (no(S)
     ->
      fail;
    ask(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
