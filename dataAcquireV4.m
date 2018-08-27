%Fourth version of the dataAcquire program to teach students basic MATLAB
%skills. These programs build on each other to the final version. This
%version has a loop which runs for the user specified number of seconds, and plots a random data point
%each loop. The values are plotted versus the clock time, and the times and
%data points are stored arrays. The user is asked to input how many points
%per second. The figure is also updated to be prettier. The time and sample
%data is saved to a text file for later analysis.
%
% Skills: making a MATLAB script, making a loop, initializing variables,
% plotting, workin with times, concatenating arrays, user inputs, figure
% annotations

clear all; % clears variables from the workspace
close all; % closes all current figures

i=0;

timeArray=[];
sampleArray=[];

pointsPerSecond=input('How many points do you want to acquire each second? ');
runTime=input('How many seconds do you want to acquire for?');
startTime=clock();

while(etime(clock(),startTime)<runTime)
    i=i+1
    timeNow=etime(clock(),startTime);
    sampleNow=rand(1);
    plot(timeNow,sampleNow,'.')
    hold on
    timeArray=[timeArray; timeNow];      % Builds growing time array; size of this array = Rate*DurationInSeconds
    sampleArray=[sampleArray; sampleNow]; 
    xlabel('time')
    ylabel('Random number')
    title(['Acquisition ',num2str(i)])
    pause(1/pointsPerSecond)
end

dataToSave = [timeArray',sampleArray'];
fileToSave = input('What filname would you like to save to?\n(Use the extension .txt): ', 's');
fid=fopen(fileToSave,'w');
fprintf(fid,'%9.5f %9.5f\n',dataToSave);
fclose(fid);