function pkgForgeCheck(pkgFname, min_version)
% GNU Octave forge package check
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% pkgFname - name of forge package
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

fpkg = pkg('list', pkgFname);
if(~isempty(fpkg)) 
  if(nargin > 1)
    if(compare_versions(fpkg{1}.version, min_version, '>='))
      if(~fpkg{1}.loaded)
        pkg('load', pkgFname);
      end
    else
      disp([' Wait for ' pkgFname ' package to be updated...']);
      pkg('update', pkgFname);
      pkg('load', pkgFname);
      disp(' Package is updated and loaded...');
    end
  else
    if(~fpkg{1}.loaded)
      pkg('load', pkgFname);
    end
  end
else
  disp([' Wait for ' pkgFname ' package to be installed...']);
  try
    pkg('install', '-forge', pkgFname);
    pkg('load', pkgFname);
    disp(' Package is installed and loaded...');
  catch
    error('Package installation failed!');
  end
end
end