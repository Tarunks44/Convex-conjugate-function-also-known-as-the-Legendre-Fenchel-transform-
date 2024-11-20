% Animated visualization of convex conjugate formation
clear; close all;clc;

% Define the non-convex function f(x) = x^4 - 2x^2
%f = @(x) x.^4 - 2*x.^2;
% Alternative functions - uncomment to try different ones
% f = @(x) x.^4 - 2*x.^2;     % Double-well potential (current)
% f = @(x) sin(2*x);          % Sine function
% f = @(x) exp(-x.^2);        % Gaussian
% f = @(x) abs(x);            % Absolute value
f = @(x) max(0, x);         % ReLU function

% Create coordinate vectors
x = linspace(-2.5, 2.5, 200);
y_values = linspace(-4, 4, 50); % Points for animation

% Prepare figure
figure('Position', [100, 100, 1200, 600]);

% Create animation
for frame = 1:length(y_values)
    clf; % Clear figure
    
    % Current y value for animation
    y_current = y_values(frame);
    
    % Calculate xy - f(x) for current y
    xy_minus_fx = y_current*x - f(x);
    
    % Find maximum value (conjugate at current y)
    [max_val, max_idx] = max(xy_minus_fx);
    
    % Subplot 1: Original function and line
    subplot(2, 2, 1);
    plot(x, f(x), 'b-', 'LineWidth', 2);
    hold on;
    plot(x, y_current*x, 'r--', 'LineWidth', 1.5);
    plot(x(max_idx), f(x(max_idx)), 'go', 'MarkerSize', 10, 'LineWidth', 2);
    grid on;
    title(sprintf('f(x) and line y*x (y = %.2f)', y_current));
    xlabel('x');
    ylabel('Value');
    legend('f(x)', 'y*x', 'Maximum point');
    axis([-2.5 2.5 -3 6]);
    
    % Subplot 2: xy - f(x) for current y
    subplot(2, 2, 2);
    plot(x, xy_minus_fx, 'b-', 'LineWidth', 2);
    hold on;
    plot(x(max_idx), max_val, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    grid on;
    title(sprintf('xy - f(x) at y = %.2f', y_current));
    xlabel('x');
    ylabel('Value');
    axis([-2.5 2.5 -5 5]);
    
    % Subplot 3: Building the conjugate function
    subplot(2, 2, [3, 4]);
    
    % Calculate conjugate values up to current y
    f_conj = zeros(size(y_values(1:frame)));
    for i = 1:frame
        y_i = y_values(i);
        xy_minus_fx_i = y_i*x - f(x);
        f_conj(i) = max(xy_minus_fx_i);
    end
    
    % Plot conjugate function
    plot(y_values(1:frame), f_conj, 'r-', 'LineWidth', 2);
    hold on;
    plot(y_current, max_val, 'go', 'MarkerSize', 10, 'LineWidth', 2);
    grid on;
    title('Building Convex Conjugate f*(y)');
    xlabel('y');
    ylabel('f*(y)');
    axis([-4 4 -2 8]);
    
    % Add explanation text
    annotation('textbox', [0.1, 0.02, 0.8, 0.05], ...
        'String', sprintf('For y = %.2f, f*(y) = %.2f', y_current, max_val), ...
        'EdgeColor', 'none', ...
        'HorizontalAlignment', 'center', ...
        'FontSize', 12);
    
    % Set figure background to white
    set(gcf, 'Color', 'w');
    
    % Pause for animation
    pause(0.1);
    
    % Optional: Capture frame for video
    frames(frame) = getframe(gcf);
end

% Create video writer object
v = VideoWriter('convex_conjugate_animation.avi');
v.FrameRate = 10;
open(v);

% Write frames to video
writeVideo(v, frames);
close(v);