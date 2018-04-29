% closed_cylinder - Cria meshgrid para representação de um cilindro sólido
% de raio 'radius' e altura 'height', iniciando em 'zoffset' de distância
% do eixo 'z', com 'tdivs' definindo a precisão da circunferência base de
% criação. 'tdivs' define a a forma de aproximação do cilindro, por exemplo
% 'tdivs' = 4 utiliza um triângulo como base, 'tdivs' = 5 utiliza um quadrado
% como base, 'tdivs' = 200 aproxima uma circunferência, etc...
function [X, Y, Z] = closed_cylinder (radius, height, zoffset, tdivs)
    % Criação de constantes para definição do cilindro
    theta = linspace(0, 2 * pi, tdivs);
    zheta = linspace(0 + zoffset, height + zoffset, 20);
    
    % Criaçao da casca do cilindro por função paramétrica
    x = repmat(radius * cos(theta), 20, 1);
    y = repmat(radius * sin(theta), 20, 1);
    z = repmat(zheta', 1, tdivs);
    
    % Fecha cilindro (adiciona tampas concatenando uma
    % linha de zeros no ínicio e fim de X e Y, e duplicando
    % os valores iniciais e finais da matriz Z. 
    X = [zeros(1, tdivs); x; zeros(1, tdivs)];
    Y = [zeros(1, tdivs); y; zeros(1, tdivs)];
    Z = [z(1, :); z; z(end, :)];
end
