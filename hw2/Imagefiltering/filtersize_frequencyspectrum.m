
h1 = fspecial('gaussian',[3,3]);
figure;
colormap(parula(64))
freqz2(h1,[32 32]);

h2 = fspecial('gaussian',[8,8]);
figure;
colormap(parula(64))
freqz2(h2,[32 32]);

h3 = fspecial('gaussian',[16,16]);
figure;
colormap(parula(64))
freqz2(h3,[32 32]);
