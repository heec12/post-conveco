clear all;
close all;

% params
D = 1e-2;
H = 1.5e5;
theta_h = 13.82;
theta_v = 13.82;
h_l = exp(-theta_h);
mu_l = exp(theta_v);
p = 4;
m = 2;
mu_jump = 100;
Ra = 1e7;

eff_Ra = 1.0e+07 *[1.0811    1.3004    1.7875];

% variables
d = 1 - [0.8, 0.9, 0.95, 0.9625, 0.975];
Q10_Aman = [3.1352, 2.9824, 2.9162, 3.1679, 3.0235];
Q15_Aman = [2.0596, 2.1919, 2.7264, 2.2386, 2.6304];
Q20_Aman = [1.3279, 1.833, 2.4091, 2.3156, 1.3981];
Q10_Tman = [0.7563, 0.7631, 0.7762, 0.7607, 0.7598];
Q15_Tman = [0.9189, 0.8986, 0.8873, 0.8917, 0.8900];
Q20_Tman = [1.0061, 0.9905, 0.9934, 0.9696, 0.9884];

% equations
del_tau = 0.2764*Ra*d.^2.6643*theta_h^1.228*mu_jump^-0.57;
del_tau_q10 = 0.2764*eff_Ra(1)*d.^2.6643*theta_h^1.228*mu_jump^-0.57;
del_tau_q15 = 0.2764*eff_Ra(2)*d.^2.6643*theta_h^1.228*mu_jump^-0.57;
del_tau_q20 = 0.2764*eff_Ra(3)*d.^2.6643*theta_h^1.228*mu_jump^-0.57;

A_sz = ((D*del_tau.^2)/(H*h_l*mu_l)).^(1/(p-m));
A_sz_q10 = ((D*del_tau_q10.^2)/(H*h_l*mu_l)).^(1/(p-m));
A_sz_q15 = ((D*del_tau_q15.^2)/(H*h_l*mu_l)).^(1/(p-m));
A_sz_q20 = ((D*del_tau_q20.^2)/(H*h_l*mu_l)).^(1/(p-m));

mu_sz = mu_l*A_sz.^(-m);
mu_sz_q10 = mu_l*A_sz_q10.^(-m);
mu_sz_q15 = mu_l*A_sz_q15.^(-m);
mu_sz_q20 = mu_l*A_sz_q20.^(-m);
Q10_mu_man = exp(theta_v*(1-Q10_Tman)).*Q10_Aman.^(-m);
Q15_mu_man = exp(theta_v*(1-Q15_Tman)).*Q15_Aman.^(-m);
Q20_mu_man = exp(theta_v*(1-Q20_Tman)).*Q20_Aman.^(-m);

subplot(1,2,1)
%plot(d, A_sz,'ko','MarkerFaceColor',[0.3 0.3 0.3]);
%hold on
%p = polyfit(d, A_sz,4);
x1 = linspace(0,0.2);
%y1 = polyval(p,x1);
%plot(x1,y1,'k');
plot(d, A_sz_q10,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#304369",'MarkerSize',8);
hold on
plot(d, A_sz_q15,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#d9e9f5",'MarkerSize',8);
plot(d, A_sz_q20,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#f26101",'MarkerSize',8);

xlabel('Continental thickness [non-dim]')
ylabel('Fineness [non-dim]')
set(gca,'FontSize',12)

subplot(1,2,2)
threshold = 3e3*ones(length(x1));
semilogy(d, 10*mu_sz_q10./Q10_mu_man,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#304369",'MarkerSize',8);
hold on
semilogy(d, 10*mu_sz_q15./Q15_mu_man,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#d9e9f5",'MarkerSize',8);
semilogy(d, 10*mu_sz_q20./Q20_mu_man,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#f26101",'MarkerSize',8);
semilogy(x1,threshold,'Color',[0.3,0.3,0.3])

xlabel('Continental thickness [non-dim]')
ylabel('\mu sz/\mu man')
set(gca,'FontSize',12)
