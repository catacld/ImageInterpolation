function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)

    % Calculate the Bicubic Interpolation coefficients for 4 nearby points

    % Calculate the intermediate matrices
    M1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    M2 = [f(y1,x1) f(y2,x1) Iy(y1,x1) Iy(y2,x1); f(y1,x2) f(y2,x2) Iy(y1,x2) Iy(y2,x2);Ix(y1,x1) Ix(y2,x1) Ixy(y1,x1) Ixy(y2,x1); Ix(y1,x2) Ix(y2,x2) Ixy(y1,x2) Ixy(y2,x2)];
    M3 = [1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    % Convert the intermediate matrices to double
    M1 = double(M1);
    M2 = double(M2);
    M3 = double(M3);
    % Calculate the final matrix
    A = M1 * M2 * M3;

endfunction
