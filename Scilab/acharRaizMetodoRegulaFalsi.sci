//Algoritmo RegulaFalsi
//{ Objetivo: Calcular a raiz de uma equação pelo método da regula falsi }
function[Raiz, Iter, CondErro] = RegulaFalsi(a, b, Toler, IterMax)
    //F = 2x³ - cos(x+1)-3
    deff('[z] = f(x)', 'z = 2*x^3 - cos(x+1)-3');
    Fa = feval(a, f);
    Fb = feval(b, f);
    if Fa*Fb>0 then
        printf("Função não muda de sinal nos extremos do intervalo dado")
        return
    end
    if Fa>0 then
        t = a; a = b; b = t; t = Fa; Fa = Fb; Fb = t;
    end
    Iter = 0; x = b; Fx = Fb;
    while 1==1
        DeltaX = -Fx/(Fb-Fa)*(b-a);
        x = x + DeltaX; Fx = feval(x, f);
        printf("Iter = %d\na = %f\nFa = %f\nb = %f\nFb = %f\nx = %f\nFx = %f\nDeltaX = %f\n", Iter, a, Fa, b, Fb, x, Fx, DeltaX);
        if (DeltaX<= Toler & abs(Fx)<=Toler) | Iter>=IterMax then
            break;
        end
        if Fx<0 then
            a = x; Fa = Fx;
        else
            b = x; Fb = Fx;
        end
        Iter = Iter + 1;
    end
    Raiz = x;
    if DeltaX<=Toler & abs(Fx)<=Toler then
        CondErro = 0;
    else
        CondErro = 1;
    end
    printf("\nRaiz = %f\nIter = %d\nCondErro = %f \n", Raiz, Iter, CondErro);
endfunction
