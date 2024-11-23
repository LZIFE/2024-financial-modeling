data = readtable("工作簿1.xlsx",'NumHeaderLines',0);
time = data.year1;
%% 
data_1 = readtable("纽约湾区(3).xlsx",'NumHeaderLines',0);
GDP = data_1.biao_gdp;
first_industry = data.biao1;
second_industry = data.biao2;
third_industry = data.biao3;
%% 


oridinary_labor = data.gaozhongbiao;
high_labor = data.daxuebiao;

%% 


yanfa_money = data.biaokeyan;
zhuanli = data.zhuanlibiao;

 
%% 

X = [ones(length(GDP),1),first_industry,second_industry,third_industry,oridinary_labor,high_labor,yanfa_money,zhuanli];


%% 
b=regress(GDP,X);
%执行回归分析
[b, bint, r, rint, stats] = regress(GDP, X);


%% 

disp(b);
disp(bint);
%% 
disp(r);
disp(rint);
disp(stats);
rcoplot(r,rint);

%% 

%{
normplot(r);grid off;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';

%}
