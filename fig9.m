clear all
close all

kappa = 1e-6; %m2 s-1
Ev = 300000; %J mol−1
Eh = 430000;
R = 8.3145; %J mol-1 K-1
Ts = 273; %K
mu_0= 2e21; %Pa s at lithos viscosity 
a = 3e-5; %K-1
rho = 4000; %kg m-3
g = 10; %m s-2
depth = 2890*1e3; %m
f = 10e-4; 
gamma = 0.06; %J/m2 surface free energy

m=2;
p=4;

theta_1600 = Ev*1600/(R*(Ts+1600)^2);%13.82*1e3*1600/(R*(Ts+1600)^2);%Ev*1e3*1600/(R*(Ts+1600)^2);
theta_1800 = Ev*1800/(R*(Ts+1800)^2);%13.82*1e3*1600/(R*(Ts+1800)^2);%Ev*1e3*1800/(R*(Ts+1800)^2);

% Constants for viscosity and healing power law
B = 9.7269e11;
C = 1.8051e-9;

visc_1600 = B*exp(Ev/R/(1600));
visc_1800 = B*exp(Ev/R/(1800));
mu_l_0 = B*exp(Ev/R/900);

Ra_1600 = (a * rho * g * (1600) * depth^3)/(visc_1600 * kappa);
Ra_1800 = (a * rho * g * (1800) * depth^3)/(visc_1800 * kappa);

d = logspace(-2,log10(5)-1,60);
mu_jump = logspace(-1,2);

for i= 1:length(d)
    for j= 1:length(mu_jump)
        % Stress calculation
        delta_tau_1600(i,j) = 0.2764*Ra_1600*d(i).^2.6643*theta_1600^1.228*mu_jump(j)^-0.57;
        %delta_tau_1800(i,j) = 1.13* Ra_1800 * d(i)^1.72 * theta_1800.^0.2128 * mu_jump(j).^-0.64 ;
        %delta_tau_1800(i,j) = 1.5 * Ra_1800 * d(i)^3.22 * theta_1800.^0.2128 * mu_jump(j).^-0.8;
        %delta_tau_1800(i,j) = 0.6153*Ra_1800*d(i).^2.2281*theta_1800^1.3*mu_jump(j)^-0.7098;
        delta_tau_1800(i,j) = 0.2764*Ra_1800*d(i).^2.6643*theta_1800^1.228*mu_jump(j)^-0.57;      
        % Fineness calculation
        A_1600(i,j) = (f*(delta_tau_1600(i,j)).^2/...
                        (gamma*B*exp(Ev/R/(Ts+1600))*C*exp(-Eh/R/(Ts+1600))))^(1/p);
        A_1800(i,j) = (f*(delta_tau_1800(i,j)).^2/...
                        (gamma*B*exp(Ev/R/(Ts+1800))*C*exp(-Eh/R/(Ts+1800))))^(1/p);
        % Viscosity calculation
        mu_1600 = mu_l_0*A_1600.^(-m);
        mu_1800 = mu_l_0*A_1800.^(-m);
    end
end

% figure(1)
% pcolor(log10(d),log10(mu_jump),delta_tau_1600')
% colorbar
% set(gca,'ColorScale','log')
% set(gca,'FontSize',12)
% xlabel('Crustal thickness')
% ylabel('Viscosity jump')
% 
% figure(2)
% pcolor(log10(d),log10(mu_jump),A_1600')
% colorbar
% set(gca,'ColorScale','log')
% set(gca,'FontSize',12)
% xlabel('Crustal thickness')
% ylabel('Viscosity jump')
% 
% figure(3)
% pcolor(log10(d),log10(mu_jump),mu_1600')
% colorbar
% %caxis([1 1e30])
% set(gca,'ColorScale','log')
% set(gca,'FontSize',12)
% xlabel('Crustal thickness')
% ylabel('Viscosity jump')

figure(4)
pcolor(log10(d),log10(mu_jump),mu_1800'/visc_1800)
colorbar
hold on
grid on
grid minor
c = contour(log10(d),log10(mu_jump),mu_1800'/visc_1800,[3e3 3e3],'k','LineWidth',2);
caxis([1 1e7])
xticks([-1.76195,-1.4609,-1.15989,-0.76193,-0.46089])
xticklabels({'50','100','200','500','1000'})
yticks([-1, -0.6931,0,0.6990,1,1.6990,2])
yticklabels({'0.1','0.5','1','5','10','50','100'})
xline(-1.0630)
shading interp
set(gca,'ColorScale','log')
set(gca,'FontSize',18)
set(gca,'layer','top')
xlabel('Continental thickness [km]')
ylabel('\mu_{jump}')
