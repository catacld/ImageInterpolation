function a = proximal_coef(f, x1, y1, x2, y2)
    % Calculate the coefficients for Proximal Interpolation between
    % (x1, y1), (x1, y2), (x2, y1) and (x2, y2)

    % Calculate matrix A
    A = [1 x1 y1 x1*y1;1 x1 y2 x1*y2;1 x2 y1 x2*y1;1 x2 y2 x2*y2];
    % Calculate array B
    b = [f(y1,x1);f(y2,x1);f(y1,x2);f(y2,x2)];
    % Calculate the coefficients
    a = double(inverse(A)) * double(b);
endfunction
