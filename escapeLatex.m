function s_out = escapeLatex(s)
% Escape special LaTeX characters
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% s - input string
% ----- OUTPUTS -----
% s_out - string with escaped special characters
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

s_out = strrep(strrep(strrep(strrep(strrep(...
  strrep(strrep(strrep(strrep(strrep( ...
  s, '\\', '\textbackslash'), '#', '\#'), ...
  '$', '\$'), '%', '\%'), '&', '\&'), '~', '\~{}'), ...
  '_', '\_'), '^', '\^{}'), '{', '\{'), '}', '\}');
end