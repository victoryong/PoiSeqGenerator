function [ se ] = genSequence( dag_line,timeInterval, n)
%GENSEQUENCE �˴���ʾ�йش˺����ժҪ
%   �˴���ʾ��ϸ˵��
    nNode = length(dag_line);
    w = zeros(1,nNode);
    temp = rand(1, sum(dag_line));
    %temp = temp / sum(temp)
   
    j = 1;
    for i=1:nNode
       if dag_line(i,1)==0
           w(i) = 0;
       else 
           w(i) = temp(j);
           j = j + 1;
       end
    end
    
    se = zeros(1,length(timeInterval(n,:)));
    % se(1) = sum(sum(timeInterval(:,1) * w));
    se(1) = w * timeInterval(:,1);
    
    for i=2:length(se)
        se(i) = se(i - 1) + w * timeInterval(:,i);
    end
end

