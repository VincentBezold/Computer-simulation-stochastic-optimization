close all
clear all
clc
data = readtable('omega.csv');
x = table2array(data(:,1));
y = table2array(data(:,2));
order = [3 1 0 2 5 7 6 4]; %7 5 6 4 3 1 2 0
order = order + 1;
plot(x(order), y(order),'x-')