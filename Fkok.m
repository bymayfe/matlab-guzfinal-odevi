function [f,x]= Fkok(xbas,as)
x(1)=xbas;
for i=1:as-1
    fx=log(x(i))-(x(i)^3)/5+2*x(i)+50;
    ftx=1/x(i)-(3*x(i)^2)/5+2;
    x(i+1)=x(i)-fx/ftx;
end
f=x(as);
fprintf('Bulunan kök: %.6f\n',f);
end
