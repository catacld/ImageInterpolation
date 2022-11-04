function r = fxy(f, x, y)

    % Approximate the derivative of f with respect to x and y in (x, y)

    [m n nr_colors] = size(f);
    % Calculate the derivative
    if (x == 1 || x == n || y == 1 || y == m)
      r = 0;
      return;
    endif
    r = (f(y - 1,x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1, x - 1)) / 4;
endfunction
