clear;clc;close all;

fid=fopen('quicksort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
x=data{1};
quicksort_y=data{2};

fid=fopen('hybridquicksort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
hybridquicksort_y=data{2};

fid=fopen('mergesort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
mergesort_y=data{2};

fid=fopen('natmergesort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
natmergesort_y=data{2};

fid=fopen('heapsort.txt');
data=textscan(fid,'%d %f');
fclose(fid);
heapsort_y=data{2};

fid=fopen('shellsort2n.txt');
data=textscan(fid,'%d %f');
fclose(fid);
shellsort2n_y=data{2};

fid=fopen('shellsort3n.txt');
data=textscan(fid,'%d %f');
fclose(fid);
shellsort3n_y=data{2};

figure;
title('Sorting algorithms');
xlabel('n [-]');
ylabel('t [s]');
hold on;
plot(x,quicksort_y);
plot(x,hybridquicksort_y);
plot(x,mergesort_y);
plot(x,natmergesort_y);
plot(x,heapsort_y);
plot(x,shellsort2n_y);
plot(x,shellsort3n_y);

legend('QuickSort','HybridQuickSort' ,...
    'MergeSort','NatMergeSort','HeapSort', ...
    'ShellSort2n','ShellSort3n', ...
    'Location','northwest');
hold off;