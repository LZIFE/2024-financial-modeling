data = readtable("工作簿1.xlsx",'NumHeaderLines',0);
time = data.year1;
future = data.yuce_year;
%% 
data_1 = readtable("纽约湾区(3).xlsx",'NumHeaderLines',0);
%% 
GDP = data_1.biao_gdp;
first_industry = data.biao1;
second_industry = data.biao2;
third_industry = data.biao3;
%% 
data_4 = readtable("预测数据1.xlsx","ReadRowNames",true);
fu_1 = data_4.yuce1;
fu_2 = data_4.yuce2;
fu_ori = data_4.oridinary_labor;
fu_high = data_4.high_labor1;
fu_yanfa = data_4.yanfa;
%% 

oridinary_labor = data.gaozhongbiao;
high_labor = data.daxuebiao;

%% 


yanfa_money = data.biaokeyan;
zhuanli = data.zhuanlibiao;

 
%% 


X = [ones(length(GDP),1),first_industry,second_industry,oridinary_labor,high_labor,zhuanli];


%% 
b=regress(GDP,X);
%执行回归分析
[b, bint, r, rint, stats] = regress(GDP, X);
M = b(1)+b(2)*fu_1+b(3)*fu_2+b(4)*fu_ori+b(5)*fu_high+b(6)*fu_yanfa;
plot(future,M,'k-')
%% 
rcoplot(r,rint);
disp(b);
disp(bint);
%% 
disp(r);
disp(rint);
disp(stats);
rcoplot(r,rint);

%{
normplot(r);grid off;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';
%}