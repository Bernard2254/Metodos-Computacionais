//Algoritmo TrocaSinal
//{ Objetivo: Achar um intervalo [a, b] onde uma função troca de sinal }
//parâmetros de entrada z
//{ ponto a partir do qual o intervalo será gerado }

function[a, b, CondErro] = TrocaSinal(z)
    //F = 2x³ - cos(x+1)-3
    deff('[z]=f(x)', 'z=2*x^3-cos(x+1)-3')
    if z==0 then
        a =-0.05
        b = 0.05
    else
        a = 0.95*z
        b = 1.05*z
    end
    Iter = 0
    Aureo = 2/((5^(1/2))-1)
    Fa = feval(a, f)//2*a^3 - cos(a+1)-3
    Fb = feval(b, f)//2*b^3 - cos(b+1)-3
    printf('Iter = %f\na = %f\nb = %f\nFa = %f\nFb = %f\n',Iter, a, b, Fa, Fb)
    while 1==1
        if Fa*Fb<=0 | Iter>=20 then
            break
        end
        Iter = Iter + 1
        if abs(Fa)<abs(Fb) then
            a = a - Aureo * (b-a)
            Fa = feval(a, f)//2*a^3 - cos(a+1)-3
        else
            b = b + Aureo * (b-a)
            Fb = feval(b, f)//2*b^3 - cos(b+1)-3
        end            
     printf('Iter = %f\na = %f\nb = %f\nFa = %f\nFb = %f\n  ',Iter, a, b, Fa, Fb)
    end
    if Fa*Fb<=0 then
        CondErro = 0
    else
        CondErro = 1
    end
    printf("\na = %f\nb = %f\nCondErro = %d\n", a, b, CondErro)
endfunction
