clc
clear all
close all

for i = 1:4
    RGB = imread(strcat("example_",int2str(i),".png"));
    RGB = imresize(RGB, 0.5);
    figure
    subplot(2,2,1);
    imshow(RGB);
    title("Original Image");
    dim = size(RGB);
    
    num_colors = 3;
    num_attempts = 3;
    
    lab_rgb = rgb2lab(RGB);
    
    ab = lab_rgb(:,:,2:3);
    ab = im2single(ab);
    pixel_labels = imsegkmeans(ab,num_colors,NumAttempts=num_attempts);
    
    B = labeloverlay(RGB,pixel_labels); 
    
    mask1 = pixel_labels == 1;
    cluster1 = RGB.*uint8(mask1);
    subplot(2,2,2)
    imshow(cluster1)
    title("Objects in Cluster 1");
    
    mask2 = pixel_labels == 2;
    cluster2 = RGB.*uint8(mask2);
    subplot(2,2,3)
    imshow(cluster2)
    title("Objects in Cluster 2");
    
    mask3 = pixel_labels == 3;
    cluster3 = RGB.*uint8(mask3);
    subplot(2,2,4)
    imshow(cluster3)
    title("Objects in Cluster 3");

    if (i == 1)
        % example_1.png
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster3);
        title("Input point where the ball end");
        [x1, y1] = getpts(f);
        close(f);
        
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster1);
        title("Input point where the last player from another team");
        [x2, y2] = getpts(f);
        close(f);
    elseif (i == 2)
        % example_2.png
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster2);
        title("Input point where the ball end");
        [x1, y1] = getpts(f);
        close(f);
        
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster3);
        title("Input point where the last player from another team");
        [x2, y2] = getpts(f);
        close(f);
    elseif (i == 3)
        % example_3.png
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster3);
        title("Input point where the ball end");
        [x1, y1] = getpts(f);
        close(f);
        
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster2);
        title("Input point where the last player from another team");
        [x2, y2] = getpts(f);
        close(f);  
    elseif (i == 4)
        % example_4.png
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster2);
        title("Input point where the ball end");
        [x1, y1] = getpts(f);
        close(f);
        
        f = figure;
        f.WindowState = 'maximized';
        imshow(cluster3);
        title("Input point where the last player from another team");
        [x2, y2] = getpts(f);
        close(f);          
    end
    RGB = insertShape(RGB,"line",[x1 y1 x2 y2],LineWidth=1, Color="red");

    figure;
    imshow(RGB);
    if (x1 > x2 && y1 < y2)
        title("offside");
    else
        title("Play on");
    end

end