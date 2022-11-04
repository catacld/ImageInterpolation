function R = bicubic_resize(I, p, q)

    % Scale the image using Bicubic Interpolation
    % Transform the image I from size m x n to size p x q


    [m n nr_colors] = size(I);

    % Initialise the final matrix with a null matrix
    R = zeros(p, q);


    I = double(I);

    % If the image is black and white, ignore
    if nr_colors > 1
        R = -1;
        return
    endif


    % Calculate the scale factors
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
    % Define the transformation matrix for resizing
    T = [s_x 0;0 s_y];
    % Calculate the inverse of the matrix
    T_inv = [1/s_x 0;0 1/s_y];
    % Precalculate the derivatives
    [Ix Iy Ixy] = precalc_d(I);
    % Traverse every pixel of the image
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Apply inverse transformation to (x,y) and calculate x_p and y_p from the initial image
            x_p = x / s_x;
            y_p = y / s_y;
            % Convert (xp, yp) from (0, n-1) coordinate system to (1, n) coordinate system
            % to apply interpolation
            x_p++;
            y_p++;
            % Find the 4 points that surround the point (x, y)
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
            % Calculate the interpolation coefficients A
            A = bicubic_coef(I,Ix,Iy,Ixy,x1,y1,x2,y2);
            % Convert (xp, yp) to unit square by subtracting (x1, y1)
            x_p -= x1;
            y_p -= y1;
            % Calculate the interpolated value of the (x, y) pixel
            R(y + 1, x + 1) = [1 x_p x_p*x_p x_p*x_p*x_p] * A * ([1 y_p y_p*y_p y_p*y_p*y_p]');
        endfor
    endfor

    % Transform the matrix to uint8 to be a valid image
    R = uint8(R);
endfunction





