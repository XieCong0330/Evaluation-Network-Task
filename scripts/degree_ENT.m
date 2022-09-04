function [mean_out,mean_in] = degree_ENT(b)
% [mean_out,mean_in] = degree_ENT(b), for 3 by N matrix, returns the mean
% values of out- & in- degrees of four high creative anwsers,four medium creative
% answers, and four low creative anwsers;
G = digraph(b(:,1),b(:,2),b(:,3));
outd = outdegree(G);
ind = indegree(G);
mean_out(:,1) = mean(outd(1:4,1));
mean_out(:,2) = mean(outd(5:8,1));
mean_out(:,3) = mean(outd(9:12,1));
mean_in(:,1) = mean(ind(1:4,1));
mean_in(:,2) = mean(ind(5:8,1));
mean_in(:,3) = mean(ind(9:12,1));
end