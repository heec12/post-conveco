clear all;

etae = [6.908 9.21, 11.513, 13.82, 16.12];
crust090_else = [8319.284556, 10929.95693, 13537.80778, 16232.23933, 19077.73778];

viscosity = [1, 5, 10, 50, 100];
crust090_etae13_else = [280034.9844, 85118.32222, 54470.44, 22310.43822, 16232.23933];

thickness = [0.2, 0.15, 0.1, 0.05, 0.0375, 0.025];
vis100_else = [80242.08822, 41944.80067, 16232.23933, 3338.642978, 1813.034978, 793.9118];

etae_element = 13.82;
viscosity_element = 100;
thickness_element = [0.2, 0.15, 0.1, 0.05, 0.0375, 0.025];
%fit = 6.153e6* etae_element^0.986 * viscosity_element^-0.7098 * thickness_element.^2.281;
fit = 0.2764e7*thickness_element.^2.6643*etae_element^1.228*viscosity_element^-0.57;
%fit = 0.8153* 0.1^2.281 * 1e7 .* etae.^0.776 * 100^-0.7098 ;

%plot(thickness_element, fit, '-')
%hold on
%plot(thickness_element, vis100_else, 'o')
%%
d = linspace(0,0.2);
Ra = 1e7;
mu_jump = 100;
etae = 13.82;%[6.908 9.21, 11.513, 13.82, 16.12];
%stress_fit = 0.6153* d.^2.281 .* Ra .* etae^0.986 * mu_jump^-0.7098 ;
stress_fit = 0.2764* d.^2.6643 .* Ra .* etae^1.228 * mu_jump^-0.57;

subplot(2,2,1)
plot(d,stress_fit,'k');
hold on
plot(thickness,vis100_else,'ko','MarkerFaceColor',[0.3 0.3 0.3]);
legend({'Scaling law','Numerical model'}...
    ,'AutoUpdate','off','Location','Northwest')
xlabel('Continental thickness [non-dim]')
ylabel('Stress [non-dim]')

%%
Ranum = [1e5 1e6 1e7 1e8];
thick095 = [42.60978263 426.0978263 4260.978263 42609.78263];

d = 0.05;
Ra = linspace(1e5,1e8);
mu_jump = 100;
etae = 11.513;%[6.908 9.21, 11.513, 13.82, 16.12];
%stress_fit = 0.8153* d.^2.281 .* Ra .* etae^0.986 * mu_jump^-0.7098 ;
stress_fit = 0.2764* d.^2.6643 .* Ra .* etae^1.228 * mu_jump^-0.57;

subplot(2,2,2)
loglog(Ra,stress_fit,'k');
hold on
loglog(Ranum,thick095,'ko','MarkerFaceColor',[0.3 0.3 0.3]);
legend({'Scaling law','Numerical model'}...
    ,'AutoUpdate','off','Location','Northwest')
xlabel('Ra')
ylabel('Stress [non-dim]')

%%
etae_range = [6.908 9.21, 11.513, 13.82, 16.12];
%thick095 = [2357.25412, 3036.333163, 3670.82971, 4260.978263, 4807.996414];
thick090 = [6248.155365, 8556.584766, 10966.25036, 13528.31915, 16277.61158];

d = 0.10;
Ra = 1e7;
mu_jump = 100;
etae = linspace(6,17);
stress_fit = 980 * etae.^0.986  ;

subplot(2,2,3)
loglog(etae,stress_fit,'k');
hold on
loglog(etae_range,thick090,'ko','MarkerFaceColor',[0.3 0.3 0.3]);
legend({'Scaling law','Numerical model'}...
    ,'AutoUpdate','off','Location','Northwest')
xlabel('Activation energy [non-dim]')
ylabel('Stress [non-dim]')

%%
visc = [5, 10, 50 ,100];
thick095 = [18239.16815, 10550.45813, 4641.375768, 4260.978263];

d = 0.05;
Ra = 1e7;
mu_jump = linspace(0,100);
etae = 11.513;
%stress_fit = 0.6153* d^2.281 * Ra * etae^0.986 .* mu_jump.^-0.7098 ;
stress_fit = 0.2764* d.^2.6643 .* Ra .* etae^1.228 * mu_jump^-0.57;

subplot(2,2,4)
plot(mu_jump, stress_fit,'k');
hold on
plot(visc,thick095,'ko','MarkerFaceColor',[0.3 0.3 0.3]);
legend({'Scaling law','Numerical model'}...
    ,'AutoUpdate','off','Location','Northwest')
xlabel('Viscosity jump [non-dim]')
ylabel('Stress [non-dim]')