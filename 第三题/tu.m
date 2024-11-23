data10 = readtable("线性预测数据.xlsx",VariableNamingRule="preserve");
year = data10.year;
GDP = data10.("预测数据11");


figure
plot(year,GDP, 'ro-', 'MarkerFaceColor', 'r');

xlim([2013 2033])
xlabel("年份");
ylabel("GDP");