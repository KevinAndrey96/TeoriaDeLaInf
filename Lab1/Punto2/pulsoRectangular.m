% Definición de un pulso rectangular con los siguientes parámetros:
% t = Tiempo de escucha de la señal
% a = Tamaño del pulso medido en tiempo, 
% Obligatorio que t >> a para que tenga sentido su estudio
function y = pulsoRectangular(t, a)
  y = [];
  for i = t
    aux = (i < a) && (i > -a);
    y = [y aux];
  endfor
endfunction