%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APPLICATION:
%   Hyperspectral Anomaly Detection.
% INPUTS:
%   - data: HSI data set (rows by columns by bands);
%   - p:    fractional transform order;
%   - r:    upper bound of the rank of low-rank part 'L';
%   - k:    upper bound of the cardinality of sparse part 'S'.
% OUTPUTS:
%   - y:    final detection map (rows by columns);
%   - AUC:  AUC value of 'y'.
%  REFERENCE:
%   Y. Ma, G. Fan, Q. Jin, J. Huang, X. Mei and J. Ma,"Hyperspectral anomaly 
%   detection via integration of feature extraction and background purifica-
%   tion",IEEE GRSL 2020.
% Written and sorted by Ganghui Fan in 2020. All rights reserved.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;close all;clc
warning('off');
for num=1
    % Data loading and parameter setting
    load([num2str(num),'.mat']);                               % load HSI data set
    data=(data-min(data(:)))./(max(data(:))-min(data(:)));
    [M,N,L]=size(data);
    p=0.7;                                                     % fractional transform order
    r=3;k=0.7*M*N;                                             % rank and cardinality
    
    % Feature extraction and background purification anomaly detector
    y=FEBPAD(data,p,r,k);
    
    % Evaluation
    AUC=ROC(y,map,1);                                          % ROC
end
