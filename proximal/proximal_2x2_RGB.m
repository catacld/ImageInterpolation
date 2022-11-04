function out = proximal_2x2_RGB(img, STEP = 0.1)
    % Apply Proximal Interpolation on a given 2x2 RGB colored image.

    % Extract the red channel of the image
    R = img(:,:,1);
    % Extract the green channel of the image
    G = img(:,:,2);
    % Extract the blue channel of the image
    B = img(:,:,3);

    % Apply bilinear_2x2_interpolation on each channel
    R = proximal_2x2(R,STEP);
    G = proximal_2x2(G,STEP);
    B = proximal_2x2(B,STEP);
    % Create the final image by combining the results
    out = cat(3,R,G,B);
endfunction
