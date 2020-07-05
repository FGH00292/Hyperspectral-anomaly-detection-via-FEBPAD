function y=FEBPAD(data,p,r,k)%
% Methodology.
% INPUTS:
%   - data:  HSI data set (rows by columns by bands);
%   - p:     fractional transform order;
%   - r:     upper bound of the rank of low-rank part 'L';
%   - k:     upper bound of the cardinality of sparse part 'S'.
% OUTPUT:
%   - y:     final detection map (rows by columns).

    % Feature extraction
    [M,N,L]=size(data);
    data1=FrFT(data,p);           % apply FrFT on raw data
    
    % RC-LRASMD
    lp=RC_LRASMD(data1,r,k);        % low-rank part
    
    % Atoms selection
    ff=GRX_adv(data1,lp);           % construct the covariance matrix by lp
    gg=reshape(ff,M*N,1);           
    [~,ind]=sort(gg);
    X=reshape(data1,M*N,L);
    bkg=X(ind(1:0.5*M*N),:);        % selected background atoms
    
    % Output
    y1=GRX_adv(data1,bkg);
    Max=max(max(y1));
    Min=min(min(y1));
    y=(y1-Min)./(Max-Min);
end