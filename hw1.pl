flatten_append(X, Y, Z) :- flatten(X, A), flatten(Y, B), append(A, B, Z).

combine(X, Y, Z, R) :- reverse(Y, A), append(X, A, B), append(B, Z, R).