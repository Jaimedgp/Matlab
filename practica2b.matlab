%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%        Práctica 2b calculo de la integral de una función           %%%%%%%
%%%%%                     real. Versión 1.0.1                            %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para calcular la integral de la función real usaremos la aproximación trapezoidal
% La ecuación a calcular es: x^2+2*x-6

% Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc;

% Para que las variables que asignemos no se vean afectadas por otras variables 
% utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
% el comando clc nos dejará la terminal vacía.


clear;

%-------------------------------------------------
%----        DESARROLLO DEL PROGRAMA          ----
%-------------------------------------------------

% se pide los valores del intervalo en el que vamos a estudiar la función (a,b)

a = input('primer valor del intervalo a estudiar: '); % valor de a
b = input('segundo valor del intervalo a estudiar: '); % valor de b

n = input('numero de divisiones del intervalo: '); % numero de intervalor en los que dividiremos (a,b) para calcular la integral

%-------------------------------------------------
%----        CALCULO DE LA INTEGRAL           ----
%-------------------------------------------------

x = linspace(a,b,n); % vector de (a,b) con n elementos

f = x.^2+2*x-6; % función a estudiar

integral = 0; % el valor del area del rectángulo de la aproximación trapezoidal inicial es 0

delta = (b - a) / n; % anchura del rectángulo

xmed = a + delta / 2; % punto medio del primer intervalo

for in=1:1:n % se realiza la operación desde el rectangulo 1 al n
	integral = integral + (xmed^2+2*xmed-6) * delta; % la +  del area de los rectangulos anteriores + el area del rectangulo a estudiar

	xmed = xmed + delta; % se pasa al siguiente rectangulo
end;

disp(['el valor de la integral es: ' num2str(integral) ])

plot(x,f)