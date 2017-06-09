//Algoritmo Euler
//{ Objetivo: Resolver um PVI pelo método de Euler }
function [VetX, VetY] = Euler3(a, b, m, y0)
    //F = x − 2y + 1
    deff('[z]=f(x, y)', 'z=x-2*y+1');
    h = (b-a)/m; xt = a; yt = y0;
    VetX(1) = xt; VetY(1) = yt;
    printf("i\tx\t\ty\t\tFxy\n")
    for (i=1:m)
        x = xt; y = yt; k1 = feval(x, y, f);
        x = xt + h/2; y = yt + h/2*k1; k2 = feval(x, y, f);
        y = yt + h/2*k2; k3 = feval(x, y, f);
        x = xt + h; y = yt +h*k3; k4 = feval(x, y, f);
        xt = a + i*h; yt = yt + h/6*(k1 +2*(k2+k3) +k4);
        printf("%d\t%f\t%f\n", i, xt, yt);
        VetX(i+1) = xt; VetY(i+1) = yt
    end
endfunction
