function r = fy(f, x, y)


    % Approximate the derivative of f with respect to y in (x, y)

    [m n nr_colors] = size(f);
    % Calculate the derivative
    if (y == 1 || y == m)
      r = 0;
      return;
    endif
    r = (f(y + 1, x) - f(y - 1, x)) / 2;
endfunction
