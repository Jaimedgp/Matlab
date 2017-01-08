%--------------------------------------------------------------------------------------------
%----  Programa escrito por Jaime Díez González-Pardo para Octave. Práctica              ----
%----          Cálculo del movimiento de un cohete. Versión 1.0.2                        ----
%--------------------------------------------------------------------------------------------


%Para que quede más bonito limpiamos la parntalla de terminal con el comando clc.

clc

%Para que las variables que asignemos no se vean afectadas por otras variables 
%Utilizadas anteriormente las borramos todas con clear all. Esto, junto con 
%el comando clc nos dejará la terminal vacía.

clear 

%-------------------------------------------------
%----        DESARROLLO DEL PROGRAMA          ----
%-------------------------------------------------

%Para poder calcular la velocidad y espacio recorrido por el cohete debemos saber 
%antes algunas variables. las pediremos por pantalla con el comando input('').

%----------------------------------------------------------------------------

u = input('velocidad de salida de los gases respecto al cohete en m/s: ');
D = input('masa de combustible quemado por segundo: ');
m_0 = input('suma de la masa del cohete y el combustible inicial: ');
c = input('masa de combustible inicial');
t = input('instante de tiempo: ')

%---------------------------------------------------------------------------
while m_0<c
	disp('SE HA DETECTADO ALGÚN PROBLEMA, ASEGURATE DE METER CORRECTAMENTE LOS VALORES DE LA MASA DEL COMBUSTIBLE Y LA DEL COHETE MÁS LA DEL COMBUSTIBLE')
	m_0 = input('suma de la masa del cohete y el combustible inicial: ');
	c = input('masa de combustible inicial');
end%---------------------------------------------------------------------------

t_max = c/D;

%para 

z_max=m_0-(D*t_max)

x_tmax = u*t_max*(log(m_0))+(u/D)*[z_max*log(z_max)+(z_max*log(m_0))];

v_tmax = u*log(m_0/z_max);

%---------------------------------------------------------------------------

%Para evitar mucha confusión en las ecuaciones de la velocidad y el espacio, 
%y puesto que hay una operacion sencilla que se repite varias veces, agruparemos esas 
%operaciones en una variable (z)

z=m_0-(D*t)

%si el instante del tiempo dado es mayor que el t_max, el cohete se desplaza 
%con MRU a partir del instante t_max. Si no, las ecuaciónes de la velocidad y
%el espacio es igual a las ecuaciones de t_max. 


if t>t_max

	x_t = x_tmax + v_t*(t-t_max);
	v_t = v_tmax+ (x_t/t_max);

else
	x_t = u*t*(log(m_0))+(u/D)*(z*log(z)+(z*log(m_0)));

	v_t = u*log(m_0/z);
end;

%-------------------------------------------------
%----              Resultados                 ----
%-------------------------------------------------

disp(['v = ' num2str(v_tmax) ' m/s'])

disp(['x = ' num2str(x_tmax) ' m'])

disp(['v = ' num2str(v_t) ' m/s'])

disp(['x = ' num2str(x_t) ' m'])

%-------------------------------------------------