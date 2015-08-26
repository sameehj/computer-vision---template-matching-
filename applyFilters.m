function [ shapes  ] = applyFilters( filters,img,threshhold )
%APPLYFILTERS Summary of this function goes here
%   Detailed explanation goes here
shapes=[];
index=1;
for i=1:length(filters)
    if(size(filters{i})<size(img))
        c = normxcorr2(filters{i},img);
        [value,I]=max(c(:));
        if(value>threshhold)
            [I_row, I_col] = ind2sub(size(c),I);
            yoffSet = abs(I_row-size(filters{i},1));
            xoffSet =abs( I_col-size(filters{i},2));
            shapes{index}=[xoffSet yoffSet size(filters{i},2) size(filters{i},1)];
            index=index+1;
        end
    end
end

end

