clear variables;
close all;

% Set model name
model='dam1_diss_1.4_new_icmobR_crust0975_vis100';

% Set path to model output (modify for your file setup)
filename1 = sprintf('/Users/heechoi/Documents/mcc2bU/%s/data.t',model);

% Load data file
data = load(filename1); 
time=data(:,1); % time
Nu=data(:,2);  % Nusselt number
temp=data(:,3); % Volume average temperature of whole mantle
rms=data(:,4);  % Whole mantle rms velocity 
max_surf=data(:,5); % Average peak surface velocity
asurf=data(:,6);  % Maximum velocity in the whole domain
alpha_max=data(:,7); % Maximum fineness in the whole mantle domain
alpha_avg=data(:,8); % Volume average fineness in whole mantle 
tau=data(:,9); % Volume average stress magnitude in whole mantle 
tau_surf=data(:,10); % Horizontal average stress magnitude at the surface
diss_surf=data(:,11); % Horizontal average stress magnitude at the surface
tempi=data(:,14); % Average temperature just below the lithosphere

time_end1=0.012104; % This is the time when the last fXXX,uXXX,wXXX,haXXX etc files are printed out
% Open the last haXXX file; column 1 of this file prints the model time when the
% haXXX file was printed. Fill in that time here


filename1 = sprintf('/Users/heechoi/Documents/mcc2bU/%s_2/data.t',model);
clear data
% Load data file
data = load(filename1); 
time2=data(:,1); 
Nu2=data(:,2); 
temp2=data(:,3);
rms2=data(:,4); 
max_surf2=data(:,5);
asurf2=data(:,6); 
alpha_max2=data(:,7);
alpha_avg2=data(:,8);
tau2=data(:,9);
tau_surf2=data(:,10);
diss_surf2=data(:,11);
tempi2=data(:,14);
time_end2=0.0085025;

filename1 = sprintf('/Users/heechoi/Documents/mcc2bU/%s_3/data.t',model);
clear data
% Load data file
data = load(filename1); 
time3=data(:,1); 
Nu3=data(:,2); 
temp3=data(:,3);
rms3=data(:,4); 
max_surf3=data(:,5);
asurf3=data(:,6); 
alpha_max3=data(:,7);
alpha_avg3=data(:,8);
tau3=data(:,9);
tau_surf3=data(:,10);
diss_surf3=data(:,11);
tempi3=data(:,14);
time_end3=0.028108;

filename1 = sprintf('/Users/heechoi/Documents/mcc2bU/%s_4/data.t',model);
clear data
% Load data file
data = load(filename1); 
time4=data(:,1); 
Nu4=data(:,2); 
temp4=data(:,3);
rms4=data(:,4); 
max_surf4=data(:,5);
asurf4=data(:,6); 
alpha_max4=data(:,7);
alpha_avg4=data(:,8);
tau4=data(:,9);
tau_surf4=data(:,10);
diss_surf4=data(:,11);
tempi4=data(:,14);
time_end4=0.0061012;

