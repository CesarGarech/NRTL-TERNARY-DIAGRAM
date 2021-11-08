function dxdt=cambio(~,x)
T=x(3);
[y,~]=vle([x(1) x(2)],T); %para conseguir las composiciones en el vapor

dxdt=[x(1)-y(1);
x(2)-y(2);
1-y(1)-y(2)-y(3)];
end