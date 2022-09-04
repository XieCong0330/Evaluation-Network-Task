function [sensi, stab, corr_h,corr_l] = ENT_performance(raw)
% [sensi, stab, corr_h,corr_l] = ENT_performance(raw) is the
% calculation of the sensitivity, stability, and correctness of the ENT,
% raw is an N by N matrix (12 specifically for ENT) derived from ENT with the value of the
% diagonal elements are 0 or close to 0 (otherwise the data is flawed)
% sensi: the sensitivity of creativity (as manifested by Shannon Entropy of judgments)
% stab: stability of evaluation criteria (as manifested by the shortest circles of the network)
% corr_h: correctness of the judgments (as manifested by the out-degrees of high creative answers)
% corr_l: correctness of the judgments (as manifested by the in-degrees of low creative answers)
network_temp = sort_network(raw);
sensi = Shanno_ent(network_temp);
stab = 1-findbasec(network_temp)/(size(raw,1)*(size(raw,1)-1)/2-2);
[outd,ind] = degree_ENT(network_temp);
corr_h = outd(:,1);
corr_l = ind(:,3);
end
