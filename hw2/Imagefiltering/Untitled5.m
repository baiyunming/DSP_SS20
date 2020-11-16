
h1 = [1 2 1; 2 4 2; 1 2 1];
figure;
colormap(parula(64))
freqz2(h1,[32 32]);

w = fir1(40,0.5);
W2 = w'*w;
figure;
colormap(parula(64))
freqz2(W2,[32 32]);

