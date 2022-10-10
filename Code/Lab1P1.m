%ECOMMS Lab Project 1 Example
%S. Mandayam, Rowan University
%This program generates a 1-second duration
%Asharp signal (466.16 Hz) with a specified SNR
%Specify SNR
snr=10;
Ac = 0.5;
fm = 466.16;
fc = 1000;
b = 2; 

%Generate Asharp signal
t=(0:1/8e3:1.0)';
%s = Ac*sin(2*pi*fm*t); % Signal 1
%s = Ac.*(1 + cos(2.*pi.*fm.*t)).*cos(2.*pi.*fc.*t); % Signal 2  
s = Ac.*cos(2.*pi.*fc.*t + b.*sin(2.*pi.*fm.*t)); % Signal 3 
%sound(s);

%Compute signal variance
var_s = cov(s);

%Calculate required noise variance
var_noise=var_s/(10^(snr/10));

%Generate noise
n=sqrt(var_noise)*randn(length(s),1);
%sound(n);

%Add signal to noise and generate message
m=s+n;
sound(m);

subplot(3,1,1)
plot(s)
title('Message Signal')
xlabel('Time (t)')
xlim([0 100])

subplot(3,1,2)
plot(n)
title('Noisey Signal')
xlabel('Time (t)')
xlim([0 100])

subplot(3,1,3)
plot(m)
title('Message Signal with Noise Removed')
xlabel('Time (t)')
xlim([0 100])