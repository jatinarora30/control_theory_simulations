
Kp = 1.0;  
Ki = 0.3; 
Kd = 0.06; 

setpoint = 10;
process_variable = 0;

time_values = 0:0.01:10;  
num_points = length(time_values);


process_values = zeros(1, num_points);
error_values = zeros(1, num_points);
integral_values = zeros(1, num_points);
derivative_values = zeros(1, num_points);


for i = 2:num_points
    error = setpoint - process_variable;
    proportional_term = Kp * error;
    if(i>0)
      integral_values(i) = integral_values(i-1) + Ki * error;  
      derivative_values(i) = Kd * (error - error_values(i-1)); 
    end
    
    control_action = proportional_term + integral_values(i) + derivative_values(i);
    process_variable = process_variable +  0.1 * control_action;

    process_values(i) = process_variable;
    error_values(i) = error;
end

figure;

subplot(1, 1, 1);
plot(time_values, process_values, 'b', 'LineWidth', 2);
hold on;
plot(time_values, setpoint * ones(size(time_values)), 'r--', 'LineWidth', 2);
xlabel('Time');
ylabel('Process Variable');
title('PID Controller Simulation');
legend('Process Variable', 'Setpoint');
grid on;

