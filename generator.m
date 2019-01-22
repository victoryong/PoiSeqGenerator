% 将dag的连接数据改为输入，其中结点对本身权值为1（有影响），序列长度sequenceLen可以固定也可以改为输入，产生任意数量结点的活动序列
clear



dag = [1 1 1;0 1 1;0 0 1]; % Directed acyclic graph

dag = GenRandSkeleton(5, 1, 1)'

nNode = length(dag); %Amount of nodes
sequenceLen = 500; % Size of samples

%   Generate activity sequences
lambda = 4; % Parameter for poisson distribution
timeInterval = zeros(nNode, sequenceLen); % Time intervals to generate activity sequences
Seqs1 = zeros(nNode, sequenceLen); % Activity sequences

for i = 1:nNode
    timeInterval(i,:) = poissrnd(lambda, 1, sequenceLen);
    Seqs1(i,:) = genSequence(dag(:,i),timeInterval, i);
end 
%timeInterval
Seqs1

