%%---funciones para la representación en diagrama ternario------------%%
function [fig]=plot_ternary(n)
fig=figure(n);
hold on
fill([0 0 1],[0 1 0],'w');
axis image
axis off
%marcas de los ejes
for i=0:0.1:1
text(i,-0.025,num2str(i));
%text(1-l(i)+0.025,l(i)+0.025,num2str(l(i)));
text(-0.025,i,num2str(i),'horizontalalignment', 'right');
end
end



