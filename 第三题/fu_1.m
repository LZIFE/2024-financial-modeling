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


oridinary_labor = data.gaozhongbiao;
high_labor = data.daxuebiao;

%% 


yanfa_money = data.biaokeyan;
zhuanli = data.zhuanlibiao;

 
%% 


X = [ones(length(first_industry),1),time];
[b,bint,r,rint,stats] = regress(first_industry,X);
Z=b(1)+b(2)*time;
plot(time,first_industry,'k+',time,Z,'b');
M = b(1)+b(2)*(future);
%% 

disp(b);
disp(bint);
%% 
disp(r);
disp(rint);
disp(stats);
%rcoplot(r,rint);

%% 

%{
normplot(r);grid off;
ax=gca;
ax.XAxisLocation='origin';
ax.YAxisLocation='origin';

%}
