function r = fx(f, x, y).

    % Approximate the derivative of f with respect to x in (x, y)

    [m n nr_colors] = size(f);
    % Calculate the derivative
    if (x == 1 || x == n)
      r = 0;
      return;
    endif

    r = (f(y,x + 1) - f(y,x - 1)) / 2;
endfunction
