%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%         Realización de un examen de años anteriores                %%%%%%%
%%%%%            Práctica 2c (Voluntaria). Versión 1.0.1                 %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc;

% Para que las variables que asignemos no se vean afectadas por otras variables 
% utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
% el comando clc nos dejará la terminal vacía.


clear;

%------------------------------------------------------------------------------
%------------              DESARROLLO DEL PROGRAMA                 ------------
%------------------------------------------------------------------------------

% Las constantes del programa

N = 6.023e23; % numero de Avogadro
Kb = 1.38e-23; % constante de Boltzmann

disp('Escoge el metal que quieres estudiar: Li, Na, K, Cr, Fe o Co.')

% Para que reconozca el nombre del metal como una variable, este debe ir asociado a un numero

Li = 1;
Na = 2;
K = 3;
Cr = 4;
Fe = 5;
Co = 6;

metal = input('Metal: ');

%----------------------------------------------------

% igual el usuario a metido mal el nombre del metal
while metal != 1 && metal != 2 && metal != 3 && metal != 4 && metal != 5 && metal != 6
	disp('ERROR. No has escogido ningun metal, asegurate de escribir su simbolo ej.:Na')
	metal = input('Metal: ');
end;

% Escoger las variables dependiendo del metal

if metal==1 %Da igual poner litio que 1
	S = 0.00163; % valor del coeficiente Sommerfeld
	D = 344; % valor de la temperatura de Debye
	disp('Has escogido el Litio');
end;

if metal==2
	S = 0.00138; % valor del coeficiente Sommerfeld
	D = 158; % valor de la temperatura de Debye
	disp('Has escogido el Sodio');
end;

if metal==3
	S = 0.00208; % valor del coeficiente Sommerfeld
	D = 91; % valor de la temperatura de Debye
	disp('Has escogido el Potasio');
end;

if metal==4
	S = 0.0014; % valor del coeficiente Sommerfeld
	D = 630; % valor de la temperatura de Debye
	disp('Has escogido el Cromo');
end;

if metal==5
	S = 0.00498; % valor del coeficiente Sommerfeld
	D = 470; % valor de la temperatura de Debye
	disp('Has escogido el Hierro');
end;

if metal==6
	S = 0.00473; % valor del coeficiente Sommerfeld
	D = 445; % valor de la temperatura de Debye
	disp('Has escogido el Cobalto');
end;

%---------------------------------------------------

% Se pide el valor del intervalo de la temperatura que se va estudiar

disp('Entre que intervalo de temperaturas en Kelvin quieres estudiar el metal?');
t = input('Escribir en forma [a,b]: '); % se pide el vector Temperatura
T1 = t(1); % como se necesita el valor inicial
T2 = t(2); % se necesita el valor final 

% al utilizar la unidad del Kelvin no son posibles temperaturas menores ni iguales al 0 absoluto

while T1 <= 0
	disp('ERROR. Se a producido un error, revisa que has metido la temperatura en Kelvin');
	disp('Entre que intervalo de temperaturas en Kelvin quieres estudiar el metal?');
	t = input('Escribir en forma [a,b]: ');
	T1 = t(1);
	T2 = t(2);
end;

while T2 <= 0
	disp('ERROR. Se a producido un error, revisa que has metido la temperatura en Kelvin');
	disp('Entre que intervalo de temperaturas en Kelvin quieres estudiar el metal?');
	t = input('Escribir en forma [a,b]: ');
	T1 = t(1);
	T2 = t(2);
end;

% para la primera parte del examen te pide el calor específico para una temperatura determinada

T = (T1 + T2) / 2; % La temperatura determinada fija será la media del intervalo escogido
%---------------------------------------------------

%la integral se calcula en el interbalo (a,b)

a = 0; % primer valor del intervalo de la integral
b = D / T; % primer intervalo de la integral
% numero de divisiones entre las que se va a dividir el intervalo de la integral

n=1500; % valor escogido por el programador para que la integral sea suficientemente precisa sin afectar demasiado al tiempo de procesamiento  

integral = 0; % el valor del area del rectángulo de la aproximación trapezoidal inicial es 0

delta = (b - a) / n; % anchura del rectángulo

xmed = a+delta/2; % punto medio del primer intervalo

for in=1:1:n % se realiza la operación desde el rectangulo 1 al n
	integral = integral + (((xmed^4) * (e^xmed) ) / ((e^xmed - 1)^2)) * delta; % la +  del area de los rectangulos anteriores + el area del rectangulo a estudiar

	xmed = xmed + delta; % se pasa al siguiente rectangulo
end;

C = (S*T) + (9*N*Kb*((T/D)^3)*integral); % valor del calor especifico de la temperatura media del intervalo 

disp(['El calor especifico del metal escogido es ' num2str(C)]);

%------------------------------------------------------

v = (T2 - T1) / 5; % dividimos el intervalo en divisiones de 5K

MT = linspace(T1,T2,v); % vector del intervalo dividido en 5K

MC = linspace(0,0,v); % vector 0 de los mismos términos que MT

for i=1:v  % se realiza la operación desde el rectangulo 1 al v
	a1 = 0; % primer valor del intervalo de la integral
	b1 = D / MT(i); % segundo inte
	n=1500;

	integral1 = 0; % el valor del area del rectángulo de la aproximación trapezoidal inicial es 0

	delta1 = (b1 - a1) / n; % anchura del rectángulo

	xmed1 = a1 + delta1 / 2; % punto medio del primer intervalo

	for in1=1:1:n % se realiza la operación desde el rectangulo 1 al n
		integral1 = integral1 + ((xmed1^4 * e^xmed1 ) / ((e^xmed1 - 1)^2)) * delta1; % la +  del area de los rectangulos anteriores + el area del rectangulo a estudiar

		xmed1 = xmed1 + delta1; % se pasa al siguiente rectangulo
	end;

	MC(i) = S*T + 9*N*Kb*((MT(i)/D)^3)*integral1; % valor del calor específico para la temperatura MT(i)
end;

plot(MT, MC,'b'); % se representa la función
title('Calor especifico del metal'); % titulo de la gráfica
xlabel('Temperatura/K'); % nombredel eje x
ylabel('Cv /(J/Kg/mol) '); % nombre del eje y