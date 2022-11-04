function out = bicubic_resize_RGB(img, p, q)

    % Resize the color img image so that it will be of size p x q

    % Extract the red channel of the image
    R = img(:,:,1);
    % Extract the green channel of the image
    G = img(:,:,2);
    % Extract the blue channel of the image
    B = img(:,:,3);

    % Apply the bicubic function on the 3 color channels
    R = bicubic_resize(R,p,q);
    G = bicubic_resize(G,p,q);
    B = bicubic_resize(B,p,q);
    % Create the final image by concatenating the 3 color channels
    out = cat(3,R,G,B);

endfunction
