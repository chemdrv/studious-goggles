function [signal] = dataGen
% DATAGEN - a function to generate some data of a semi-random form.
% 
% This version does not require any user inputs, so it will run just once
% every time it is called.  To collect a data set, the user (or program)
% will have to call it a number of times.  This is the way a real data
% acquisition program works.
%
% The output argument is the value of the semi-random signal.
%
% Call syntax: signal = dataGen;   (output doesn't have to be suppressed,
%                                   but it's a good idea)

% Written by Steve Mang, last updated September 4, 2012

 signal = 1*rand+.5;

