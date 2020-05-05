function [xq]=cuantUniforme(x,xmax,n)
% DESCRIPCIÓN: cuantiza x sobre (-xmax,xmax) usando 2^n niveles.
% ENTRADAS: - x=señal de entrada.
%                     - xmax=magnitud máxima de la señal a ser cuantizada.
%                     - n=número de bits de cuantización.
% SALIDAS: - xq=señal cuantizada.

if (nargin~=3)
	disp('Número incorrecto de argumentos de entrada');
	return;
end
L=2^n;
Delta=(2*xmax)/L;
q=floor(L*((x+xmax)/(2*xmax)));          % q={...,-2,-1,0,1,2,...,L-1,L,L+1,...}
i=find(q>L-1); q(i)=L-1;                           % q={...,-2,-1,0,1,2,...,L-1}
i=find(q<0); q(i)=0;                                 % q={0,1,2,...,L-1}
xq=(q*Delta)-xmax+(0.5*Delta);
