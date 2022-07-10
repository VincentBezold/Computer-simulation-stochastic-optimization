close all
clear all
clc
data = readtable('manyCities.csv');
x = table2array(data(:,1));
y = table2array(data(:,2));
order = [36 83 32 95 6 0 92 4 65 37 27 79 47 30 61 73 25 53 76 93 97 16 24 10 55 89 44 8 3 87 21 1 51 18 88 75 71 45 86 42 94 59 72 38 35 14 22 96 26 68 60 9 13 90 66 17 23 7 52 78 80 85 70 49 12 48 81 84 31 2 74 64 77 98 39 69 63 57 40 82 19 33 41 99 43 56 91 15 5 50 20 34 54 29 67 46 62 58 28 11]; %7 5 6 4 3 1 2 0
order = order + 1;
plot(x(order), y(order),'-')
hold on
plot(x(order), y(order),'x')
plot(x(36), y(36),'o','MarkerSize',16,'Color', 'magenta')
xlabel('Coordinates');
ylabel('Coordinates');
% xlim([-0.5 2.5])
% ylim([-0.5 2.5])
% title('The Box');