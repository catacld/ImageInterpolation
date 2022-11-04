function out = proximal_resize_RGB(img, p, q)
    % Resize the image so that its dimension will be p x q

    % Extract the red channel of the image
     R = img(:, :, 1);
    % Extract the green channel of the image
     G = img(:, :, 2);
    % Extract the blue channel of the image
     B = img(:, :, 3);

    % Apply the proximal function on the 3 channels of the image
     R = proximal_resize(R,p,q);
     G = proximal_resize(G,p,q);
     B = proximal_resize(B,p,q);
    % Create the final image by concatenating the 3 channels of colors
    out = cat(3,R,G,B);
endfunction
