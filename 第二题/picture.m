data_5 = readtable("预测的粤港澳大湾区2024-2034年GDP.xlsx");
year = data_5.Var3;
gdp = data_5.Var4;
% = 2013:1:2034
plot(year,gdp,'r-');
xlim([2013 2034]);
grid on 
xlabel("年份");
ylabel("GDP标准化");