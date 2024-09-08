% This is a script file to test the macheps and quadroot routines.
%
% Save this file in the Matlab working directory (with your other matlab files
% like startup.m and quadroot.m).  Then in the command window type
% (without the >>)
% >> NAProg1Test
%
% It erases any file (in the Matlab path) called prog1run, and
% writes output to a file in the Matlab working directory called prog1run.
%
% When your code is working to your satisfaction, print out and email me
% quadroot.m and prog1run

diary off
if exist('prog1run','file'),
    delete('prog1run')
	disp(' ')
	disp('deleting old prog1run file to make new one')
end
cf = get(0,'Format')
format long e

diary prog1run
disp(' ')

[r1,r2,erfl]=quadroot(1,1,-2);
disp('x^2 + x - 2:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(-1,-1,2);
disp('-x^2 - x + 2:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(1e155,1e155,-2e155);
disp('1e155x^2 + 1e155x - 2e155:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(1e-155,1e-155,-2e-155);
disp('1e-155x^2 + 1e-155x - 2e-155:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(1,-4,5);
disp('x^2 - 4x + 5:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(3e-7,3,-5e-13);
disp('3e-7x^2 + 3x - 5e-13:'),roots=[r1,r2],erfl,disp(' ')

[r1,r2,erfl]=quadroot(-3e-7,-3,5e-13);
disp('-3e-7x^2 - 3x + 5e-13:'),roots=[r1,r2],erfl,disp(' ')

disp('1e-42x^2 - 2x + 2:'),
try,
	[r1,r2,erfl]=quadroot(1e-42,-2,2);
    roots=[r1,r2],erfl,disp(' ')
catch
	warning('NAProg1Test: error call in quadroot')
end

disp('0x^2 - 2x + 2:'),
try,
	[r1,r2,erfl]=quadroot(0,-2,2);
	roots=[r1,r2],erfl,disp(' ')
catch,
	warning('NAProg1Test: error call in quadroot')
end

disp('0x^2 + 0x + 2:'),
try,
    [r1,r2,erfl]=quadroot(0,0,2);
    roots=[r1,r2],erfl,disp(' ')
catch
	warning('NAProg1Test: error call in quadroot')
end

diary off
format(cf)
