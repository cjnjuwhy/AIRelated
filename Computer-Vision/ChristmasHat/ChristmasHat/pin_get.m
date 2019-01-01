function img=pin_get(img)
%
%add the head by choosing the district by yourself
%img:original image
%flag:red one or green one
%

hat=imread('hat\sdm_r.jpg');          %you can choose the hat 
imshow(img);
point=ginput();                       %get two points:first click the top left corner 
                                      %and then click the lower right corner
                                      %last knock 'Enter'
bb=zeros(4);
bb(1)=fix(point(1,1));                %get bb matrix
bb(2)=fix(point(1,2));
bb(4)=fix(point(2,2)-point(1,2));
bb(3)=fix(point(2,1)-point(1,1));

img=add_hat(hat,img,bb,1);
imshow(img)
end
