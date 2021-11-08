clear all
clc
close all

%%
xo=[0.90, 0.05, 0.05;
    0.70, 0.20, 0.10;
    0.50, 0.50, 0.00;
    0.50, 0.30, 0.20;
    0.729, 0.002, 0.270;
%     0.50, 0.00, 0.50;
%     0.45, 0.10, 0.45;
%     0.40, 0.20, 0.40;
%     0.30, 0.30, 0.40;
%     0.30, 0.20, 0.50;
    0.30,0.10,0.60;
    0.25, 0.50, 0.25;
    0.20, 0.20, 0.60;
    0.15, 0.70, 0.15;
    0.1, 0.2, 0.7;
%     0.1, 0.8,    0;
%     0.05, 0.90, 0.05;
%    0.05, 0.20, 0.75;
%    0.00, 0.50, 0.50;
%    0.55 0.0 0.45;
   0.544 0.455 0.001;
%    0.096, 0.900, 0.005;
%    0.886, 0.113, 0.001;
   ];

% xo=[0.55, 0.0, 0.45;
%     0.05, 0.20, 0.75;
%     0.05, 0.90, 0.05
%     ];

L=length(xo);
fig=plot_ternary(1);
tic
for i=1:L
x1=xo(i,1);
x2=xo(i,2);
l=10;
x=cr_NRTL2(x1,x2,l);
end
toc


plot_terlabel('Lactic Acid','1-Butanol','1-Butyl Lactate',fig)
[~,T]=vle([1 0 0]); C = {num2str(T,'%.1f'),'K'};%|Para el Comp1
str = strjoin(C); %|
text(1,-0.12,str,'horizontalalignment','center');%|
[~,T]=vle([0 1 0]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp2
str = strjoin(C);
text(0,1.04,str,'horizontalalignment','center');
[~,T]=vle([0 0 1]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
str = strjoin(C);
text(0,-0.12,str,'horizontalalignment','center');

%gráfica de puntos Lactic-butyllac-water 101.325 kPa
% [~,T]=vle([0.886, 0.113, 0.001]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.886-0.10, 0.113,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.886,0.113,'d');

%gráfica de puntos butanol-butyllac-water 101.325 kPa
% [~,T]=vle([0.218, 0.002, 0.781]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.218-0.10,0.002,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.218, 0.002,'d');

%gráfica de puntos butanol-butyllac-water 5 kPa
% [~,T]=vle([0.729, 0.002, 0.270]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.729-0.10,0.002,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.729, 0.002,'d');

% %gráfica de puntos Lactic-but(OH)-water 101.325 kPa
% [~,T]=vle([0.0, 0.221, 0.779]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.0, 0.221-0.10,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.0, 0.221,'d');

%gráfica de puntos Lactic-but(OH)-water 5 kPa
% [~,T]=vle([0.0, 0.729, 0.221]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.0,  0.729-0.10,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.0,  0.729,'d');

%gráfica de puntos Lactic-Butanol-butyllac 101.325 kPa
% [~,T]=vle([0.884, 0.002, 0.781]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.884-0.10, 0.002,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.884,0.002,'d');







% [~,T]=vle([0.0 0.0267 (1-0.0267)]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.0-0.10,0.0267,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.0, 0.0267,'d');

% [~,T]=vle([0.2359 0 (1-0.2359)]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.2359+0.05,0.0-0.03,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.2349, 0.0,'d');

% [~,T]=vle([0.0 0.2366 (1-0.2366)]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.0,0.2366-0.03,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.0, 0.2366,'d');

% [~,T]=vle([0.2321 0.0 0.0]);C = {num2str(T,'%.1f'),'K'};%|Para el Comp3
% str = strjoin(C);
% text(0.2321-0.11,0.0,str,'horizontalalignment','center');
% hold on;
% plot_ternaryc(0.2321, 0.0,'d');

%otra forma de graficar puntos
% text(0.0-0.15,0.24, '373.0 K');
% azeotrope=[0.240 0.0 0.760]; %azeotrope (ethanol-water)
% h=azeotrope;
% Aze=plot(h(1),h(2),'d');
% text(h(1)-0.09,h(2), '365.30 K');
% hold on;
% azeotrope2=[0.23 0.014 1-0.14-0.23]; %azeotrope (ethanol-water)
% h2=azeotrope2;
% Aze2=plot(h2(1),h2(2),'d');
% text(h2(1)-0.09,h2(2), '365.24 K');
% hold on;
% azeotrope3=[0.0 0.014 0.986]; %azeotrope (ethanol-water)
% h3=azeotrope3;
% Aze3=plot(h3(1),h3(2),'d');
% text(h3(1)-0.09,h3(2), '373.0 K');
