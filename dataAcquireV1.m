%First version of the dataAcquire program to teach students basic MATLAB
%skills. These programs build on each other to the final version. This
%version has a loop which runs ten times, and plots a random data point
%each loop.
%
% Skills: making a MATLAB script, making a loop, initializing variables,
% plotting

clear all; % clears variables from the workspace
close all; % closes all current figures

i=0;

while(i<10)
    i=i+1;
    sampleNow=rand(1);
    plot(i,sampleNow,'.')
    hold on
end