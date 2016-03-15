function valleyDir=valleyFinder(secArr, threshold, robotW)
% valleyFinder(secArr, threshold, robotW)
% Valley Finder - Adam Fuchs - Jason Hannawa - Function which takes in a
% 1x90 Array of sectors and decides which sectors can be classified as wide
% enough valleys to travel through.
% INPUTS:
% secArr = 1x90 sector array of binary values(1=obstacle, 0=no obstacle)
% threshold = preselected paramater of minimum obstacle clearance (meters)
% robotW = width of the robot (meters)
% OUTPUTS:
% valleyDir = Array of accessable valleys avaialable to the robot.

%determine the amount of consecutive sectors that must be clear in order
%for robot to safely navigate between obstacles.
clearanceAngle=180*(2*(asin(robotW/(2*threshold))))/pi; %degrees
sectToClear=floor(clearanceAngle/3);


b1=(find(diff(secArr)==-1)); %Find beginning of consecutive clear sectors
b1=b1+1;
b2=(find(diff(secArr)==1)); %Find end of consecutive clear sector

if (secArr(1) == 0)
    b1=[0,b1];
end
if (secArr(90) == 0)
    b2=[b2,90];
end

valleyDir = [b1;b2];
clear=(diff(valleyDir))+1;
clear=clear>=sectToClear;
valleyDir(:,(clear==0))=[]; %Eliminate consecutive clear sectors that are
                            %not wide endough for the robot to navigate
                            %through.
