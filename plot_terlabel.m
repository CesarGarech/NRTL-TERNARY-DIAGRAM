function []=plot_terlabel(label1,label2,label3,fig)

N = {'Sistema',label1,'-',label2,'-',label3};
N = strjoin(N);
fig.Name=N;

text(1,-0.08,label1,'horizontalalignment','center');
text(0,1.08,label2,'horizontalalignment','center');
text(0,-0.08,label3,'horizontalalignment','center');
end