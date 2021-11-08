function []=plot_ternaryc(c1,c2,symbol)
% Plot the points
hold on
x=zeros(1,length(c1));
y=x;
for i=1:length(c1)
x(i)=c1(i);
y(i)=c2(i);
end
plot(x,y,symbol)
end