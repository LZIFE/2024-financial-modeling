data = readtable("SGDP.xlsx",'VariableNamingRule','preserve');
time = data.year;
future = time+11;
GDP = data.biao_allgdp;
first_industry = data.first_biao;
second_industry = data.second_biao;
third_industry = data.third_biao;
%% 

data_1 = readtable("s大湾区人口.xlsx",'ReadVariableNames',true,'VariableNamingRule','preserve');

population = data_1.("粤港澳大湾区人口 (百万)");
children=data_1.("粤港澳大湾区年龄 0-14 岁 (百万)");
worker=data_1.("粤港澳大湾区年龄 15-64 岁 (百万)");
senior=data_1.("粤港澳大湾区年龄 65 岁及以上 (百万)");
oridinary_labor = data_1.("粤港澳大湾区高中及以下教育人口");
high_labor = data_1.("粤港澳大湾区本科及以上教育人口");

%% 

data_2 = readtable("s粤港澳科研.xlsx",'VariableNamingRule','preserve');

yanfa_money = data_2.("标准化后的粤港澳科研经费（亿元）");
zhuanli = data_2.("标准化后的粤港澳大湾区研究型大学集群校均专利申请量（件）");
%% 

data_3 = readtable("粤港澳交通.xlsx",'VariableNamingRule','preserve');
railwaylength = data_3.("标准化结果");
 
%% 

data_4 = readtable("预测数据.xlsx");
fu_2 = data_4.second_industry;
fu_3 = data_4.third_industry;
fu_ori = data_4.oridinary_labor;
fu_high = data_4.high_labor;
fu_zhuanli = data_4.zhuanli;


%% 

X = [ones(length(GDP),1),second_industry,third_industry,oridinary_labor,high_labor,zhuanli];


%% 
b=regress(GDP,X);
%执行回归分析
[b, bint, r, rint, stats] = regress(GDP, X);
M = b(1)+b(2)*fu_2+b(3)*fu_3+b(4)*fu_ori+b(5)*fu_high+b(6)*fu_zhuanli;
disp(b);
disp(bint);
disp(r);
disp(rint);
disp(stats);
rcoplot(r,rint);
%% 
Now = b(1)+b(2)*second_industry+b(3)*third_industry+b(4)*oridinary_labor+b(5)*high_labor+b(6)*zhuanli;


fz = GDP-Now; % 分子
MAPE = 1/11*(sum(abs(fz ./ GDP))); 
RMSE = sqrt( 1/11*(sum((GDP-Now).^2)) ) ;
%% 

%{
normplot(r);grid off;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';

%}