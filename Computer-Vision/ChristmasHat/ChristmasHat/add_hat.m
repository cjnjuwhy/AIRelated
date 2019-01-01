function [img]=add_hat(hat_in,img,bb,flag)
%
%add the Christmas Hat to the original image
%hat_in:hat image
%img:original img
%bb:a matrix that contains face information
%flag:red or green
%

[img_height,img_width,~]=size(img);

width_in=size(hat_in,2);
ratio=bb(3)/width_in;                           %calculate the scale ratio
hat=imresize(hat_in,ratio);                     %scale down the hat image to suit the face
[height,width,~]=size(hat);                     

if(bb(2)-height<0)                              %if the hat is too bog,add some pixel above
    I=zeros(height-bb(2)+img_height,img_width,3);
    I(height-bb(2)+1:end,:,:)=img;
    img=uint8(I);
    bb(2)=height;
end

if(flag)                                        %add red one
    for i=1:height-1
        for j=1:width-1
            if(hat(i,j,2)==20)                  %if the pixel is not in the hat,don't replace the pixel in original image
                continue
            else
                img(bb(2)-height+i,bb(1)+j,:)=hat(i,j,:);   %add the 'hat' the the head
            end
        end
    end
else
    for i=1:height-1
        for j=1:width-1
            if(hat(i,j,2)==20)
                continue
            else
                img(bb(2)-height+i,bb(1)+j,:)=hat(i,j,:);
            end
        end
    end
end


end