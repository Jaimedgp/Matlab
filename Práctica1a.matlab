%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  Programa escrito por Jaime Díez González-Pardo para Octave. Práctica 1 Cálculo    %%%% 
%%%%%         de velocidad y espacio de una partícula. Versión 1.0.2                     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc

%Para que las variables que asignemos no se vean afectadas por otras variables 
%Utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
%el comando clc nos dejará la terminal vacía.

clear 

%-------------------------------------------------
%----        DESARROLLO DEL PROGRAMA          ----
%-------------------------------------------------


%Para poder calcular la velocidad y la posición de la partícula debemos saber antes 
%algunas variables. algunas de ellas serán constantes y podremos asugnarlasdirectamente.
%Otras las pediremos por pantalla con el comando input('').

c=2.998e8;
t=input('Tiempo en segundos ');
M=input('Masa de la partícula en Kg ');
q=input('Carga eléctrica de la partícula en Culombios ');
E=2.00e5;

while (t<0) 
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE QUE EL VALOR DEL TIEMPO SEA POSITIVO')
	t=input('Tiempo en segundos ');
end

while (t<0) 
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE QUE EL VALOR DE LA MASA SEA POSITIVO')
	M=input('Masa de la partícula en Kg ');
end

%Para evitar mucha confusión en las ecuaciones de la velocidad y el espacio, 
%y puesto que hay operaciones sencillas que se repiten varias veces, agruparemos esas 
%operaciones en otras variables (z,y,w,s).

z=q*E*t;

y=M*c;

w=z/y;
s=1+w^(2);

%Asignadas ya variables a las operaciones sencillas, nos disponemos a 
%calcular la velocidad y el espacio de la particula.

v = sqrt([w^(2)*c^(2)]/s);

x = (y^(2)/(q*E))*(sqrt(s)-1);

%-------------------------------------------------
%----              Resultados                 ----
%-------------------------------------------------


disp(['v = ' num2str(v) ' m/s'])

disp(['x = ' num2str(x) ' m'])

%-------------------------------------------------------------------------------------------------------