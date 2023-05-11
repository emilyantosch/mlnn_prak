function [func, gradFunc] = createFuncsA1()
%  createFuncsA1(): erzeuge die in Aufgabe 1 zu minimierende Funktion mit
%  Ableitung. f(x) ist ein Polynom der Ordnung D=9.


   wb = [-0.000008129409171;    % Koeffizient von x^D
      0.000033939014202;        % Koeffizient von x^(D-1)
      0.000293485449736;
      -0.001162065703478;
      -0.002913773148158;
      0.010592965256332;
      0.009096671075889;
      -0.027219065764199;
      -0.006468253968319;    % Koeffizient von x^1
      0.009684123925775];    % = b
   D = length(wb) - 1;   % Grad des Polynoms

   function y = funcImpl(x)
      y = wb(end) * ones(size(x));   % konstanter Term
      for d = 1:length(wb)-1
         y = y + wb(d) * x.^(D-d+1); 
      end
      % alternativ: 
      % y = polyval(wb, x); 
   end
   func = @funcImpl; 

   function dy = gradFuncImpl(x)
      dy = wb(end-1) * ones(size(x));   % konstanter Term
      for d = 1:length(wb)-2
         dy = dy + (D-d+1) * wb(d) * x.^(D-d); 
      end
   end
   gradFunc = @gradFuncImpl; 
end