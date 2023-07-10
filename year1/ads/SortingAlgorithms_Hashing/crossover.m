clear;clc;close all;

fid=fopen('InsertionSort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
x=data{1};
quicksort_y=data{2};

fid=fopen('QuickSort_low.txt');
data=textscan(fid,'%d %f');
fclose(fid);
insertionsort_y=data{2};

figure;
title('Crossover Point (Insertion and QuickSort)');
xlabel('n [-]');
ylabel('t [s]');
hold on;
plot(x,insertionsort_y);
plot(x,quicksort_y);


legend('QuickSort','InsertionSort' ,...
    'Location','northwest');
hold off;