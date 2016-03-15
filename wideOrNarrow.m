function [wide, narrow]=wideOrNarrow(valleyDir)
%function [wide, narrow]=wideOrNarrow(valleyDir)
%wideOrNarrow - Jason Hannawa - Adam Fuchs - Function which takes in and 2
%row array depicting the accessable valley walls. This function examines
%all the available valleys and categorizes them into wide or narrow
%depending on the width of the walls.
%INPUTS:
%valleyDir = Array of accessable valleys avaialable to the robot.
%OUTPUTS:
%wide = array of valleys that fulfill the wide criteria
%narrow = array of valleys that fulfill the narraow criteria

sub=diff(valleyDir);

%Find Narrow Valleys: These are valleys that have a sector clearance of
%>= 8 sectors and <12 sectors. this equates to an clearance angle range of
%24 degrees to 36 degrees or a clearance width of 1.25m to 1.85m.
n=(sub>=8 & sub<12);
narrow=valleyDir;
narrow(:,n==0)=[];

%Find Wide Valleys: These are valleys that have a sector clearance of 12
%sectors. This equates to a clearance angle of at least 36 degrees or a
%clearance width of 1.85m.
w=(sub>=12);
wide=valleyDir;
wide(:,w==0)=[];