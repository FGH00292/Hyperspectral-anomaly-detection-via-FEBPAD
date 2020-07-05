function y=GRX_adv(data,bkg)
% anomalous leval evaluation by modified GRX.
% INPUTS:
%   - data:  HSI data set (rows by columns by bands);
%   - bkg:   background atoms to construct the covariance matrix.
% OUTPUT:
%   - y:     final detection map (rows by columns).

    % Preprocessing
    [A,B,L]=size(data);
    X=reshape(data,A*B,L);
    mMean=mean(bkg);
    N=size(X,1);
    X=X-repmat(mMean,N,1);
    n=size(bkg,1);
    bkg=bkg-repmat(mMean,n,1);
    
    % Obtain the inverse of the covariance matrix
    sigma=(bkg'*bkg)/n;
    sigma_inv=inv(sigma);
    
    % Calculate the anomalous level of each pixel by Mahalanobis distance
    for i=1:N
        y(i)=X(i,:)*sigma_inv*X(i,:)';
    end
    y=(y-min(y(:)))./(max(y(:))-min(y(:)));
    y=reshape(y,A,B);
return

