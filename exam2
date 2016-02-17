%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%      Realización del examen de Herramientas computacionales        %%%%%%%
%%%%%                19·Enero·2016. Versión 2.0.1                        %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc;

% Para que las variables que asignemos no se vean afectadas por otras variables 
% utilizadas anteriormente las borramos todas con clear. Esto, junto con 
% el comando clc nos dejará la terminal vacía.


clear;

%------------------------------------------------------------------------------
%------------              DESARROLLO DEL PROGRAMA                 ------------
%------------------------------------------------------------------------------

% Se calcula el angulo para el que se consigue mayor alcance

V0 = input('Velocidad inicial en m/s: '); % Se pide por pantalla el valor de la velocidad inicial
b = input('coeficiente de rozamiento: '); % se pide por pantalla el coeficiente de proporcionalidad del rozamiento

ANG = linspace(0.01,90,500); % vector con 500 elementos entre los grados 0.01 y 90

%-----------------------------------------------
%-----     CODIGO DEL APARTADO ANTERIOR    -----
%-----------------------------------------------

g = 9.81; % se define la aceleracion de la gravedad

%-----------------------------------------------------------

for i=1:1:500

	tf = 2*V0*sind(ANG(i)); % se calcula el tiempo final en el que cae la particula con rozamiento nulo

	%----------------------------------------------------------------------------------------------------------------------------------------------------------
	% Se observa que al dividir tf entre g como en el apartado anterior el programa no responde pues no llega a caer y la grafica da una linea horizontal en 0.
	% El error que se produce es que en el bucle while de la linea 51 y(f) nunca llega a valer menos de 0 y el programa te da error al no poder leer la componente 1001 de y.
	% Una vez suprimida g se observa que la grafica describe una funcion similar a la que se muestra en el enunciado aunque el valor del angulo no coincida
	%-------------------------------------------------------------------------------------------------------------------------------------------------------------- 


	n = tf/1000; % siendo n la anchura de los intervalos de T

	% definir los primeros elementos de los vectores

	x(1) = 0; % este paso daria igual pues el primer elemento ya es 0
	y(1) = 0; % este paso daria igual pues el primer elemento ya es 0
	vx(1) = V0*cosd(ANG(i)); % velocidad inicial en la componente x
	vy(1) = V0*sind(ANG(i)); % velocidad inicial en la componente y

	for k=2:1000 % bucle for para los elementos de los vectores del 2 al 1000
		x(k) = x(k-1) + vx(k-1) * n;
		y(k) = y(k-1) + vy(k-1) * n;
		vx(k) = vx(k-1) - b * vx(k-1) * n;
		vy(k) = vy(k-1) - (g + b*vy(k-1)) * n;
	end;

	%----------------------------------------------------------

	% se calcula el alcance maximo, esto sera cuando y<0 pues 0 sera el suelo 

	f = 1; % el primer elemento de y  

	while y(f)>= 0 % bucle para saber en que elemento i, y es negativa
		f = f + 1; % se estudia el siguiente elemento
	end;

	%-----------------------------------
	%---   CODIGO NUEVO       ----------
	%-----------------------------------

	alcance(i) = x(f); % se sustituye cada elemento del vector por el alcance maximo para el elemento s de Ang

end;

%--------------------------------------------------------------

plot(ANG,alcance,'g'); % se representa la funcion
title('Tiro parabolico'); % titulo de la grafica
xlabel('Angulo /grados'); % titulo eje x
ylabel('Alcance /m'); % titulo eje y

%--------------------------------------------------------------

[m,n] = max(alcance); % el comando max() nos da el mayor valor del vector en la variable m y su posicion en la variable n

disp(['El angulo con el que se obtiene el mayor alcance es: ' num2str(ANG(n)) ]); % se escribe el angulo correspondiente al elemento de maximo alcance
