//Algoritmo Secante
//{ Objetivo: Calcular a raiz de uma equação pelo método da secante }
function[Raiz, Iter, CondErro] = Secante(a, b, Toler, IterMax)
    //F = 2x³ - cos(x+1)-3
    deff('[z]= f(x)', 'z = 2*x^3 - cos(x+1)-3');
    Fa = feval(a, f)
    Fb = feval(b, f)
    if abs(Fa)<abs(Fb) then
        t = a; a = b; b = t; t = Fa; Fa = Fb; Fb = t;
    end
    Iter = 0; x = b; Fx = Fb;
    while 1==1
        DeltaX = -Fx/(Fb - Fa)*(b-a);
        x = x + DeltaX; Fx = feval(x, f);
        printf("Iter = %d\na = %f\nFa = %f\nb = %f\nFb = %f\nx = %f\nFx = %f\nDeltaX = %f\n", Iter, a, Fa, b, Fb, x, Fx, DeltaX);
        if(abs(DeltaX)<=Toler & abs(Fx)<=Toler) | Iter>=IterMax then
            break;       
        end
        a = b; Fa = Fb; b = x; Fb = Fx; Iter = Iter + 1;
    end
    Raiz = x;
    if DeltaX<=Toler & abs(Fx)<=Toler then
        CondErro = 0;
    else
        CondErro = 1;
    end
    printf("\nRaiz = %f\nIter = %d\nCondErro = %f \n", Raiz, Iter, CondErro);
endfunction
