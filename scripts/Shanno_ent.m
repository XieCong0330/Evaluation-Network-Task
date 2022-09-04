function [ent] = Shanno_ent(g1)
% [ent] = Shanno_ent(g1),for N by 3 matrix, returns Shanno entropy of the
% weights of the g1. To avoid the bias derived from the jitter of evaluation, 
% the ratings were divided into 11 intervals. The first interval ranges from 0 to 5, 
% and the last one ranges from 95 to 100. The others rating from 5 to 95 were equally 
% divided into 9 intervals with the same width of 10
edges = [0,0.05:0.1:0.95,1];
for i = 1:size(g1,1)
    g1(i,3) = roundn(g1(i,3),-2);
end
if size(g1,1)>66
    g1((1:(size(g1,1)-66)),:) = [];
end
g1(:,3) = discretize(g1(:,3),edges);
g2 = tabulate(g1(:,3));
g2(find(g2(:,3)==0),:)=[];
ent= sum(-g2(:,3)/100.*log2(g2(:,3)/100));
end