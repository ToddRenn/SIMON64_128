%% Complex: Image to Binary
clear;clc;
% Read in image as uint8
I = imread('image.jpg');
[Complex_Length,Complex_Width] = im2bin(I,"complex_64b_binary.txt",1);
%bin2im("complex_64b_binary.txt",Complex_Length,Complex_Width); %proof of function
bin2im("bin_encrypt_complex.txt",Complex_Length,Complex_Width); %proof of function

%% Complex: Binary to Image
bin2im('bin_decrypt.txt',Complex_Length,Complex_Width);

%% Simple Image: 8x8 Checker Board
clear;clc;
L = 100;
W = 200;
Simple_Image = checkerBoard(L,W);
[Simple_Length,Simple_Width] = im2bin(Simple_Image,"simple_64b_binary.txt",0);
%bin2im("simple_64b_binary.txt",Simple_Length,Simple_Width); %proof of function
bin2im("bin_encrypt_simple.txt",Simple_Length,Simple_Width);

%% Functions

function [L,W] = im2bin(image,filename,RGBorGRAY)
% This function converts a grayscale or RGB image to a binary text file
% split into 64b chunk lines.
%
% INPUTS
% image: Raw image file in work directory
% filename: String
% RGBorGRAY: 0 for grayscale, 1 for RGB
%
% OUTPUTS
% L,W: Dimensions of original image
    % Convert image to grayscale
    if(RGBorGRAY)
        gray = rgb2gray(image);
    else
        gray = im2gray(image);
    end
    L = height(gray);
    W = width(gray);
    figure; imshow(gray); title('Grayscale Image');

    % Convert uint8 image vector to binary values
    AsBinary = uint8( dec2bin(gray)-'0');
    AsBinary = AsBinary';
    AsBinary = AsBinary(:)';

    % 64b chunk the bitstream
    bitstream_64b = uint8(zeros(L*W*8/64,64));
    for i=1:(width(AsBinary)/64)
        for j=1:width(bitstream_64b)
            bitstream_64b(i,j)=AsBinary((i-1)*64+j);
        end
    end

    % Write the file
    writematrix(bitstream_64b,filename);

    % Remove delimiters, because matlab doesn't provide options for no
    % delimiters for output...
    text = fileread(filename);
    text = erase(text,',');
    f = fopen(filename,"w");
    fprintf(f,text);
    fclose(f);
end

function bin2im(filename,L,W)
% This function converts a binary text file containing 64b lines
% WITH NO DELIMITERS into a grayscale image.
%
% INPUTS
% filename: String
% L,W: Dimensions of image

    % Calculate dimensions
    Dim = (L*W*8)/64;

    % Open binary text file
    fid=fopen(filename);
    Y=fscanf(fid,'%s');

    % Rearrange as an LxW matrix of uint8 grayscale values
    Y = Y(:)';
    Y = Y';
    Y = bin2dec(reshape(Y,8,[])');
    Y = uint8(reshape(Y,L,W));
    figure;imshow(Y);title('Binary to Image');
    fclose(fid);
end

function g_map = checkerBoard(L,W)
% This function returns a graymapping of an LxW checkerboard
%
% INPUTS
% L,W: Dimensions of checkerboard
%
% OUTPUTS
% g_map: Mapping of grayscale values
    g_map = zeros(L,W);
    ODD = zeros(1,W);
    EVEN = zeros(1,W);
    for i = 1:W
        if(mod(i,2)) %odd
            ODD(i) = 255;
            EVEN(i) = 0;
        else
            ODD(i) = 0;
            EVEN(i) = 255;
        end
    end
    for i = 1:L
        if(mod(i,2)) %odd
            g_map(i,:) = ODD;
        else
            g_map(i,:) = EVEN;
        end
    end
end
