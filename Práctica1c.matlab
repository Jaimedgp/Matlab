%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%        Práctica 3  calculo de la trayectoria de una pelota         %%%%%%%
%%%%%          de tenis lanzada por un lanzador. Versión 1.0.3           %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc

% Para que las variables que asignemos no se vean afectadas por otras variables 
% utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
% el comando clc nos dejará la terminal vacía.


clear 

%-------------------------------------------------
%----        DESARROLLO DEL PROGRAMA          ----
%-------------------------------------------------

% Pedimos variables por pantalla

alpha = input('angulo del disparo con respecto del suelo en grados: ');
v_0 = input('velocidad inicial en metros por segundo: ');
L = input('Longitud del lanzador en metros: ');
d_r = input('Distancia a la red en metros: ');
a_r = input('Altura de la red en metros: ');
a_t = input('Altura al techo en metros: ');

%-------------------------------------------------------------------

% Nos aseguramos de que los valores estan bien metidos

while alpha > 90
	disp('La Pelota es disparada hacia atrás')
end;

while alpha > 180
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE EL VALOR DE alpha')
	alpha = input('angulo del disparo con respecto del suelo en grados: ');
end;

while v_0 < 0
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE EL VALOR DE LA VELOCIDAD INICIAL')
	v_0 = input('velocidad inicial en metros por segundo: ');
end;

while L < 0
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE LA LONGITUD DEL LANZADOR')
	L = input('Longitud del lanzador en metros: ');
end;

while d_r < 0
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE LA DISTANCIA A LA RED')
	d_r = input('Distancia a la red en metros: ');
end;

while a_r > a_t
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE LA ALTURA DE LA RED')
	a_r = input('Altura de la red en metros: ');
end;

while a_r = a_t
	disp('La pelota no pasará la red pues la altura de esta coincide con la del techo')
end;

%------------------------------------------------

% Se asignan valores ya predeterminados

g = 9.81;

X_0 = L * cosd(alpha);

y_0 = L * sind(alpha);

% Se  calcula el tiempo

t = (2*v_0*sind(alpha))/g;

t_2 = t/2;    %el tiempo en la altura máxima

% Se calcula la aposición de la pelota (x,y)

x = X_0 + v_0*cosd(alpha)*t;

x_ymax = X_0 + v_0*cosd(alpha)*t_2;    % la posición 'x' en 'y_max'

y_max = y_0 + v_0*sind(alpha)*t_2 - (1/2)*g*t_2^2;

%-------------------------------------------------
%----              Resultados                 ----
%-------------------------------------------------

% Si 'y' es mayor o igual a la altura del techo, la pelota chocará contra al techo:

while y_max > a_t
	disp('LA PELOTA DE TENIS CHOCA CONTRA EL TECHO')

	if x >= d_r
		disp(['La pelota no pasa la red y choca contra el techo en x = ' num2str(x_ymax) ' m'])

	else
		disp(['La pelota pasa la red y choca contra el techo en x = ' num2str(x_ymax) ' m'])
	end;
end;

% Si 'y' es menor que que la altura del techo y mayor que la altura de la red:

while a_r < y_max < a_t

	if x > d_r
		disp(['La pelota pasa la red y cae en x =' num2str(x) ' m alcanzando una altura máxima de h_max =' num2str ' m'])
	else
		disp(['La pelota cae antes de la red en x =' num2str(x) ' m alcanzando una altura máxima de h_max =' num2str ' m'])
	end;
end;

% Si 'y' es menor que la altura de la red la pelota no pasará la red:

while y_max < a_t

	if x > d_r
		disp('La pelota se estrella contra la red')
	else
		disp(['La pelota cae antes de la red en x =' num2str(x) ' m alcanzando una altura máxima de h_max =' num2str ' m'])
	end;
end;

%---------------------------------------------------------------------------------------------
