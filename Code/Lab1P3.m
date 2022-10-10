%Q3 Parts 1 and 2

fs = 50000;                                % sample frequency (Hz)                     
Ts = [0:1/fs:1] ;                           % 10 second span time vector
fc=25000;
fm=5000;
Ac=1;
Am=1;
syms T;

% s(t)
s1 = Ac*(1+Am*cos(2*pi*fm*T)).*cos(2*pi*fc*T);
s2 = Ac*(1+Am*cos(2*pi*fm*Ts)).*cos(2*pi*fc*Ts);

y = fft(s2);

n = length(s2);          % number of samples
f = (0:n-1)*(fs/n);     % frequency range
power = abs(y).^2/n;    % power of the DFT

figure(1)
fplot(s1)
axis ([0 .001 -2 2])
xlabel('Frequency')
title('Part 1')

figure(2)
plot(abs(y))
xlabel('Frequency')
title('Part 2')