filename1 = sprintf('/Users/heechoi/Documents/mcc2bU/%s_5/data.t',model);
clear data
% Load data file
data = load(filename1); 
time5=data(:,1); 
Nu5=data(:,2); 
temp5=data(:,3);
rms5=data(:,4); 
max_surf5=data(:,5);
asurf5=data(:,6); 
alpha_max5=data(:,7);
alpha_avg5=data(:,8);
tau5=data(:,9);
tau_surf5=data(:,10);
diss_surf5=data(:,11);
tempi5=data(:,14);
time_end5=0.015304;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR5/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time6=data(:,1); 
% Nu6=data(:,2); 
% temp6=data(:,3);
% rms6=data(:,4); 
% max_surf6=data(:,5);
% asurf6=data(:,6); 
% alpha_max6=data(:,7);
% alpha_avg6=data(:,8);
% tau6=data(:,9);
% tau_surf6=data(:,10);
% diss_surf6=data(:,11);
% tempi6=data(:,14);
% time_end6=1.5503E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR6/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time7=data(:,1); 
% Nu7=data(:,2); 
% temp7=data(:,3);
% rms7=data(:,4); 
% max_surf7=data(:,5);
% asurf7=data(:,6); 
% alpha_max7=data(:,7);
% alpha_avg7=data(:,8);
% tau7=data(:,9);
% tau_surf7=data(:,10);
% diss_surf7=data(:,11);
% tempi7=data(:,14);
% time_end7=4.0429E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR7/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time8=data(:,1); 
% Nu8=data(:,2); 
% temp8=data(:,3);
% rms8=data(:,4); 
% max_surf8=data(:,5);
% asurf8=data(:,6); 
% alpha_max8=data(:,7);
% alpha_avg8=data(:,8);
% tau8=data(:,9);
% tau_surf8=data(:,10);
% diss_surf8=data(:,11);
% tempi8=data(:,14);
% time_end8=1.2807E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR8/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time9=data(:,1); 
% Nu9=data(:,2); 
% temp9=data(:,3);
% rms9=data(:,4); 
% max_surf9=data(:,5);
% asurf9=data(:,6); 
% alpha_max9=data(:,7);
% alpha_avg9=data(:,8);
% tau9=data(:,9);
% tau_surf9=data(:,10);
% diss_surf9=data(:,11);
% tempi9=data(:,14);
% time_end9=4.4232E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR9/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time10=data(:,1); 
% Nu10=data(:,2); 
% temp10=data(:,3);
% rms10=data(:,4); 
% max_surf10=data(:,5);
% asurf10=data(:,6); 
% alpha_max10=data(:,7);
% alpha_avg10=data(:,8);
% tau10=data(:,9);
% tau_surf10=data(:,10);
% diss_surf10=data(:,11);
% tempi10=data(:,14);
% time_end10=1.9011E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR10/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time11=data(:,1); 
% Nu11=data(:,2); 
% temp11=data(:,3);
% rms11=data(:,4); 
% max_surf11=data(:,5);
% asurf11=data(:,6); 
% alpha_max11=data(:,7);
% alpha_avg11=data(:,8);
% tau11=data(:,9);
% tau_surf11=data(:,10);
% diss_surf11=data(:,11);
% tempi11=data(:,14);
% time_end11=4.2229E-03;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR11/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time12=data(:,1); 
% Nu12=data(:,2); 
% temp12=data(:,3);
% rms12=data(:,4); 
% max_surf12=data(:,5);
% asurf12=data(:,6); 
% alpha_max12=data(:,7);
% alpha_avg12=data(:,8);
% tau12=data(:,9);
% tau_surf12=data(:,10);
% diss_surf12=data(:,11);
% tempi12=data(:,14);
% time_end12=4.2824E-03;

