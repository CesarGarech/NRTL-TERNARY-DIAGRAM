%para sistemas ternarios
function [y,T]=vle(x,t)

c=[x(1) x(2) 1-x(1)-x(2)];

if nargin<2
    T=((448.07)+(390.90)+(458.25)+(373.17))/4;
    %     T=T+273.15;%T=(Tb(Et)+Tb(MEK)+Tb(ciclohexano)+Tb(agua))/4
else
    T=t;
end

% P=5000; %presión en Pa
P=101325;

x=[x(1), x(2), 1-x(1)-x(2)];

%Antoine extendido
C=[7.51107 -1965.70 -91.021 0 0 0 0 %Lactic ácid (k, log, kPa)
    99.3822 -9866.4 0 0 -11.655 1.08e-17 6;%n-butanol (experimental) k,ln,kPa
    7.142 -2160.134 235.46 0 0 0 0;%butyl lactate (experimental) °C,log,kPa
    73.649 -7258.2 0 0 -7.3037 4.1653e-6 2];%water K, Ln, Pa

p_sat1=@(T) (10.^(C(1,1)+(C(1,2)/(T+C(1,3)))+C(1,4)*T+C(1,5)*log(T)+C(1,6)*T^C(1,7)))*1000;%p_sat Lactic ácid
p_sat2=@(T) (exp(C(2,1)+(C(2,2)/(T+C(2,3)))+C(2,4)*T+C(2,5)*log(T)+C(2,6)*T^C(2,7)))*1000;%p_sat n-butanol
p_sat3=@(T) (10.^(C(3,1)+(C(3,2)/((T-273.15)+C(3,3)))+C(3,4)*T+C(3,5)*log(T)+C(3,6)*T^C(3,7)))*1000;%p_sat butyl lactate
p_sat4=@(T) exp(C(4,1)+(C(4,2)/(T+C(4,3)))+C(4,4)*T+C(4,5)*log(T)+C(4,6)*T^C(4,7));%p_sat water

g=g_NRTL(c,T);

%Para la mezcla Lactic acid-butanol-butyl lactate
% vapor1=@(T,g,x)(x(1).*p_sat1(T).*g(1))./P;
% vapor2=@(T,g,x)(x(2).*p_sat2(T).*g(2))./P;
% vapor3=@(T,g,x)(x(3).*p_sat3(T).*g(3))./P;

%Para la mezcla Lactic acid-butanol-water
vapor1=@(T,g,x)(x(1).*p_sat1(T).*g(1))./P;
vapor2=@(T,g,x)(x(2).*p_sat2(T).*g(2))./P;
vapor3=@(T,g,x)(x(3).*p_sat4(T).*g(3))./P;

%Para la mezcla butanol-Butyl Lactate-water
% vapor1=@(T,g,x)(x(1).*p_sat2(T).*g(1))./P;
% vapor2=@(T,g,x)(x(2).*p_sat3(T).*g(2))./P;
% vapor3=@(T,g,x)(x(3).*p_sat4(T).*g(3))./P;

%Para la mezcla Lactic Acid-Butyl Lactate-water
% vapor1=@(T,g,x)(x(1).*p_sat1(T).*g(1))./P;
% vapor2=@(T,g,x)(x(2).*p_sat3(T).*g(2))./P;
% vapor3=@(T,g,x)(x(3).*p_sat4(T).*g(3))./P;



if nargin<2 %es decir, si se utiliza la funciónn vle(x,t) por primera vez para calcular
    %una buena condición inicial
    
    dT=0.1;
    f=@(T,g,x) vapor1(T,g,x)+vapor2(T,g,x)+vapor3(T,g,x)-1;
    df=@(T,dT,g,x) f(T+dT,g,x)-f(T,g,x);
    
    while abs(f(T,g,x))>0.00001 %este valor es un ejemplo, puede variar dependiendo del sistema
        Tn=T-f(T,g,x)/(df(T,dT,g,x)/dT);
        dT=Tn-T;
        T=Tn;
        g=g_NRTL(c,T);
    end
    y=[vapor1(T,g,x) vapor2(T,g,x) vapor3(T,g,x)];
else
    y=[vapor1(T,g,x) vapor2(T,g,x) vapor3(T,g,x)];
end
end