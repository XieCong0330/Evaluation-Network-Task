function [count,cycles] = findbasec(b)
% [count,cycles] = findbasec(b),for 3 by N matrix, returns the number of
% base circles of ENT(count) and the component of each circle(cycles)
% specifically, given the ENT yields a fully connected graph for each
% participant, the base circles are typically consist three nodes
c = zeros(12,12);
for i = 1:size(b,1)
    c(b(i,1),b(i,2)) = b(i,3);
end
G = digraph(c);
a = allcycles(G);
if isempty(a) == 0
    for i = 1:size(a,1)
        size_all(i,1) = size(a{i,1},2);
    end
    numb3c = find(size_all == 3);
    numb2c = find(size_all == 2);
    if isempty(numb2c) == 0 && isempty(numb3c) == 0
        cycles3c = cell2mat(a(numb3c,:));
        cycles2c = cell2mat(a(numb2c,:));
        cycles = a(numb2c,:);
        for j = 1:size(cycles2c,1)
            for m = 1:size(cycles3c,1)
                li = ismember(cycles2c(j,:),cycles3c(m,:));
                xx(m,j) = li(1,1)*li(1,2);
            end
        end
        for n = 1:size(xx,1)
            if sum(xx(n,:)) == 0
                cycles{1+size(cycles,1),:} = cycles3c(n,:);
            end
        end
        count = size(cycles,1);
    elseif isempty(numb2c) == 1 && isempty(numb3c) == 0
        cycles = a(numb3c,:);
        count = length(find(size_all == 3));
    elseif isempty(numb2c) == 0 && isempty(numb3c) == 1
        cycles = a(numb2c,:);
        count = length(find(size_all == 2));
    end
else
    cycles = [];
    count = 0;
end
end
