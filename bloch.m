%BLOCH Set paths for bloch package.
%
%   Seto Balian. Created Dec 10 2015. v.0.1

type([pwd '/LICENSE']);
addpath(genpath([pwd '/bloch']));
disp(' ')
disp('Paths set for bloch. The following were added:')
ls([pwd '/bloch/*'])
disp('Type help followed by the m-file name (without extension) for help.')
