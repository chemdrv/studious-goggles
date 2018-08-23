%dataAcquire is a script to grab real time data, plot it, and save it as
%the user specifies.  This version uses the function dataGen to generate
%data, which is a random number generator to stand in for data generated on
%a DAQ board.
%Created 10/10/17 by Marie van Staveren


%begin by asking for user inputs
pointsPerSecond=input('How many points do you want to acquire each second? ');
runLength=input('How many seconds long should the program acquire? ');

%initialize vectors for data storage, as well as an iterator to count
%cycles run, and a reading of the inital time.
dataArray=[];
timeArray=[];
i=0;
timeInitial=clock();

%this is the main program loop.  Each iteration compares the elapsed time
%to the user specified time as the exit condition for the loop.
while (etime(clock(),timeInitial)<runLength)
    i=i+1;  %an iterator which counts each loop run to disply on the plot
    %[dataArray(end+1), timeArray(end+1)]=Fast_DAQ; % store the current call of dataGen at the end of dataArray
    dataArray(end+1)=dataGen;
    timeArray(end+1)=etime(clock(),timeInitial); %store the elapsed time at the end of timeArray
    plot(timeArray,dataArray,'o') %plot the data vs. time with points
    title(['Acquisition number ', num2str(i)]) % put a title on the plot that shows the acquisition number
    pause(1/pointsPerSecond) %pause for the length specified by the user before running the next loop
    
end
timeFinal=clock();
etime(timeFinal,timeInitial) %not really needed anymore, but prints out the total elapsed time into the command window

%this last section saves the data.
dataToSave = [timeArray; dataArray] %the two arrays of data are put together into one matrix
fileToSave = input('Acquisition finished. What filename would you like to save the data to? ', 's'); %the user is asked to name a file, which needs to include an extension, for saving
fid=fopen(fileToSave,'w'); %the specified file is opened
fprintf(fid, '%8.2f %8.5f\r', dataToSave); %the data is printed to the file with 2 digits of floating poin precision
fclose(fid); %the file is closed

