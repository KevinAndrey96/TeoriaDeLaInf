function y = get_nivel(x)
  y = [];
  for a = 1 : length(x)
    if (x(a) >= -1 && x(a) < -0.75)
      y(a) = 0;
    elseif (x(a) >= -0.75 && x(a) < -0.5)
      y(a) = 1;
    elseif (x(a) >= -0.5 && x(a) < -0.25)
      y(a) = 2 ;
    elseif (x(a) >= -0.25 && x(a) < 0)
      y(a) = 3;
    elseif (x(a) >= 0 && x(a) < 0.25)
      y(a) = 4;
    elseif (x(a) >= 0.25 && x(a) < 0.5)
      y(a) = 5;
    elseif (x(a) >= 0.5 && x(a) < 0.75)
      y(a) = 6;
    elseif (x(a) >= 0.75 && x(a) <= 1)
      y(a) = 7;
    endif
  endfor
endfunction
