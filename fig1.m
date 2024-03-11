clear all;
close all;

tbl = readmatrix('~/Documents/mcc2bU/new_regime_diagram.xlsx');
Q_circle = tbl(:,1);
Q_circle = rmmissing(Q_circle);
theta_circle = tbl(:,2);
theta_circle = rmmissing(theta_circle);
Q_tri = tbl(:,3);
Q_tri = rmmissing(Q_tri);
theta_tri = tbl(:,4);
theta_tri = rmmissing(theta_tri);
Q_cross = tbl(:,5);
Q_cross = rmmissing(Q_cross);
theta_cross = tbl(:,6);
theta_cross = rmmissing(theta_cross);
x_old = [5, 10, 15, 20, 21, 22, 23, 24, 25, 26];
y_old = [7.008, 10.514, 11.613, 10.92, 10.92, 10.92, 10.92, 10.92, 10.92, 10.92];
y_new = [7.008, 10.514, 10, 10, 10,10, 10, 10, 10, 10];
p1 = polyfit(x_old,y_old,5);
x1 = linspace(0,60);
y1 = polyval(p1,x1);
p2 = polyfit(x_old,y_new,5);
x2 = linspace(0,60);
y2 = polyval(p2,x2);

scatter(Q_circle,theta_circle,150,'filled','ko')
hold on
scatter(Q_tri,theta_tri,120,'filled','k^')
scatter(Q_cross,theta_cross,170,'filled','ks')
%plot(x_old,y_old,'o-')
%plot(x2,y2,"Color",[0.5 0.5 0.5])
xlim([0 30])
ylim([8 15])
set(gca,'Xtick',0:5:60)