%Second version of the dataAcquire program to teach students basic MATLAB
%skills. These programs build on each other to the final version. This
%version has a loop which runs ten times, and plots a random data point
%each loop. The values are plotted versus the clock time, and the times and
%data points are stored arrays.
%
% Skills: making a MATLAB script, making a loop, initializing variables,
% plotting, workin with times, concatenating arrays

clear all; % clears variables from the workspace
close all; % closes all current figures

i=0;
startTime=clock();
timeArray=[];
sampleArray=[];

while(i<10)
    i=i+1
    timeNow=etime(clock(),startTime);
    sampleNow=rand(1);
    plot(timeNow,sampleNow,'.')
    hold on
    timeArray=[timeArray; timeNow];      % Builds growing time array; size of this array = Rate*DurationInSeconds
    sampleArray=[sampleArray; sampleNow]; 
    pause(1)
end

timeArray
sampleArray