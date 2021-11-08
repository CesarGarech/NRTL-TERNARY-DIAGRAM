%función para el cálculo de los coeficientes de actividad mediante NRTL para 3 componentes
function [g]=g_NRTL(x,T)
%cáculo de las matrices para el modelo NRTL aplicado al sistema
%sistema (1)- (2)- (3)
%--------matrices para el cálculo de las actividades------%
%Datos para temperatura en K
%%
%Mezcla lactic acid-butanol-lactate
%matriz de a
% a=[
%     0 0 0 ;
%     0 0 0.791708572 ;
%     0 -0.72642125 0 ; 
%     ];
% 
% %matriz de b
% b=[ 
%     0 -654.6 327.588149;
%     1537.6 0 -158.78125;
%     -130.299587 134.427168 0;     
%     ];
% 
% %matriz de alfas
% c=[
%     0 0.2 0.3 ;
%       0.2 0 0.3 ;
%       0.3 0.3 0 ;      
%       ];     
%%
%Mezcla lactic acid-butanol-water
%matriz de a
a=[ 
    0 0 0;
    0 0  11.8615308;    
    0 32.0328198  0
    ];

%matriz de b
b=[ 
    0 -654.6  -454.3;
    1537.6 0  -4690.39883;    
    407.7 -10000  0
    ];

%matriz de alfas
c=[
    0 0.2  0.3;
      0.2 0  0.197230162;      
      0.3 0.197230162  0
      ]; 
  
  %%
%Mezcla butanol-Butyl Lactate-water
% matriz de a
% a=[    
%     0 0.791708572 11.8615308;
%     -0.72642125 0 0;
%     32.0328198 0 0
%     ];
% 
% %matriz de b
% b=[     
%     0 -158.78125 -4690.39883;
%     134.427168 0 0; 
%     -10000 0 0
%     ];
% 
% %matriz de alfas
% c=[    
%       0 0.3 0.197230162;
%       0.3 0 0;
%       0.197230162 0 0
%       ]; 
  %%
%Mezcla Lactic acid-Butyl lactate-water
%matriz de a
% a=[ 
%     0  0 0;    
%     0  0 0;
%     0  0 0
%     ];
% 
% %matriz de b
% b=[
%     0  327.588149 -454.3;    
%     -130.299587  0 0; 
%     407.7  0 0
%     ];
% 
% %matriz de alfas
% c=[
%     0 0.3 0.3;      
%       0.3  0 0;
%       0.3  0 0
%       ]; 
%%
%matriz tau
tau=a+(1/T).*b;

%matriz de Gibbs
G=exp(-c.*tau);
%---matrices de la descomposición de la expresión de NRTL para el cáculo
%del logaritmo neperiano de la actividad.Ver página 29 del cuaderno para
%nomenclatura
A=[(dot(tau(:,1),(G(:,1).*x')))/(dot(G(:,1),x));
(dot(tau(:,2),(G(:,2).*x')))/(dot(G(:,2),x));
(dot(tau(:,3),(G(:,3).*x')))/(dot(G(:,3),x))];

%ahora para la matriz B
c11=tau(1,1)-dot(tau(:,1),x'.*G(:,1))/(dot(G(:,1),x));
c12=tau(1,2)-dot(tau(:,2),x'.*G(:,2))/(dot(G(:,2),x));
c13=tau(1,3)-dot(tau(:,3),x'.*G(:,3))/(dot(G(:,3),x));

c21=tau(2,1)-dot(tau(:,1),x'.*G(:,1))/(dot(G(:,1),x));
c22=tau(2,2)-dot(tau(:,2),x'.*G(:,2))/(dot(G(:,2),x));
c23=tau(2,3)-dot(tau(:,3),x'.*G(:,3))/(dot(G(:,3),x));

c31=tau(3,1)-dot(tau(:,1),x'.*G(:,1))/(dot(G(:,1),x));
c32=tau(3,2)-dot(tau(:,2),x'.*G(:,2))/(dot(G(:,2),x));
c33=tau(3,3)-dot(tau(:,3),x'.*G(:,3))/(dot(G(:,3),x));

C=[c11 c12 c13; c21 c22 c23; c31 c32 c33];

D=zeros(3,3);

D(:,1)=G(:,1)./dot(G(:,1),x);
D(:,2)=G(:,2)./dot(G(:,2),x);
D(:,3)=G(:,3)./dot(G(:,3),x);

B(1)=dot((D(1,:).*x),C(1,:));
B(2)=dot((D(2,:).*x),C(2,:));
B(3)=dot((D(3,:).*x),C(3,:));

g=[exp(A(1)+B(1)), exp(A(2)+B(2)),exp(A(3)+B(3))];
end
