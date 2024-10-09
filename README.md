
# BONUS

  ## MAP
        Functia 'map' aplica o functie specificata 'f' pe fiecare element
    din vectorul sursa dat si stocheaza rezultatele intr-un vector destinatie.
    Parametrii sunt deja stocati in registrii aferenti intrucat se foloseste
    assembly pe 64 de biti, dar ii mut in alti registrii pentru claritate.
    Iau un registru pe post de contor si incep parcurgerea fiecarui element
    din vectorul sursa pe care il stochez in 'rax'. Setez argumentele functiei
    'f', o apelez, dupa care pun rezultatul transmis prin 'rax' in vectorul
    destinatie. Incrementez contorul, verificand la fiecare iteratie daca a
    depasit dimensiunea vectorului sursa. La final, restaurez registrii salvati
    si stiva prin apelul functiilor 'leave' si 'ret'.
    
  ## REDUCE
        Functia 'reduce' incepe aproximativ la fel cu 'map', doar ca mai
    pastreaza valoarea initiala a acumulatorului intr-un registru. Incep
    iterarea buclei prin fiecare element al vectorului sursa, il salvez
    intr-un registru, dupa care apelez functia 'f' data ca parametru,
    dar de data aceasta cu 2 argumente (si acumulatorul pe care il
    returneaza dupa apel). Dupa apelarea functiei 'f' modific acumulatorul,
    incrementez contorul si reiau bucla , verificand deopotriva daca
    contorul a atins dimensiunea vectorului.
        La final, se stocheaza acumulatorul in registrul 'rax' pentru a fi
    returnat, dupa care se restaureaza registrii si se paraseste functia.
        Totul se termina cu bine:)
