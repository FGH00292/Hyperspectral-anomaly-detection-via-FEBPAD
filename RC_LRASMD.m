function [L,S,N]=RC_LRASMD(data,r,k)
% Background purification by RC-LRASMD.
% INPUTS:
%   - data:  HSI data set after FrFT (rows by columns by bands);
%   - r:     upper bound of the rank of low-rank part 'L';
%   - k:     upper bound of the cardinality of sparse part 'S'.
% OUTPUTS:
%   - L:     low-rank part of 'data' ((rows * columns) by bands);
%   - S:     sparse part of 'data' ((rows * columns) by bands);
%   - N:     noise part of 'data' ((rows * columns) by bands);

    % Initialization
    [M,N,n]=size(data);
    X=reshape(data,M*N,n);            % obtain the fixed subset 'Omega'
    map=GRX_adv(data,X);
    map=reshape(map,M*N,1);
    [~,ind]=sort(map,'descend');
    mp1=zeros(M*N,1);
    mp1(ind(1:k))=1;
    Omega=repmat(mp1,1,n);
    iter_max=1e+2;                    % maximum iterations
    error_bound=1e-3;                 % error bound epsilon
    iter=1;                           % initialize iterator
    L=X;                              % low-rank part
    S=zeros(size(X));                 % sparse part
    A1=randn(n,r);
    En=norm(X(:));                    % total energy of 'X'
    
    % Iterate until convergence
    while true
        Y1=(X-S)*A1;                  % bilateral random projection (BRP)
        Y2=(X-S)'*Y1;
        L=Y1*(Y1'*Y1)^(-1)*Y2';
        S=Omega.*(X-L);               % projection by the fixed subset 'Omega'
        N=X-L-S;                      % noise part
        if norm(N(:))/En<error_bound||iter>iter_max
            break;                    % meet termination conditions
        else
            iter=iter+1;
        end
    end
end