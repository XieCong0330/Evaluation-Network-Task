function g1 = sort_network(g)
% g1 = sort_network(g),for N by N matrix, returns M (number of non-zero
% elements) by 3 double with a ascend order by the weights of the edges
% In ENT, there would be some negative value given the postion of stimuls
% are randomly assigned(if participants indicates the stimuls on the left 
% part is better than that on the right part in ENT, the value would be negative),
% here, the negative values would be transformed to positive values with a
% reversed postion(e.g., if -0.4 is located in row 4, column 2, it would be 
% transformed to 0.4 with the location of row 2,column 4)  
% the first column of g1 is the ids of the source nodes, the
% sconed column of g1 is the ids of the target nodes, and the third
% column is the weights of edges.
a = ones(size(g))*0;
for m = 1:size(a,1)
    for n = 1:size(a,2)
        if g(m,n)<0
            a(n,m) = -g(m,n);
        elseif g(m,n)>0 && m~=n
            a(m,n) = g(m,n);
        end
    end
end
x = 1; 
for i = 1:size(a)
    for j = 1:size(a)
        if a(i,j)>0 && i ~= j
            b(x,3) = a(i,j);
            b(x,1) = i;
            b(x,2) = j;
            x = x+1;
        elseif a(i,j) == 0 && a(j,i) == 0 && i~=j
            b(x,3) = 0.001;
            b(x,1) = i;
            b(x,2) = j;
            x = x+1;
        else
            x = x;
        end
    end
end
    g1 = sortrows(b,3);
end