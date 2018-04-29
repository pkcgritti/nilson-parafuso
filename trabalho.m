%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nome do aluno:
% E-mail:
% Título do trabalho:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Introdução do trabalho
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Desenvolvimento
%
% Limpa espaço de trabalho e fecha todas as figuras
clc; clear;
close all;
%
% Define o conjunto de cores utilizadas para a representação 3D
% do parafuso. O formato da cor é em níveis RGB (Red, Green, Blue),
% variando entre [0, 1]. Sufixos '_edge' são utilizados para 
% definir a cor das arestas de uma classe de cor
steel = [.9, .9, .9];
steel_edge = [.7, .7, .7];
dark = [.1, .1, .1];
dark_edge = [.3, .3, .3];
%
% Desenha a cabeça de parafuso com raio = 7mm e altura = 5mm, a 84mm
% do plano xy, utilizando 6 pontos para aproximação cilindrica.
% 'hold on;' é chamado para tornar o 'plot' aditivo.
[x, y, z] = closed_cylinder(5, 5, 84, 6);
surf(x, y, z, 'facecolor', steel, 'edgecolor', steel_edge);
hold on;
%
% Desenha a base da cabeça do parafuso com raio variando de 
% 11mm a 9mm em 20 pontos equiespaçados utilizando a função
% nativa *cylinder*. Utiliza-se a funcão *scale_and_close* 
% para definir a dimensão correta do objeto e para translada-lo
% até o ponto onde deve ser renderizado.
[x, y, z] = cylinder(linspace(8, 6, 20));
[x, y, z] = scale_and_close(x, y, z, 82, 2);
surf(x, y, z, 'facecolor', steel, 'edgecolor', steel_edge);
%
% Desenha parte inferior da base da cabeça do parafuso, utilizando
% o mesmo procedimento apresentado no item anterior, com a diferença
% de que os raios são equiespaçados no intervalo 8mm a 11mm em 20
% pontos. Novamente, a função *scale_and_close* é utilizada
% para dimensionar e transladar o objeto gerado.
[x, y, z] = cylinder(linspace(6, 8, 20));
[x, y, z] = scale_and_close(x, y, z, 80, 2);
surf(x, y, z, 'facecolor', dark, 'edgecolor', dark_edge);
%
% Desenha o corpo do parafuso utilizando a função *closed_cylinder*
% com 2mm de raio, 80mm de altura, offset de 0mm, com 50 pontos de
% aproximação circular.
[x, y, z] = closed_cylinder(2, 80, 0, 50);
surf(x, y, z, 'facecolor', steel, 'edgecolor', steel_edge);
%
% Desenha rosca da extremidade utilizando uma função parametrizada
% por *t*, renderizada pela função nativa *plot3*.
t = linspace(0, 40 * pi, 200);
x = 2.2 * cos(t);
y = 2.2 * sin(t);
z = linspace(40, 0, 200);
plot3(x, y, z, 'linewidth', 2, 'color', dark);
%
% Desenha rosca da base utilizando uma função parametrizada por
% *t*, semelhante a utilizada no item anterior.
t = linspace(0, 10 * pi, 200);
x = 2.2 * cos(t);
y = 2.2 * sin(t);
z = linspace(80, 60, 200);
plot3(x, y, z, 'linewidth', 2, 'color', dark);
%
% Adiciona-se aspect ratio ao objeto renderizado, na tentativa de
% obter uma perspectiva mais realista, e adicionado 'labels' aos
% eixos do gráfico 3D
pbaspect([1, 1, 3]);
xlabel('Eixo X (mm)');
ylabel('Eixo Y (mm)');
zlabel('Eizo Z (mm)');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Conclusão do trabalho
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%