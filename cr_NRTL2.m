%para sistemas ternarios
function x=cr_NRTL2(x1,x2,l)
%x1=composici�n en la alimentaci�n del componente 1
%x2=composici�n en la alimentaci�n del componente 2
%l=l�mite de integraci�n de las composiciones

c0=[x1; x2];%matriz unificada de composiciones

% fig=plot_ternary(1);
hold on

tspan=[0 l];
M=[1 0 0; 0 1 0; 0 0 0];

opts=odeset('Refine',5,'MassSingular','yes','Mass',M,'NormControl','on','AbsTol',1e-10,'RelTol',1e-5);

% x3=@(x1,x2)1-x1-x2;

%opts variar� dependiendo del sistema que se est� tratando, aqu� solo se muestra un ejemplo
for k=1:length(x1)
    
    [~,T0]=vle(c0(:,k)'); %para darle una buena temperatura inicial
    
    [~,x] = ode15s(@cambio,tspan,[c0(:,k); T0],opts);
    plot(x(:,1),x(:,2),'.k');%x3(x(:,1),x(:,2)),'.b');
    hold on;
    [~,x] = ode15s(@cambio,-tspan,[c0(:,k); T0],opts);
    plot(x(:,1),x(:,2),'.k');%x3(x(:,1),x(:,2)),'.b');
    
    
    
end

hold off
end
