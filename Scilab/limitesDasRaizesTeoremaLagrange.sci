//way down we go
//Algoritmo LimitesRaízes
//{ Objetivo: Achar os limites das raízes reais de uma equação polinomial }
function [l] = teoremaLagrange(n, c) 
    if c(1) == 0 then
        print(%io(2),"Coeficiente nulo!!")
        return 
    end
    t = n+1
    c(t+1)=0
    while 1==1 then
        if ~c(t) == 0 then
            break    
        end 
        t = t-1
    end
    
    for i = 1:4 
        if i == 2 | i == 4 then
            for j = 1:(t/2)
                aux = c(j)
                c(j) = c(t-j+1)
                c(t-j+1) = aux
            end
        elseif i == 3 then
            for j = 1:(t/2)
                 aux  = c(j)
                 c(j) = c(t-j+1) 
                 c(t-j+1) = aux
            end
            for j = (t-1):-2:1
                 c(j)=-c(j)
            end
        end
        if c(1)<0 then
            for j = 1:t
                c(j) = -c(j)
             end
        end
        k=2
        while 1==1 then
            if  c(k) < 0 | k > t then
                break
            end
            k = k+1
        end
        if k<=t then
            B=0
            for j = 2:t
                if c(j)<0 & abs(c(j))>B then
                    B=abs(c(j))
                end
            end
            l(i)= 1 +  (B/c(1))^(1/(k-1))
        else 
            l(i) = 10^100
        end
    end
    aux = l(1)
    l(1) = 1/l(2)
    l(2) = aux
    l(3) = -l(3)
    l(4) = -1/l(4)        
endfunction
