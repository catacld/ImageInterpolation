function out = proximal_2x2(f, STEP = 0.1)
    % Apply Proximal Interpolation on the 2 x 2 f image with intermediate equidistant points
    % f values are known in (1,1), (1,2), (2,1), (2,2)
    % Parameters:
    % - f = the image to be interpolated
    % - STEP = the distance between two successive points

    % Define the x and y coordinates of the intermediate points
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    % Get the number of points
    n = length(x_int);

    % The 4 corner points will be the same for each interior point
    x1 = y1 = 1;
    x2 = y2 = 2;
    % Initialise the result with a null n x n matrix
    out = zeros (n);
    % Traverse every pixel of the final image
    for i = 1 : n
        for j = 1 : n
            % Find the closest pixel of the initial image
            var(1) = round(x_int(i));
            var(2) = round(y_int(j));

            % Calculate the pixel of the final image
            out(i,j) = f(var(1),var(2));
        endfor
    endfor

endfunction
