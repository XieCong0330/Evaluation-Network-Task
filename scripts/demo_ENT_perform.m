% for one subject, to quantify his or her ENT performance 
k = all_result.res_k;
c = all_result.res_c;
n = all_result.res_n;
[sensi_k, stab_k, corr_h_k,corr_l_k] = ENT_performance(k);
[sensi_c, stab_c, corr_h_c,corr_l_c] = ENT_performance(c);
[sensi_n, stab_n, corr_h_n,corr_l_n] = ENT_performance(n);
