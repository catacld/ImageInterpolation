function [Ix, Iy, Ixy] = precalc_d(I)

    % Precalculate the matrices Ix, Iy and Ixy which contain the derivatives
    % dx, dy, and dxy of the image I for its every pixel


    % Get the size of the image
    [m n nr_colors] = size(I);

    % Transform the matrix I to double
    I = double(I);
    % Calculate the matrix of derivatives with respect to x Ix
    Ix = zeros(m,n);
    for x = 1 : n
      for y = 1 : m
        Ix(y, x) = fx(I,x,y);
      endfor
    endfor
    % Calculate the matrix of derivatives with respect to y Iy
    Iy = zeros(m,n);
    for x = 1 : n
      for y = 1 : m
        Iy(y, x) = fy(I,x,y);
      endfor
    endfor
    % Calculate the matrix of derivatives with respect to xy Ixy
    Ixy = zeros(m,n);
    for x = 1 : n
      for y = 1 : m
        Ixy(y, x) = fxy(I,x,y);
      endfor
    endfor
endfunction
