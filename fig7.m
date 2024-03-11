clear all;

d = [0 0.025 0.0375 0.05 0.1 0.15 0.2];
theta = 13.82;
mu_jump = 100;

eff_Ra = 1e7*[1.0811    1.3004    1.7875];
Ra_10 = eff_Ra(1);
Ra_15 = eff_Ra(2);
Ra_20 = eff_Ra(3);

obsrved_d_10 = [0 0.025 0.0375 0.05 0.1 0.15 0.17];
new_tau_10 = 0.2764* Ra_10 * d.^2.6643 * theta.^1.228 * mu_jump.^-0.57;
%new_tau_10 = 0.38 * Ra_10 * d.^2.44 * theta.^1.14 * mu_jump.^-0.84;

model_tau_10 =[114872.2772, 110354.767, 110862.7167, 105623.4311, ...
    117025.4119, 114999.401, 120380.2025];
err_10 = [25986.54958, 25015.04469, 27056.24618, 29486.88344, 32544.01165, ...
    29148.24053, 26369.32182];

obsrved_d_15 = [0 0.025 0.0375 0.05 0.1 0.13 0.14];
%new_tau_15 = 0.38 * Ra_15 * d.^2.44 * theta.^1.14 * mu_jump.^-0.84;
new_tau_15 = 0.2764* Ra_15 * d.^2.6643 * theta.^1.228 * mu_jump.^-0.57;
model_tau_15 = [109308.2871, 105729.3388, 104417.354, 108782.3506, ...
    105476.6912, 106084.6588, 112535.9447];
err_15 = [26177.26257, 31373.99604, 29832.8067, 26350.10145, 26113.82344, ...
    26934.59391, 27190.03602];

obsrved_d_20 = [0 0.025 0.0375 0.05 0.1 0.13 0.14];
new_tau_20 = 0.2764* Ra_20 * d.^2.6643 * theta.^1.228 * mu_jump.^-0.57;
model_tau_20 = [117012.9726, 104054.6314, 110789.6198, 99981.73852, ...
    98905.27085, 107500.101, 102877.0807];
err_20 = [18731.72468, 18900.99852, 17795.91831, 22411.51729, 22063.25639, ...
    24930.57933, 20847.38886];

subplot(1,3,1)
plot(d,new_tau_10+mean(model_tau_10),'b')
hold on
%plot(obsrved_d_10,delta_tau_10_m+model_tau_10(1))
%plot(d,model_delta_tau_10)
errorbar(obsrved_d_10,model_tau_10,err_10,'k')
xlabel('Continental thickness [Non-dim]')
ylabel('Lithospheric stress [Non-dim]')
set(gca,'fontsize', 16)

subplot(1,3,2)
plot(d,new_tau_15+mean(model_tau_15),'b')
hold on
%plot(obsrved_d_15,delta_tau_15_m+model_tau_15(1))
errorbar(obsrved_d_15,model_tau_15,err_15,'k')
xlabel('Continental thickness [Non-dim]')
ylabel('Lithospheric stress [Non-dim]')
set(gca,'fontsize', 16)

subplot(1,3,3)
plot(d,new_tau_20+mean(model_tau_20),'b')
hold on
%plot(obsrved_d_20,delta_tau_20_m+model_tau_20(1))
errorbar(obsrved_d_20,model_tau_20,err_20,'k')
xlabel('Continental thickness [Non-dim]')
ylabel('Lithospheric stress [Non-dim]')
set(gca,'fontsize', 16)