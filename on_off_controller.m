setpoint = 10;
process_variable = 0;

on_threshold = 1;
off_threshold = 0.5;
increase_rate_fill = 0.01;
decrease_rate_empty = 0.2;

% Arrays to store data for plotting
time_values = 1:100;
process_values = zeros(size(time_values));
control_values = zeros(size(time_values));

for time = time_values
    error = setpoint - process_variable;
    
    if error > on_threshold
        control_action = 1;
        process_variable = process_variable + randn() + increase_rate_fill * time;
    elseif error < off_threshold
        control_action = 0;
        process_variable = process_variable + randn() - decrease_rate_empty * time;
    end
    

    process_values(time) = process_variable;
    control_values(time) = 1 * control_action; 
end

% Plotting
figure;

% Plot Process Variable
subplot(2, 1, 1);
plot(time_values, process_values);
xlabel('Time');
ylabel('Process Variable');
title('On-Off Controller Simulation - Process Variable');
grid on;

% Plot Magnified Control Action
subplot(2, 1, 2);
stairs(time_values, control_values);  % Use stairs for a step-like plot of control action
xlabel('Time');
ylabel('Control Action');
title('On-Off Controller Simulation - Control Action');
grid on;
process_variable=10;


