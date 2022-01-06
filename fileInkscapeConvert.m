function fileInkscapeConvert(filename, in, out, n_retries, timeout)
% Convert file format using Inkscape (https://inkscape.org/)
% Inkscape needs to be in user path
% Author: Milos Petrasinovic <mpetrasinovic@prdc.rs>
% PR-DC, Republic of Serbia
% info@pr-dc.com
% ----- INPUTS -----
% filename - [-] name of file
% in - [-] input format
% out - [-] output format
% n_retries - [-] number of retries
% timeout - [s] wait timeout
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

pcmd = 'inkscape';
pprocname = 'inkscape.com';
flag = false;
for i = 1:n_retries
  [~, msg1] = system('tasklist');
  pids1 = cell2mat(cell2mat(regexp(regexp(msg1, ...
    [pprocname '[ ]+[0-9]+ Console'], 'match'), '[0-9]+', 'match')));
  system(['START /b ' pcmd ' ' filename '.' in ...
    ' --export-area-drawing --export-type=' out ...
    ' --export-filename=' filename '.' out ' >nul 2>nul']);
  [~, msg2] = system('tasklist');
  pids2 = cell2mat(cell2mat(regexp(regexp(msg2, ...
    [pprocname '[ ]+[0-9]+ Console'], 'match'), '[0-9]+', 'match')));
  I = ismember(pids2, pids1);
  pid = pids2(find(~I));
  
  tStart = tic;
  while toc(tStart) < timeout
    [~, msg] = system('tasklist');
    pids = cell2mat(cell2mat(regexp(regexp(msg, ...
      [pprocname '[ ]+[0-9]+ Console'], 'match'), '[0-9]+', 'match')));
    if(isempty(pid) || isempty(pids) || ~ismember(pid, pids))
      flag = true;
      break
    end
    pause(0.01)
  end
  if(flag)
    break
  else
    if(ispc && pid > 0)
      system(['Taskkill /PID ' pid ' /F  >nul 2>nul']);
    end  
  end
end

if(~flag)
  disp(' Export failed!');
end
end