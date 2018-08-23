% Fast_DAQ.m
%
% This very simple script streams data directly from a National Instruments data
% acquistion card.  
%
%     inputs: none
%     outputs: [time,data] array
%
% The size of the sample array will be governed by sample rate, and there
% is no averaging.  In your MATLAB program, you should call this program as
% 
%     [data,time]=Fast_DAQ;
%
% The semicolon is very important!  Each time your program calls the
% function, you will get a complete array of data and time values, so with
% the default sampling rate (5000 Hz) and sample duration (0.1 seconds) you
% will get 50,000 data points per array.  This is overkill!  Make sure to
% change it to something more appropriate.  You can also set up your data
% acquisition program (and change this simple script into a simple function) so
% these two values are user-selectable.
%
% Written by Lisa Kelly, April 2015
%
% Last modified by Steve Mang, August 2015

close all;
clear all;

%openDAQ = daqfind;								
%for n = 1 : length(openDAQ)							
%    delete(openDAQ(n));								
%end	

newDAQ=daq.createSession('ni');
newDAQ.addAnalogInputChannel('dev1','ai0','Voltage');   % one channel only.  For data acquisition on two channels, use another version of this .m file with 'ai0' replaced by 'ai1'
newDAQ.Rate=5000; %points collected per second
newDAQ.DurationInSeconds=0.1;
tic;                                  % the tic and toc are just there to clock the actual speed of USB data transfer.  They don't determine actual timing.
[data,time]=newDAQ.startForeground;
toc
% plot(time,data);    % these last two lines can be used if Fast_DAQ.m is 
                      % being used on its own
% clear newDAQ;       