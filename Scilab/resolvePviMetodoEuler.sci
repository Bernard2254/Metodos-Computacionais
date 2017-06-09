//Algoritmo Euler
//{ Objetivo: Resolver um PVI pelo método de Euler }
function [VetX, VetY] = Euler(a, b, m, y0)
    //F = x − 2y + 1
    deff('[z]=f(x, y)', 'z=x-2*y+1');
    h = (b-a)/m; x = a; y = y0;
    Fxy = feval(x, y, f);
    VetX(1) = x; VetY(1) = y;
    printf("i\tx\t\ty\t\tFxy\n")
    for (i=1:m)
        x = a+ i*h;
        y = y+ h*Fxy;
        Fxy = feval(x, y, f);
        printf("%d\t%f\t%f\t%f\n", i, x, y, Fxy);
        VetX(i+1) = x; VetY(i+1) = y;
    end
endfunction
