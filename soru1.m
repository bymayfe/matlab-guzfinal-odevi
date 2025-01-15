clc;clear;close;

tahmin=Fkok(5,20)

f=@(x)log(x)-(x^3)/5+2*x+50;
fzero(f,10)