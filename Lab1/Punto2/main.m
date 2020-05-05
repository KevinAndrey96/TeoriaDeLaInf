#Creación de variables iniciales para el ancho del pulso rectangular
a = 1; #Ancho del pulso
t = [-5:0.1:5]; #Duración del pulso en tiempo
w = t; #w toma los mismos valores de t pero en frecuencias (Hz)
f_t = pulsoRectangular(t, a); #Instancia del pulso rectangular

#Generación de gráfica del pulso rectangular
figure(1);
subplot(3,1,1);
plot(t,f_t,"-b");
xlabel('t'); 
ylabel('x(t)'); 
title('Pulso Rectangular'); 
axis([-5.1 5.1 -0.1 1.1]);
grid;

#Generación de la gráfica de la transformada teórica de Fourier
sa=inline('2*a*(sin(w*a)+(w==0))./(w*a+(w==0))','w');
subplot(3,1,2);
plot(w,sa(w),"-r");
xlabel('\omega');
ylabel('x(\omega)');
title('Transformada TeÃ³rica de Fourier = sa(\omega)');
axis([-5.1 5.1 -1.1 2.1]);
grid;

#Generación de la gráfica de la transformada computacional de Fourier (FFT)
fw = fft(f_t);
subplot(3,1,3);
plot(t,fftshift(abs(fw)),"-g");
xlabel('\omega');
ylabel('x(\omega)');
title('FFT ~ sa(\omega)');
axis([-1 1]);
grid;

#Creación de variables iniciales para aplicar los filtros ideales
wcut = 0.8;
w1 = 0.5;
w2 = 1.5;

#Instanciación de los 4 tipos de filtros ideales
lpt = (t < wcut) & (t > -wcut); #Pasa bajas
hpt = (t > wcut) | (t < -wcut); #Pasa altas
BPF = ((t < w2) & (t > w1)) | ((t > -w2) & (t < -w1)); #Pasa bandas
BPS = (t < -w2) | ((t > -w1) & (t < w1)) | (t > w2); #Suprime bandas

#Generación de las gráficas de la aplicación de los filtros de corte.
figure(2);
subplot(2,2,1);
plot(w,fftshift(abs(fw)).*lpt,"-r");
xlabel('\omega'); ylabel('x(\omega)'); title('Filtro LPT en \omega'); axis([-3 3]); grid;

subplot(2,2,2);
plot(w,fftshift(abs(fw)).*hpt,"-r");
xlabel('\omega'); ylabel('x(\omega)'); title('Filtro HPT en \omega'); axis([-3 3]); grid;

#Generación de las gráficas de los filtros de corte en el tiempo.
subplot(2,2,3);
Y = ifftshift(fftshift(fw).*lpt);
ft = ifft(Y);
plot(t,abs(ft),'-b');
xlabel('t'); ylabel('x(t)'); title('Filtro LPT en t'); axis([-3 3 ]); grid;

subplot(2,2,4);
Z = ifftshift(fftshift(fw).*hpt);
ft = ifft(Z);
plot(t,abs(ft),'-b');
xlabel('t'); ylabel('x(t)');  title('Filtro HPT en t');  axis([-3 3 ]); grid;

#Generación de las gráficas de la aplicación de los filtros de banda.
figure(3);
subplot(2,2,1);
plot(w,fftshift(abs(fw)).*BPF,"-r");
xlabel('\omega'); ylabel('x(\omega)'); title('Filtro BPF en \omega'); axis([-3 3]); grid;

subplot(2,2,2);
plot(w,fftshift(abs(fw)).*BPS,"-r");
xlabel('\omega'); ylabel('x(\omega)'); title('Filtro BPS en \omega'); axis([-3 3]); grid;

%Generación de las gráficas de los filtros de banda en el tiempo.
subplot(2,2,3);
Y = ifftshift(fftshift(fw).*BPF);
ft = ifft(Y);
plot(t,abs(ft),'-b');
xlabel('t'); ylabel('x(t)'); title('Filtro BPF en t'); axis([-3 3 ]); grid;

subplot(2,2,4);
Z = ifftshift(fftshift(fw).*BPS);
ft = ifft(Z);
plot(t,abs(ft),'-b');
xlabel('t'); ylabel('x(t)'); title('Filtro BPS en t'); axis([-3 3 ]); grid;