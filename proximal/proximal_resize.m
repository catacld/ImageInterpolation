function R = proximal_resize(I, p, q)
    % Scale the image using Proximal Interpolation
    % Transform the dimension of image I from m x n to p x q
    [m n nr_colors] = size(I);

    % Convert the input image to black and white if needed
    if nr_colors > 1
        R = -1;
        return
    endif

     I = double(I);

    % Initialise the final matrix with a null matrix
    R = zeros(p, q);



    % Calculate the scale factors
      s_x = (q - 1) / (n - 1);
      s_y = (p - 1) / (m - 1);



    % Define the transformation matrix for resizing
            T = [s_x 0; 0 s_y];
    % Invert the transformation matrix
            T = [1/s_x 0;0 1/s_y];
    % Traverse every pixel of the image
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Apply inverse transformation to (x,y) and calculate x_p and y_p of the initial image

            x_p = x / s_x;
            y_p = y / s_y;

            % Transform (xp, yp) from [0, n-1] coordinate system to [1, n] coordinate system
            % in order to apply interpolation.

            x_p++;
            y_p++;

            % Calculate the nearest pixel

            x_p = round(x_p);
            y_p = round(y_p);

            % Calculate the value of the pixel of the final image
            R(y + 1, x + 1) = I(y_p, x_p);
        endfor
    endfor


    % Convert the matrix to type uint8 to be a valid image
    R = uint8(R);
endfunction
