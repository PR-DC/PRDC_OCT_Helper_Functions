function flag = compareVersion(v1, v2)
% Compare two versions
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% v1 - first version
% v2 - second version
% ----- OUTPUTS -----
% flag - if v1 >= v2 true, else false
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

v1_an = zeros(1, 4);
v2_an = zeros(1, 4);
v1_a = strsplit(v1, '.');
v2_a = strsplit(v2, '.');

for i = 1:2
  v1_an(i) = str2double(v1_a{i});
  v2_an(i) = str2double(v2_a{i});
end
if(isempty(str2double(v1_a{3}(end)))) 
  temp = v1_a{3};
  v1_an(3) = str2double(temp(1:end-1));
  v1_an(4) = uint8(temp(end))-96;
end
if(isempty(str2double(v2_a{3}(end)))) 
  temp = v2_a{3};
  v2_an(3) = str2double(temp(1:end-1));
  v2_an(4) = uint8(temp(end))-96;
end

cmp = v1_an-v2_an;
flag = 1;
for i = 1:4
  if(cmp(i) ~= 0)
    if(cmp(i) > 0)
      flag = 1;
    else
      flag = 0;
    end
    break
  end
end
end