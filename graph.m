table = readtable('~/Desktop/Simulation2/1/1.txt');
table2 = readtable('~/Desktop/Simulation2/1/2.txt');
table3 = readtable('~/Desktop/Simulation2/1/3.txt');
table4 = readtable('~/Desktop/Simulation2/1/4.txt');
table5 = readtable('~/Desktop/Simulation2/1/5.txt');
A=200;
scatter(table.Var1,table.Var2,A,'.','k'); 
hold on;
scatter(table2.Var1, table2.Var2,1.5*A, '.','k');
hold on;
scatter(table3.Var1, table3.Var2,2*A, '.','k');
hold on;
scatter(table4.Var1, table4.Var2,2.5*A, '.','k');
hold on;
scatter(table5.Var1, table5.Var2,3*A, '.','k');
title('Simulation 2-1');
set(gca,'xtick',[]);
set(gca,'ytick',[]);
box on;   
saveas(gcf,'~/Desktop/Simulation2/s2-1.png');