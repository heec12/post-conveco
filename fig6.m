clear all;

etae = [6.908 9.21, 11.513, 13.82, 16.12];
no_crust_else = [1454.14875, 1905.448906, 2301.450313, 2645.008594, 2939.941094];
crust080_else = [29340.7343, 42268.09621, 56009.15412, 71048.51759, 87662.64521];
crust085_else = [15614.80445, 22083.40535, 28930.83363, 36373.77595, 44542.01069];
crust090_else = [6248.155365, 8556.584766, 10966.25036, 13528.31915, 16277.61158];
crust095_else = [2357.25412, 3036.333163, 3670.82971, 4260.978263, 4807.996414];
crust0975_else = [1670.73637, 2146.690156, 2568.043942, 2937.856993, 3258.000869];

crust080_diff_else = no_crust_else - crust080_else;
crust085_diff_else = no_crust_else - crust085_else;
crust090_diff_else = no_crust_else - crust090_else;
crust095_diff_else = no_crust_else - crust095_else;
crust0975_diff_else = no_crust_else - crust0975_else;

d = 0.05;
Ra = 1e7;
mu_jump = 100;
first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

%plot(etae,crust090_else,'x-')
%hold on
%plot(etae,crust080_else,'x-')
%plot(etae,crust085_else,'x-')
%plot(etae,crust095_else,'x-')
%plot(etae,crust0975_else,'x-')
%plot(etae,stress_fit,'o-')

%% 
d=0.2;
first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

plot(crust080_else, stress_fit,'o','MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[242/255 97/255 1/255])
hold on

d=0.15;
first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

plot(crust085_else, stress_fit,'o','MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[255/255 196/255 156/255])

d=0.1;
first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

plot(crust090_else, stress_fit, 'o','MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[217/255 232/255 245/255])

d=0.05;
first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

plot(crust095_else, stress_fit, 'o','MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[145/255 190/255 212/255])

d=0.025;
%first_term = 0.2764* d^-0.8357 * Ra * d^3.5 * etae.^1.228 * mu_jump.^-0.57 ;
first_term = 0.2764 * d^2.6643 * Ra * etae.^1.228 * mu_jump.^-0.57;
%first_term = d.^exp_term;
sigma_zero_term = (2368*etae.^0.3365 - 3100)*Ra*1e-7;
stress_fit = first_term + sigma_zero_term;

plot(crust0975_else, stress_fit, 'o','MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[48/255 66/255 105/255])

x = linspace(0,9e4);
plot(x,x,'k','LineWidth',0.5)