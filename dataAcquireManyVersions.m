%for each of these versions, a series of five comment characters replaces any
%code that I have censored.

%version 1: plots 10 points generated from dataGen, with a pause between
%iterations to allow the user to see the points as they plot
dataArray=[];
i=0;

while (i<10)
    i=i+1;
    dataArray(end+1)=dataGen;
    plot(dataArray,'.')
    %%%%%
end

%version 2: grabs the clock value initially and finally, and then prints
%the elapsed time after the while loop is finished

dataArray=[];
i=0;
timeInitial=clock();

while (i<10)
    i=i+1;
    dataArray(end+1)=dataGen;
    plot(dataArray,'.')
    %%%%%
end
timeFinal=clock();
etime(%%%%%)

%version 3: calculates the elapsed time at each point and adds to a vector
%which is the x-axis of the plot

dataArray=[];
timeArray=[];
i=0;
timeInitial=clock();

while (i<10)
    i=i+1;
    dataArray(end+1)=dataGen;
    timeArray(%%%%%)=%%%%%;
    plot(timeArray,dataArray,'.')
    %%%%%
end
timeFinal=clock();
etime(%%%%%)


%version 4: Ask the user to input acquisition rate and total acquisition
%time. Calculates important time constants, and now pauses for the
%specified interval between points.

pointsPerSecond=input('How many points do you want to acquire each second? ');
runLength=input('How many seconds long should the program acquire? ');

dataArray=[];
timeArray=[];
i=0;
timeInitial=clock();

while (%%%%%)<runLength)
    i=i+1;
    dataArray(end+1)=dataGen;
    timeArray(%%%%%)=%%%%%;
    plot(timeArray,dataArray,'.')
    %%%%%(1/pointsPerSecond)
end
timeFinal=clock();
etime(%%%%%)

%version 5: adds in a title with the acquisition number at the top

pointsPerSecond=input('How many points do you want to acquire each second? ');
runLength=input('How many seconds long should the program acquire? ');

dataArray=[];
timeArray=[];
i=0;
timeInitial=clock();

while (%%%%%)
    i=i+1;
    dataArray(end+1)=dataGen;
    timeArray(%%%%%)=%%%%%;
    plot(timeArray,dataArray,'.')
    title(%%%%%) %I highly recommend typing "help title" into the command window and reading all the output to see how to get a variable into the title
    %%%%%(1/pointsPerSecond)
    
end
timeFinal=clock();
etime(%%%%%)

%version 6: saves the data to a text file of the users specifications

pointsPerSecond=input('How many points do you want to acquire each second? ');
runLength=input('How many seconds long should the program acquire? ');

dataArray=[];
timeArray=[];
i=0;
timeInitial=clock();

while (%%%%%)
    i=i+1;
    dataArray(end+1)=dataGen;
    timeArray(%%%%%)=%%%%%;
    plot(timeArray,dataArray,'.')
    title(%%%%%)
    %%%%%(1/pointsPerSecond)
    
end
timeFinal=clock();
etime(timeFinal,timeInitial)

dataToSave = %%%%%
fileToSave = %%%%%
fid=%%%%%
fprintf%%%%% %make sure you read the documentation on fprintf to figure out how to format your data
fclose%%%%%