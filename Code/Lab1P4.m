rap = 'reeses.mp3';xbox
[x,fs] = audioread(rap);

t = (0:1/fs:(length(x)-1)/fs);

plot(t,x)
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Reeses Puffs Rap')
xlim([0 t(end)])

reeses = x(0.85e5:2.18e5);
t = (0:1/fs:(length(reeses)-1)/fs);

subplot(2,1,1)
plot(t,reeses)
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Reeses Puffs from Reeses Puffs Rap')
xlim([0 t(end)])

m = length(reeses);       % original sample length
n = pow2(nextpow2(m));  % transform length
y = fft(reeses,n);        % DFT of signal

f = (0:n-1)*(fs/n)/10;
power = abs(y).^2/n;      

subplot(2,1,2)
plot(f(1:floor(n/2)),power(1:floor(n/2)))
axis([0 12 0 130])
xlabel('Frequency')
ylabel('Power')