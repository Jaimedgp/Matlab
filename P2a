%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%        Práctica 2a calculo de la derivada de una función           %%%%%%%
%%%%%                   real. Versión 1.0.1                              %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc;

% Para que las variables que asignemos no se vean afectadas por otras variables 
% utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
% el comando clc nos dejará la terminal vacía.


clear;

%-------------------------------------------------
%----        DESARROLLO DEL PROGRAMA          ----
%-------------------------------------------------

% se pide por pantalla los valores del intervalo a estudiar (a,b)

a = input('Primer valor: '); % pedimos el valor a
b = input('Segundo valor: '); % pedimos el valor b

n = input('numero de intervalos a calcular: '); % numero de intervalos en los que se dividirá (a,b) 


x = linspace(a,b,n); % se crea un vector con los valores que vamos a estudiar (a,b)

f = linspace(0,0,n); % se crea un vector 0 con n elementos 

% Se sustituye cada elemnto del vector f por el resultado de la función en el punto correspondiente al mismo elemnto del vector x

for i=1:1:n % i es la coordenada de cada elemento de f que va de 1 a n
	f(i) = x(i)^2+2*x(i)-6; % sustituimos el elemento f(i) por el valor de la función en x(i)
end;

%-------------------------------------------------

% Se calcula la derivada

df = linspace(0,0,n); % se crea un vector nulo con n elementos

% para facilitar la ecuación de la derivada creamos los vectores de los valores en los que vamos a calcular la función
% h ha de ser un valor muy pequeño por lo que utilizamos el comando 'realmin' que nos da el menor valor positivo que maneja matlab

xh = x + realmin; % vector (Xo + h)
hx = x - realmin; % vector (Xo - h)

% Se sustituye cada elemento de df por el valor de la fórmula en el punto correspondiente al mismo elemento de los vectores xh y hx

for i=1:1:n % i es la coordenada de cada elemento de df que va de 1 a n
	df(i) = ((xh(i)^2+2*xh(i)-6)-(hx(i)^2+2*hx(i)-6))/(2*realmin);% sustituimos el elemento df(i) por el valor de la fórmula en x(i)
end;

%-------------------------------------------------
%----      PRESENTACIÓN DE LOS DATOS          ----
%-------------------------------------------------

hold; % nos permite plotear dos funciones en una misma gráfica
plot(x,f,'b') % representamos la función en (a,b) en azul
plot(x,df,'r') % representamos la derivada en (a,b) en rojo
