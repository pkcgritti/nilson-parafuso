% scale_and_close - Dimensiona componente 'Z' de um 'mesh' e fecha as
% extremidades do componente.
function [X, Y, Z] = scale_and_close(x, y, z, zoffset, zscale)
  z = zoffset + z * zscale;
  X = [zeros(1, length(x)); x; zeros(1, length(x))];
  Y = [zeros(1, length(y)); y; zeros(1, length(y))];
  Z = [z(1,:); z; z(end, :)];
end