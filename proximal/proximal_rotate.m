function R = proximal_rotate(I, rotation_angle)
    % Rotate the black and white m x n image I by an angle of rotation_anle radians,
    % using Proximal Interpolation
    [m n nr_colors] = size(I);

    % Convert the input image to black and white if needed
    if nr_colors > 1
        R = -1;
        return
    endif

    I = double(I);


    % Calculate sin and cos of rotation_angle
    x0 = cos(rotation_angle);
    y0 = sin(rotation_angle);
    % Initialise the final matrix
    R = zeros(m,n);
    % Calculate the transformation matrix
    T = [x0 -y0;y0 x0];
    % Invert the transformation matrix
    T_inv = inverse(T);
    % Traverse every pixel of the image
    for y = 0 : m - 1
        for x = 0 : n - 1
            % Apply inverse transformation to (x,y) and calculate x_p and y_p of the initial image
            var = T_inv * [x;y];
            x_p = var(1,1);
            y_p = var(2,1);
            % Transform (xp, yp) from [0, n-1] coordinate system to [1, n] coordinate system
            % in order to apply interpolation
            x_p++;
            y_p++;
            % If either xp or yp is outside the image a black pixel is added
            if(x_p > n || x_p < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif

            if (y_p > m || y_p < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif

            % Calculate the points surrounding (xp,yp)
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;

            if (y2 > m)
               y1--;
               y2 = m;
            endif

            if (x2 > n)
              x1--;
              x2 = n;
            endif


            % Calculate the interpolation coefficients
            a = proximal_coef(I, x1, y1, x2, y2);
            % Calculate the interpolated value of the (x, y) pixel
            R(y + 1, x + 1) = a(1,1) + a(2,1) * x_p + a(3,1) * y_p + a(4,1) * x_p * y_p;
        endfor
    endfor

    % Convert the matrix to type uint8 to be a valid image
     R = uint8(R);
endfunction
