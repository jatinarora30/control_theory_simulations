pkg load control;

clc;
clear all;

num1 = [10];
den1 = [1, 2, 10];
num2 = [5];
den2 = [1, 5];

sys1 = tf(num1, den1);
sys2 = tf(num2, den2);

sys_series = series(sys1, sys2);
parallel_series=parallel(sys1,sys2);
feedback_series=feedback(sys1,sys2);

num_series = sys_series.num{1};
den_series = sys_series.den{1};

num_parallel =parallel_series.num{1};
den_parallel = parallel_series.den{1};

num_feedback = feedback_series.num{1};
den_feedback = feedback_series.den{1};

disp("Numerator Coefficients series:");
disp(num_series);
disp("Denominator Coefficients series:");
disp(den_series);

disp("Numerator Coefficients parallel:");
disp(num_parallel);
disp("Denominator Coefficients parallel:");
disp(den_parallel);

disp("Numerator Coefficients feedback:");
disp(num_feedback);
disp("Denominator Coefficients feedback:");
disp(den_feedback);
