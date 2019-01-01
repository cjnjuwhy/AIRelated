function [hat_out]=char_hat(img,flag)

reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end

[img_height,img_width,~]=size(img);

detector = buildDetector();
[bbox,~,~,~] = detectFaceParts(detector,img,2);

if size(bbox,1)==0
    bb=[fix(img_width/2),fix(img_width/2),img_height/10,img_width/10];
else
    bb=bbox(:,1:4);
end
if(flag)
    hat_in=imread('hat/sdm_r.jpg');
else
    hat_in=imread('hat/sdm_g.jpg');
end
for k=1:size(bbox,1)
    img=add_hat(hat_in,img,bb(k,:),flag);
end


imshow(img)
hat_out=img;
end
