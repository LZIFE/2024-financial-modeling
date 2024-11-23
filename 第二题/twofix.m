% 假设数据存储在一个表格中（table）
% 数据列：y, X1, X2, ..., Xn, id, time

% 加载数据
% 假设数据存储在 'panel_data.csv' 文件中
data = readtable('');

% 提取变量
y = data.y;           % 因变量
X = data{:, {'X1', 'X2', 'X3'}};  % 自变量矩阵，假设有 X1, X2, X3 这些自变量
id = data.id;         % 城市id
time = data.time;     % 年份

% 创建城市固定效应虚拟变量
[~, city_id] = grp2idx(id);  % 将城市ID转化为数字
city_dummies = full(ind2vec(city_id')');  % 城市虚拟变量矩阵

% 创建时间固定效应虚拟变量
[~, time_id] = grp2idx(time);  % 将时间ID转化为数字
time_dummies = full(ind2vec(time_id')');  % 时间虚拟变量矩阵

% 组合虚拟变量和自变量
X_all = [X, city_dummies, time_dummies];  % 拼接自变量和固定效应

% 最小二乘估计（OLS）
% X_all 是包含自变量和固定效应的矩阵，y 是因变量
% 我们采用 OLS 来估计模型： y = X_all * beta + epsilon
% X_all 不包括截距项，因此我们不需要再额外添加截距

beta = (X_all' * X_all) \ (X_all' * y);

% 打印结果
disp('回归系数：');
disp(beta);

% 可以通过如下代码计算固定效应估计值
% 城市固定效应
city_effects = beta(end - size(city_dummies, 2) + 1 : end); 

% 时间固定效应
time_effects = beta(end - size(city_dummies, 2) - size(time_dummies, 2) + 1 : end - size(city_dummies, 2));

disp('城市固定效应：');
disp(city_effects);

disp('时间固定效应：');
disp(time_effects);

