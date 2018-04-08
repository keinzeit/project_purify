%% calcPowerAvg
% Calculates the average power output coming from the plasma

scriptPath = pwd;
relPath = 'photodiode_readouts/07-apr-2018';
cd(relPath)

% Read Plasma Data
[diodeData_values diodeData_meta] = xlsread('20k_above_water1.CSV','A1:E16');
diodeData = csvread('20k_above_water1.CSV',16,0); % scope data starts on the 17th row in excel, indexed by 16

channel_1 = diodeData(:,2);

figure
plot(channel_1)
title('Oscilloscope Reading from Diodes')
%xlim([0, 1000])
 
% FFT
N = 2.^nextpow2(length(channel_1);
T = diodeData_values(6,1)
Fs = 1/T;
f = (-N/2:N/2-1)*Fs;
ch1FFT = abs(fftshift(fft(length(channel_1),N)));
  
figure
plot(f, ch1FFT)
title('FFT')

%% Integration



%% Return to original path
cd(scriptPath)