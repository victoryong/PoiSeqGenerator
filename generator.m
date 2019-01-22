% ��dag���������ݸ�Ϊ���룬���н��Ա���ȨֵΪ1����Ӱ�죩�����г���sequenceLen���Թ̶�Ҳ���Ը�Ϊ���룬���������������Ļ����
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
