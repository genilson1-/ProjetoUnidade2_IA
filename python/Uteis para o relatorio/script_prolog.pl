#!/usr/bin/env swipl
 
:- initialization main. 
 
main:-  current_prolog_flag(argv,Argv),
        nth0(0, Argv, A), % get first argument
        nth0(1, Argv, B), % get second argument
        nth0(2, Argv, C), % get third argument
        consult('novo_teste.pl'), % Load main Prolog code
        atom_number(A,E), % Transform inputs into Prolog integers
        atom_number(B,F),
        atom_number(C,G),
        control(X,Y,E,F,G), % Query control function with inputs
        format("X= ~w, Y= ~w \n",[X,Y]), % Prints output variables
        halt. % Finishes execution
