%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Programa escrito por Jaime Díez González-Pardo para Octave.     %%%%%%%
%%%%%      Realización del examen de Herramientas computacionales        %%%%%%%
%%%%%                19·Enero·2016. Versión 1.0.1                        %%%%%%%
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

V0 = input('Velocidad inicial en m/s: '); % Se pide por pantalla el valor de la velocidad inicial
alpha = input('Angulo de lanzamiento en grados: '); % se pide por pantalla el angulo de lanzamiento
b = input('coeficiente de rozamiento: '); % se pide por pantalla el coeficiente de proporcionalidad del rozamiento

g = 9.81; % se define la aceleracion de la gravedad

tf = 2*V0*sind(alpha)/g; % se calcula el tiempo final en el que cae la particula con rozamiento nulo

T = linspace(0,tf,1000); % se crea el vector tiempo con 1000 valores en el intervalo [0,tf]

n = tf/1000; % siendo n la anchura de los intervalos de T

%-----------------------------------------------------------

% crear vectores nulos de 1000 elementos para x, y, vx, vy

x = linspace(0,0,1000); 
y = linspace(0,0,1000);
vx = linspace(0,0,1000);
vy = linspace(0,0,1000);

% definir los primeros elementos de los vectores

x(1) = 0; % este paso daria igual pues el primer elemento ya es 0
y(1) = 0; % este paso daria igual pues el primer elemento ya es 0
vx(1) = V0*cosd(alpha); % velocidad inicial en la componente x
vy(1) = V0*sind(alpha); % velocidad inicial en la componente y

for k=2:1000 % bucle for para los elementos de los vectores del 2 al 1000
	x(k) = x(k-1) + vx(k-1) * n;
	y(k) = y(k-1) + vy(k-1) * n;
	vx(k) = vx(k-1) - b * vx(k-1) * n;
	vy(k) = vy(k-1) - (g + b*vy(k-1)) * n;
end;

%---------------------------------------------------------

plot(x,y,'r'); % se representa la funcion
title('Tiro parabolico'); % titulo de la grafica
xlabel('x /m'); % titulo eje x
ylabel('y /m'); % titulo eje y

%----------------------------------------------------------

% se calcula el alcance maximo, esto sera cuando y<0 pues 0 sera el suelo 
% el bucle while revisa cada elemento de y hasta que sea 0 que sera en el elemento i
% Puesto que el primer elemento es y(1)=0, la condicion sera y(i)>=0
% Puesto que apartir de ahi no hay ningun elemento igual a 0, se cojera el primer negativo, pues se encuentra mas cerca del 0 que el ultimo positivo 

i = 1; % el primer elemento de y  

while y(i)>= 0 % bucle para saber en que elemento i, y es negativa
	i = i + 1; % se estudia el siguiente elemento
end;

disp(['El alcance maximo del tiro sera: ' num2str(x(i)) ' m']);

