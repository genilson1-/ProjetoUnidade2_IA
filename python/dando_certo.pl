control(Vl, Vr, SE, SC, SD) :- SE = 1, SC = 1, SD = 1, Vl is 1, Vr is 1. % continua inda pra frente se não tiver nada

control(Vl, Vr, SE, SC, SD) :- SE < 0.31, SC = 1, SD < 0.31, Vl is 1, Vr is 1. % se oi dois sensores laterais detectarem algo, ele contiua pra frente

control(Vl, Vr, SE, SC, SD) :- (SD = 0.3, SE = 1), (SC = 0.3; SC = 1), Vl is 0.3, Vr is 1. % se SC for maior que SD gira pra Direita

control(Vl, Vr, SE, SC, SD) :- (SE = 0.3, SD = 1), (SC = 0.3; SC = 1), Vl is 1, Vr is 0.3. % se SD for maior que SE gira pra esquerda

control(Vl, Vr, SE, SC, SD) :- SE = 1, SC = 0.3, SD = 1, Vl is 0.2, Vr is 1.

control(Vl, Vr, SE, SC, SD) :- SE = 0.3, SC = 0.3, SD = 0.3, Vl is 1, Vr is 0.2.


