syms t;
Fs = 10000;   %sampling rate
Ts = 1/Fs; %sampling time interval
s = -10:Ts:10-Ts; %sampling period
%n = length(t); %number of samples

yt = heaviside(t) - heaviside(t-0.6) + heaviside(t-0.7)-heaviside(t-1); % the step curve
y = heaviside(s) - heaviside(s-0.6) + heaviside(s-0.7)-heaviside(s-1); % CTF version 

% Time-domain Signal
subplot(3,1,1);
fplot(yt, [-0.00001 1.2],'LineWidth', 2)
axis([-0.01 1.1 0 1.2])
ylabel('w(t)')
xlabel('time (t)')
title('Time-domain signal')
grid
    
% Continuous Time Signal
YfreqDomain = fft(y); %take the fft of our step funcion, y(t)
dtf=abs(YfreqDomain);

subplot(3,1,2);
plot(fftshift(dtf))
%axis([-1000,2000,0,100])
xlabel('Frequency')
title('DFT')
grid

% Reconstructed Time-domain Signal
YfreqDomainR = fft(y); %take the fft of our step funcion, y(t)
r=abs(ifft(YfreqDomainR));

subplot(3,1,3);
plot(fftshift(r), 'LineWidth', 2)
axis([-0.01*Fs 1.1*Fs 0 1.2])
xlabel('Frequency')
title('Reconstructed Time-domain signal')
grid