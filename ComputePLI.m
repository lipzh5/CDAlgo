function PLI_value = ComputePLI(x1,x2)
% Compute PLI(Phase lag index) for two signals
% Input: x1 & x2, EEG signals
% Output: PLI, the phase lag index
% PLI = abs(mean(sign(phaseLag(x1,x2))))
m = numel(x1); % number of data points
xx1 = hilbert(x1);
xx2 = hilbert(x2);
PLI = zeros(m,1);
for i=1:m
    phase1 = atan(imag(xx1(i))/real(xx1(i)));
    phase2 = atan(imag(xx2(i))/real(xx2(i)));
    delta = phase1-phase2;
    if -pi<delta && delta<=pi
        PLI(i) = (sign(delta));
    elseif 0<delta && delta<=2*pi
        PLI(i) = (sign(sin(delta)));
    end
end
PLI_value = abs(sum(PLI)/m);
end



