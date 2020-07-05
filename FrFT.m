function data1=FrFT(data,p)
% Feature extraction by Fractional Fourier Transformation.
% INPUTS:
%   - data:  HSI data set (rows * columns * bands);
%   - p:     fractional transform order.
% OUTPUT:
%   - data1: HSI data set after FrFT (rows * columns * bands).

    [M,N,L]=size(data);
    data1=zeros(M,N,L);
    alpha=p*pi/2;                                                             % rotation angle
    A=exp(-1j*pi*sign(sin(alpha))/4+1j*alpha/2)/sqrt(sin(alpha));             % A_alpha
    [s,u]=meshgrid(1:L,1:L);
    Kp_su=A.*exp(1j*pi.*(s.^2*cot(alpha)-2*s.*u*csc(alpha)+u.^2*cot(alpha))); % K_p(u,v)
    for i=1:M
        for j=1:N
            data1(i,j,:)=abs(reshape(data(i,j,:),1,L)*Kp_su);                 % FrFT of each pixel
        end
    end
end

