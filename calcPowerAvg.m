%% calcPowerAvg
% Calculates the average power output coming from the plasma

scriptPath = pwd;
relPath = 'photodiode_readouts/07-apr-2018';
cd(relPath)

% Read Plasma Data
[diodeData_values diodeData_meta] = xlsread('20k_above_water1.CSV','A1:E16');
diodeData = csvread('20k_above_water1.CSV',16,0); % scope data starts on the 17th row in excel, indexed by 16
cd(scriptPath) % return to original path

% not sure what the scale does. for now, unused
ch1_vscale = diodeData_values(13,1);
ch1_hscale = diodeData_values(5,1);

ch1_h = diodeData(:,1); % horizontal (time)
ch1_v = diodeData(:,2); % vertical (voltage)

% not 100% sure about the units
figure(1)
plot(ch1_h,ch1_v)
title('Oscilloscope Reading from Diodes')
xlabel('Time (s)')
ylabel('Voltage (V)')
%xlim([0, 1000])
 
% FFT
N = 2.^nextpow2(length(ch1_v));
T = diodeData_values(6,1);
Fs = 1/T;
f = (-N/2:N/2-1)*Fs;
ch1FFT = abs(fftshift(fft(ch1_v,N)));
  
figure(2)
plot(f, ch1FFT)
title('Channel 1 FFT')
xlabel('Frequency (Hz)')
ylabel('Amplitude')
xlim([0 f(end)])

%% Integration

