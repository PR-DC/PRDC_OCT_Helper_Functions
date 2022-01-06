function [r, c] = fitCir3P(p1, p2, p3)
% Get circle passing through 3 given points
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% p1 - point 1
% p2 - point 2
% p3 - point 3
% ----- OUTPUTS -----
% r - circle radius
% c - circle center coordinates
% --------------------
%
% Copyright (C) 2021 PR-DC <info@pr-dc.com>
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as 
% published by the Free Software Foundation, either version 3 of the 
% License, or (at your option) any later version.
%  
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%  
% You should have received a copy of the GNU Lesser General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
% --------------------

a = (p1+p2)/2;
b = (p2+p3)/2;
u = p1-p2;
v = p2-p3;
d = a-b;
vu = v(:, 1).*u(:, 2)-v(:, 2).*u(:, 1);
if(any(vu == 0)) % Points are collinear, so no unique solution
  error('Points are collinear!');
end
g = -(d(:, 1).*u(:, 1)+d(:, 2).*u(:, 2))./vu;
c = [b(:, 1)+g.*v(:, 2), b(:, 2)-g.*v(:, 1)];
r = norm(c-p1, 'rows');
end