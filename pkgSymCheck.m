function pkgSymCheck(pkgFile, min_version)
% GNU Octave Symbolic package check
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% pkgFile - file with package
% min_version - version of package
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

warning('off', 'Octave:data-file-in-path');
spkg = pkg('list', 'symbolic');
if(~isempty(spkg)) 
  if(nargin > 1)
    if(compare_versions(spkg{1}.version, min_version, '>='))
      if(~spkg{1}.loaded)
        pkg('load', 'symbolic');
      end
    else
      disp(' Wait for Symbolic package to be installed...');
      pkg('uninstall', 'symbolic');
      pkg('install', pkgFile);
      pkg('load', 'symbolic');
      disp(' Symbolic package is installed and loaded...');
    end
  else
    if(~spkg{1}.loaded)
      pkg('load', 'symbolic');
    end
  end
else
  disp(' Wait for Symbolic package to be installed...');
  pkg('install', pkgFile);
  pkg('load', 'symbolic');
  disp(' Symbolic package is installed and loaded...');
end
end