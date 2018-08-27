% dataAcquire.m
% This script acquires data from a daq board, plots it in real time, then
% allows the user to save the data to a text file they specify.
%
% Written by Marie van Staveren, 8/18
clear all;
close all;
daqreset;                    % Resets all daq sessions

% Create global variables for voltage and time
global timeArray;
global sampleTempArray;

%These lines set up a daq session, opening one channel.  The duration is
%set to a very long time, knowing that it will be stopped by the user.
%
pointsPerSecond=input('How many points do you want to acquire each second? ');

daqboard=daq.createSession('ni');
daqboard.addAnalogInputChannel('dev2','ai0','Voltage');
daqboard.Rate = pointsPerSecond;
daqboard.DurationInSeconds = 100000;
global startTime;
startTime=clock();

% These lines set up a listener, which acquires data from the daqboard in
% the background, and runs the function GetAndPlotData when data exists to
% be plotted.
lh = addlistener(daqboard,'DataAvailable', @GetAndPlotData); % Creates a handle for the listener
daqboard.NotifyWhenDataAvailableExceeds = 2; % Plot will update Rate*DurationInSeconds/NotifyWhenDataAvailableExceeds times per second
daqboard.startBackground();                   % Initiate background data collection

% The program stops at the line below until the user inputs something and presses
% enter, at which point the daqboard is stopped.  Then the handle is
% deleted and the daqboard is released for use by other programs.
a=input('Press ENTER to stop');% Wait until acquisition is complete
daqboard.stop();
delete(lh);  % Deletes the listener handle
daqboard.release()

% The data to be saved gets put into one matrix, and then written to a
% texxt file of the users choice.
dataToSave = [timeArray',sampleTempArray'];
fileToSave = input('What filname would you like to save to?\n(Use the extension .txt): ', 's');
fid=fopen(fileToSave,'w');
fprintf(fid,'%9.5f %9.5f\n',dataToSave);
fclose(fid);

% This function converts the raw voltages to temperatures according to the
% calibrations below, then plots data.  It also stores the data in two
% global variables so they can be accessed later for saving.
function GetAndPlotData(src,event)
    global startTime;
    global timeArray; %array
    global sampleTempArray; %array
    timeNow=etime(clock(),startTime); %single time point
    sampleTempNow=event.Data(:,1)*1+0; %single data point
    plot(timeNow, sampleTempNow,'.');
    xlabel('time')
    ylabel('T_{sample}')
    hold on
    timeArray=[timeArray; timeNow];      % Builds growing time array; size of this array = Rate*DurationInSeconds
    sampleTempArray=[sampleTempArray; sampleTempNow];      % Builds growing voltage array; size of this array = Rate*DurationInSeconds
end



