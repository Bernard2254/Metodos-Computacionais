//Algoritmo Bisseção
//{ Objetivo: Calcular a raiz de uma equação pelo método da bisseção }
function[Raiz, Iter, CondErro] = Bissecao(a, b, Toler, IterMax)
    //F = 2x³ - cos(x+1)-3
    deff('[z]=f(x)', 'z=2*x^3-cos(x+1)-3');
    Fa = feval(a, f);
    Fb = feval(b, f);
    if Fa*Fb > 0 then
        printf("Função não muda de sinal no intervalo passado");
        return;
    end
    DeltaX = abs(b-a)/2; Iter = 0;
    while 1==1
        x = (a+b)/2; Fx = feval(x, f);
        printf("Iter = %d\na = %f\nFa = %f\nb = %f\nFb = %f\nx = %f\nFx = %f\nDeltaX = %f\n", Iter, a, Fa, b, Fb, x, Fx, DeltaX);
        if (DeltaX<= Toler & abs(Fx)<=Toler) | Iter>=IterMax then
            break;
        end
        if Fa*Fx>0 then
            a = x; Fa = Fx;
        else
            b = x;
        end
        DeltaX = DeltaX/2; Iter = Iter + 1;
    end
    Raiz = x;
    if DeltaX<=Toler & abs(Fx)<=Toler then
        CondErro = 0;
    else
        CondErro = 1;
    end
    printf("\nRaiz = %f\nIter = %d\nCondErro = %f \n", Raiz, Iter, CondErro);
endfunction
