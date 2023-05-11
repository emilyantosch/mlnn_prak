%% Praktikum 2: Aufgabe 1

% f: die zu minimierende Funktion f(x)
% df: Ableitung der Funktion, f'(x)
[f, df] = createFuncsA1(); 

%% Plotten der Funktion
xx = linspace(-6, 6); 
plot(xx, f(xx));
ylim([-0.6, 0.2]);
xlabel('x'), ylabel('f(x)'), title('Die zu minimierende Funktion');

%% Gradientenabstieg
x0 = 4.7;   % Anfangspunkt, nicht ändern!
hold on; 
plot(x0, f(x0), 'kx');
hold off; 