% filename1 = sprintf('~/Documents/convec_stuff/data/%sR12/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time13=data(:,1); 
% Nu13=data(:,2); 
% temp13=data(:,3);
% rms13=data(:,4); 
% max_surf13=data(:,5);
% asurf13=data(:,6); 
% alpha_max13=data(:,7);
% alpha_avg13=data(:,8);
% tau13=data(:,9);
% tau_surf13=data(:,10);
% diss_surf13=data(:,11);
% tempi13=data(:,14);
% time_end13=3.7042e-3;

% filename1 = sprintf('~/Documents/convec_stuff/data/%sR13/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time14=data(:,1); 
% Nu14=data(:,2); 
% temp14=data(:,3);
% rms14=data(:,4); 
% max_surf14=data(:,5);
% asurf14=data(:,6); 
% alpha_max14=data(:,7);
% alpha_avg14=data(:,8);
% tau14=data(:,9);
% tau_surf14=data(:,10);
% diss_surf14=data(:,11);
% tempi14=data(:,14);
% time_end14=4.6221e-3;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR14/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time15=data(:,1); 
% Nu15=data(:,2); 
% temp15=data(:,3);
% rms15=data(:,4); 
% max_surf15=data(:,5);
% asurf15=data(:,6); 
% alpha_max15=data(:,7);
% alpha_avg15=data(:,8);
% tau15=data(:,9);
% tau_surf15=data(:,10);
% diss_surf15=data(:,11);
% tempi15=data(:,14);
% time_end15=4.9423e-3;
% 
% filename1 = sprintf('~/Documents/convec_stuff/data/%sR15/data.t',model);
% clear data
% % Load data file
% data = load(filename1); 
% time16=data(:,1); 
% Nu16=data(:,2); 
% temp16=data(:,3);
% rms16=data(:,4); 
% max_surf16=data(:,5);
% asurf16=data(:,6); 
% alpha_max16=data(:,7);
% alpha_avg16=data(:,8);
% tau16=data(:,9);
% tau_surf16=data(:,10);
% diss_surf16=data(:,11);
% tempi16=data(:,14);
% time_end16=1.1933e-3;

% time2=time2+time_end1; %This just ends the ending time of the first model run to time for the restart run
% time3=time3+time_end1+time_end2; % And keeps adding these times together for each model restart
% time4=time4+time_end1+time_end2+time_end3;
time5=time5+time_end1+time_end2+time_end3+time_end4;
% time6=time6+time_end1+time_end2+time_end3+time_end4+time_end5;
% time7=time7+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6;
% time8=time8+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7;
% time9=time9+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8;
% time10=time10+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9;
% time11=time11+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10;
% time12=time12+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10+time_end11;
% time13=time13+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10+time_end11+time_end12;
% time14=time14+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10+time_end11+time_end12+time_end13;
% time15=time15+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10+time_end11+time_end12+time_end13+time_end14;
% time16=time16+time_end1+time_end2+time_end3+time_end4+time_end5+time_end6+time_end7+time_end8+time_end9+time_end10+time_end11+time_end12+time_end13+time_end14+time_end15;

% This goes through the time vector for the first model run, and finds
% where it begins to overlap with the restarted model run
for i=length(time):-1:1
    if time(i) < time_end1
        stop1=i;
        break
    end
end

for i=length(time2):-1:1
    if time2(i) < time_end2+time_end1
        stop2=i;
        break
    end
end

for i=length(time3):-1:1
   if time3(i) < time_end3+time_end2+time_end1
       stop3=i;
       break
   end
end

for i=length(time4):-1:1
   if time4(i) < time_end4+time_end3+time_end2+time_end1
       stop4=i;
       break
   end
end

for i=length(time5):-1:1
    if time5(i) < time_end5+time_end4+time_end3+time_end2+time_end1
        stop5=i;
        break
    end
end
% 
% for i=length(time6):-1:1
%     if time6(i) < time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop6=i;
%         break
%     end
% end
% 
% for i=length(time7):-1:1
%     if time7(i) < time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop7=i;
%         break
%     end
% end
% 
% for i=length(time8):-1:1
%     if time8(i) < time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop8=i;
%         break
%     end
% end
% 
% for i=length(time9):-1:1
%     if time9(i) < time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop9=i;
%         break
%     end
% end
% 
% for i=length(time10):-1:1
%     if time10(i) < time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop10=i;
%         break
%     end
% end
% 
% for i=length(time11):-1:1
%     if time11(i) < time_end11+time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop11=i;
%         break
%     end
% end

% for i=length(time12):-1:1
%     if time12(i) < time_end12+time_end11+time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop12=i;
%         break
%     end
% end
% 
% for i=length(time13):-1:1
%     if time13(i) < time_end13+time_end12+time_end11+time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop13=i;
%         break
%     end
% end
% 
% for i=length(time14):-1:1
%     if time14(i) < time_end14+time_end13+time_end12+time_end11+time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop14=i;
%         break
%     end
% end
% 
% for i=length(time15):-1:1
%     if time15(i) < time_end15+time_end14+time_end13+time_end12+time_end11+time_end10+time_end9+time_end8+time_end7+time_end6+time_end5+time_end4+time_end3+time_end2+time_end1
%         stop15=i;
%         break
%     end
% end

% These combine the data from different model runs into large single
% vectors
% time_tot=[time'];
% temp_tot=[temp'];
% Nu_tot=[Nu'];
% rms_tot=[rms'];
% vmax_tot=[asurf'];
% max_surf_tot=[max_surf'];
% alpha_max_tot=[alpha_max'];
% alpha_avg_tot=[alpha_avg'];
% tau_s_tot=[tau_surf'];
% diss_s_tot=[diss_surf'];
% tempi_tot=[tempi'];
% 
% time_tot=[time(1:stop1)',time2'];
% temp_tot=[temp(1:stop1)',temp2'];
% Nu_tot=[Nu(1:stop1)',Nu2'];
% rms_tot=[rms(1:stop1)',rms2'];
% vmax_tot=[asurf(1:stop1)',asurf2'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2'];
% tempi_tot=[tempi(1:stop1)',tempi2'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4'];

time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5'];
temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5'];
Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5'];
rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5'];
vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5'];
max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5'];
alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5'];
alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5'];
tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5'];
diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5'];
tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',time6'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',temp6'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',Nu6'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',rms6'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',asurf6'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',max_surf6'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',alpha_max6'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',alpha_avg6'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',tau_surf6'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',diss_surf6'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',tempi6'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',time6(1:stop6)',time7'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',temp6(1:stop6)',temp7'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',Nu6(1:stop6)',Nu7'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',rms6(1:stop6)',rms7'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9(1:stop9)',time10'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9(1:stop9)',temp10'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9(1:stop9)',Nu10'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9(1:stop9)',rms10'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9(1:stop9)',asurf10'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9(1:stop9)',max_surf10'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9(1:stop9)',alpha_max10'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9(1:stop9)',alpha_avg10'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9(1:stop9)',tau_surf10'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9(1:stop9)',diss_surf10'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9(1:stop9)',tempi10'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9(1:stop9)',time10(1:stop10)',time11'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9(1:stop9)',temp10(1:stop10)',temp11'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9(1:stop9)',Nu10(1:stop10)',Nu11'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9(1:stop9)',rms10(1:stop10)',rms11'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9(1:stop9)',asurf10(1:stop10)',...
%     asurf11'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9(1:stop9)',max_surf10(1:stop10)',max_surf11'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9(1:stop9)',alpha_max10(1:stop10)',alpha_max11'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9(1:stop9)',alpha_avg10(1:stop10)',alpha_avg11'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9(1:stop9)',tau_surf10(1:stop10)',tau_surf11'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9(1:stop9)',diss_surf10(1:stop10)',diss_surf11'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9(1:stop9)',tempi10(1:stop10)',tempi11'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9(1:stop9)',time10(1:stop10)',time11(1:stop11)',time12'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9(1:stop9)',temp10(1:stop10)',temp11(1:stop11)',temp12'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9(1:stop9)',Nu10(1:stop10)',Nu11(1:stop11)',Nu12'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9(1:stop9)',rms10(1:stop10)',rms11(1:stop11)',rms12'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9(1:stop9)',asurf10(1:stop10)',...
%     asurf11(1:stop11)',asurf12'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9(1:stop9)',max_surf10(1:stop10)',max_surf11(1:stop11)',max_surf12'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9(1:stop9)',alpha_max10(1:stop10)',alpha_max11(1:stop11)',alpha_max12'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9(1:stop9)',alpha_avg10(1:stop10)',alpha_avg11(1:stop11)',alpha_avg12'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9(1:stop9)',tau_surf10(1:stop10)',tau_surf11(1:stop11)',tau_surf12'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9(1:stop9)',diss_surf10(1:stop10)',diss_surf11(1:stop11)',diss_surf12'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9(1:stop9)',tempi10(1:stop10)',tempi11(1:stop11)',tempi12'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9(1:stop9)',time10(1:stop10)',time11(1:stop11)',time12(1:stop12)',time13'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9(1:stop9)',temp10(1:stop10)',temp11(1:stop11)',temp12(1:stop12)',temp13'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9(1:stop9)',Nu10(1:stop10)',Nu11(1:stop11)',Nu12(1:stop12)',Nu13'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9(1:stop9)',rms10(1:stop10)',rms11(1:stop11)',rms12(1:stop12)',rms13'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9(1:stop9)',asurf10(1:stop10)',...
%     asurf11(1:stop11)',asurf12(1:stop12)',asurf13'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9(1:stop9)',max_surf10(1:stop10)',...
%     max_surf11(1:stop11)',max_surf12(1:stop12)',max_surf13'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9(1:stop9)',alpha_max10(1:stop10)',...
%     alpha_max11(1:stop11)',alpha_max12(1:stop12)',alpha_max13'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9(1:stop9)',alpha_avg10(1:stop10)',...
%     alpha_avg11(1:stop11)',alpha_avg12(1:stop12)',alpha_avg13'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9(1:stop9)',tau_surf10(1:stop10)',...
%     tau_surf11(1:stop11)',tau_surf12(1:stop12)',tau_surf13'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9(1:stop9)',diss_surf10(1:stop10)',...
%     diss_surf11(1:stop11)',diss_surf12(1:stop12)',diss_surf13'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9(1:stop9)',tempi10(1:stop10)',...
%     tempi11(1:stop11)',tempi12(1:stop12)',tempi13'];

% time_tot=[time(1:stop1)',time2(1:stop2)',time3(1:stop3)',time4(1:stop4)',time5(1:stop5)',...
%     time6(1:stop6)',time7(1:stop7)',time8(1:stop8)',time9(1:stop9)',time10(1:stop10)',time11(1:stop11)',time12(1:stop12)',...
%     time13(1:stop13)',time14(1:stop14)',time15(1:stop15)',time16'];
% temp_tot=[temp(1:stop1)',temp2(1:stop2)',temp3(1:stop3)',temp4(1:stop4)',temp5(1:stop5)',...
%     temp6(1:stop6)',temp7(1:stop7)',temp8(1:stop8)',temp9(1:stop9)',temp10(1:stop10)',temp11(1:stop11)',temp12(1:stop12)',...
%     temp13(1:stop13)',temp14(1:stop14)',temp15(1:stop15)',temp16'];
% Nu_tot=[Nu(1:stop1)',Nu2(1:stop2)',Nu3(1:stop3)',Nu4(1:stop4)',Nu5(1:stop5)',...
%     Nu6(1:stop6)',Nu7(1:stop7)',Nu8(1:stop8)',Nu9(1:stop9)',Nu10(1:stop10)',Nu11(1:stop11)',Nu12(1:stop12)',...
%     Nu13(1:stop13)',Nu14(1:stop14)',Nu15(1:stop15)',Nu16'];
% rms_tot=[rms(1:stop1)',rms2(1:stop2)',rms3(1:stop3)',rms4(1:stop4)',rms5(1:stop5)',...
%     rms6(1:stop6)',rms7(1:stop7)',rms8(1:stop8)',rms9(1:stop9)',rms10(1:stop10)',rms11(1:stop11)',rms12(1:stop12)',...
%     rms13(1:stop13)',rms14(1:stop14)',rms15(1:stop15)',rms16'];
% vmax_tot=[asurf(1:stop1)',asurf2(1:stop2)',asurf3(1:stop3)',asurf4(1:stop4)',asurf5(1:stop5)',...
%     asurf6(1:stop6)',asurf7(1:stop7)',asurf8(1:stop8)',asurf9(1:stop9)',asurf10(1:stop10)',...
%     asurf11(1:stop11)',asurf12(1:stop12)',asurf13(1:stop13)',asurf14(1:stop14)',asurf15(1:stop15)',asurf16'];
% max_surf_tot=[max_surf(1:stop1)',max_surf2(1:stop2)',max_surf3(1:stop3)',max_surf4(1:stop4)',max_surf5(1:stop5)',...
%     max_surf6(1:stop6)',max_surf7(1:stop7)',max_surf8(1:stop8)',max_surf9(1:stop9)',max_surf10(1:stop10)',...
%     max_surf11(1:stop11)',max_surf12(1:stop12)',max_surf13(1:stop13)',max_surf14(1:stop14)',max_surf15(1:stop15)',max_surf16'];
% alpha_max_tot=[alpha_max(1:stop1)',alpha_max2(1:stop2)',alpha_max3(1:stop3)',alpha_max4(1:stop4)',alpha_max5(1:stop5)',...
%     alpha_max6(1:stop6)',alpha_max7(1:stop7)',alpha_max8(1:stop8)',alpha_max9(1:stop9)',alpha_max10(1:stop10)',...
%     alpha_max11(1:stop11)',alpha_max12(1:stop12)',alpha_max13(1:stop13)',alpha_max14(1:stop14)',alpha_max15(1:stop15)',alpha_max16'];
% alpha_avg_tot=[alpha_avg(1:stop1)',alpha_avg2(1:stop2)',alpha_avg3(1:stop3)',alpha_avg4(1:stop4)',alpha_avg5(1:stop5)',...
%     alpha_avg6(1:stop6)',alpha_avg7(1:stop7)',alpha_avg8(1:stop8)',alpha_avg9(1:stop9)',alpha_avg10(1:stop10)',...
%     alpha_avg11(1:stop11)',alpha_avg12(1:stop12)',alpha_avg13(1:stop13)',alpha_avg(1:stop14)',alpha_avg(1:stop15)',alpha_avg16'];
% tau_s_tot=[tau_surf(1:stop1)',tau_surf2(1:stop2)',tau_surf3(1:stop3)',tau_surf4(1:stop4)',tau_surf5(1:stop5)',...
%     tau_surf6(1:stop6)',tau_surf7(1:stop7)',tau_surf8(1:stop8)',tau_surf9(1:stop9)',tau_surf10(1:stop10)',...
%     tau_surf11(1:stop11)',tau_surf12(1:stop12)',tau_surf13(1:stop13)',tau_surf14(1:stop14)',tau_surf15(1:stop15)',tau_surf16'];
% diss_s_tot=[diss_surf(1:stop1)',diss_surf2(1:stop2)',diss_surf3(1:stop3)',diss_surf4(1:stop4)',diss_surf5(1:stop5)',...
%     diss_surf6(1:stop6)',diss_surf7(1:stop7)',diss_surf8(1:stop8)',diss_surf9(1:stop9)',diss_surf10(1:stop10)',...
%     diss_surf11(1:stop11)',diss_surf12(1:stop12)',diss_surf13(1:stop13)',diss_surf14(1:stop14)',diss_surf15(1:stop15)',diss_surf16'];
% tempi_tot=[tempi(1:stop1)',tempi2(1:stop2)',tempi3(1:stop3)',tempi4(1:stop4)',tempi5(1:stop5)',...
%     tempi6(1:stop6)',tempi7(1:stop7)',tempi8(1:stop8)',tempi9(1:stop9)',tempi10(1:stop10)',...
%     tempi11(1:stop11)',tempi12(1:stop12)',tempi13(1:stop13)',tempi14(1:stop14)',tempi15(1:stop15)',tempi16'];

% This is the vector element to start taking a time average over. Check the
% timeseries plots and see when the model has come to statistical
% steady-state, and use that as the starting point
start=1;

stop=length(time_tot);

rms_avg=0;
surf_avg=0;
alpha_max_avg=0;
alpha_time_avg=0;
Nu_avg=0;
tau_s_avg=0;
tempi_avg=0;
diss_s_avg=0;
vmax_avg=0;
% Calculate time average rms velocity 
for i=start:1:stop-1
    % Numerical intergration using the trapezoid rule
    Nu_avg=Nu_avg + (1/2)*(Nu_tot(i+1)+Nu_tot(i))*(time_tot(i+1)-time_tot(i));
    rms_avg=rms_avg + (1/2)*(rms_tot(i+1)+rms_tot(i))*(time_tot(i+1)-time_tot(i));
    surf_avg=surf_avg + (1/2)*(max_surf_tot(i+1)+max_surf_tot(i))*(time_tot(i+1)-time_tot(i));
    alpha_max_avg=alpha_max_avg + (1/2)*(alpha_max_tot(i+1)+alpha_max_tot(i))*(time_tot(i+1)-time_tot(i));
    alpha_time_avg=alpha_time_avg + (1/2)*(alpha_avg_tot(i+1)+alpha_avg_tot(i))*(time_tot(i+1)-time_tot(i));
    tau_s_avg=tau_s_avg + (1/2)*(tau_s_tot(i+1)+tau_s_tot(i))*(time_tot(i+1)-time_tot(i));
    diss_s_avg=diss_s_avg + (1/2)*(diss_s_tot(i+1)+diss_s_tot(i))*(time_tot(i+1)-time_tot(i));
    tempi_avg=tempi_avg + (1/2)*(tempi_tot(i+1)+tempi_tot(i))*(time_tot(i+1)-time_tot(i));
    vmax_avg=vmax_avg + (1/2)*(vmax_tot(i+1)+vmax_tot(i))*(time_tot(i+1)-time_tot(i));
end
% Computing the averages from the numerical integraion
Nu_avg=Nu_avg/(time_tot(stop)-time_tot(start));
rms_avg=rms_avg/(time_tot(stop)-time_tot(start));
surf_avg=surf_avg/(time_tot(stop)-time_tot(start));
alpha_max_avg=alpha_max_avg/(time_tot(stop)-time_tot(start));
alpha_time_avg=alpha_time_avg/(time_tot(stop)-time_tot(start));
tau_s_avg=tau_s_avg/(time_tot(stop)-time_tot(start));
diss_s_avg=diss_s_avg/(time_tot(stop)-time_tot(start));
tempi_avg=tempi_avg/(time_tot(stop)-time_tot(start));
vmax_avg=vmax_avg/(time_tot(stop)-time_tot(start));

% This organizes the final results into a form I can paste into a
% spreadsheet
final_data=[time_tot' Nu_tot' temp_tot' rms_tot' max_surf_tot' vmax_tot' alpha_max_tot' alpha_avg_tot' tau_s_tot' diss_s_tot' tempi_tot'];
final_data1=[alpha_max_avg,Nu_avg,surf_avg,rms_avg,tempi_avg,tau_s_avg,diss_s_avg,vmax_avg];

%p = plot(time_tot,alpha_avg_tot,time_tot,alpha_max_tot);
%legend('averaged alpha','maximum alpha')
%saveas(gcf,'dam1_diss_1.4_new_icmobR_crust09625_vis100_ts_fineness.png')

%alpha_max_avg
%surf_avg

alpha_time_avg
tempi_avg