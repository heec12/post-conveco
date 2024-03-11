clear all;

cont_thickness = [0.2 0.15 0.1 0.05 0.025];

q10_fineness = [7.7842	7.8979	7.0358	6.514	6.8686];
q10_v = [7.11E-01	7.61E-01	6.47E-01	5.66E-01	0.5962];

q15_fineness = [34.2675	7.4412	6.7791	7.2771	7.1338];
q15_v = [1.74E+02	5.10E-01	6.40E-01	7.27E-01	6.89E-01];

q20_fineness = [34.7996	8.103	6.6622	7.6358	7.205];
q20_v = [2.19E+02	5.91E-01	5.83E-01	8.59E-01	7.39E-01];

subplot(2,1,1)
plot(cont_thickness,q10_v,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#304369",'MarkerSize',10);
hold on
plot(cont_thickness,q15_v,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#d9e9f5",'MarkerSize',10);
plot(cont_thickness,q20_v,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#f26101",'MarkerSize',10);
xlabel('Continental thickness')
ylabel('Surface velocity')
set(gca,'FontSize',12)


subplot(2,1,2)
plot(cont_thickness,q10_fineness,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#304369",'MarkerSize',10);
hold on
plot(cont_thickness,q15_fineness,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#d9e9f5",'MarkerSize',10);
plot(cont_thickness,q20_fineness,'o',"MarkerEdgeColor","k", ...
    "MarkerFaceColor","#f26101",'MarkerSize',10);
xlabel('Continental thickness')
ylabel('Maximum fineness')
set(gca,'FontSize',12)
