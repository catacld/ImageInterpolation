function out = proximal_rotate_RGB(img, rotation_angle)

    % Apply Proximal Interpolation to rotate an image by a given angle

    % Extract the red channel of the image
    R = img(:,:,1);
    % Extract the green channel of the image
    G = img(:,:,2);
    % Extract the blue channel of the image
    B = img(:,:,3);
    % Apply rotate to each channel of the image
    R = proximal_rotate(R,rotation_angle);
    G = proximal_rotate(G,rotation_angle);
    B = proximal_rotate(B,rotation_angle);
    % Create the final image by concatenating the 3 channels of colors
    out = cat(3,R,G,B);
endfunction
