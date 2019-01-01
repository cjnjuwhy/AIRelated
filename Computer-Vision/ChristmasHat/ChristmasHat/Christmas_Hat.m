function [hat_out]=Christmas_Hat(img,flag)
%
%to generate the image that have a Christmas hat
%img:original picture,you'd better to use the picture that contain the face
%hat_out:return the image, if detect the face,then the face will in your
%head, if not,the the head will in the middle of the image
%

reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end

detector = buildDetector();
[bbox,~,~,~] = detectFaceParts(detector,img,2);     %you can know where the faces are in bbox:
                                                    %bbox is a m*n matrix,
                                                    %m: the number of the face that detectd
                                                    %[bbox(:,1),bbox(:,2)]:coordinate of the Top left corner
                                                    %bbox(3):width of the detected face
                                                    %bbox(4):height of the detected face
                                                    %we only use these data in this function
                                                  
[img_height,img_width,~]=size(img);
if size(bbox,1)==0                                  %can't detect the face
    bb=[fix(img_width/2),fix(img_width/2),img_height/10,img_width/10];
else
    bb=bbox(:,1:4);
end
if(flag)                                            %load the hat
    hat_in=imread('hat/sdm_r.jpg');
else
    hat_in=imread('hat/sdm_g.jpg');
end

for k=1:size(bbox,1)
    img=add_hat(hat_in,img,bb(k,:),flag);           %add hat
end

imshow(img)
hat_out=img;

end