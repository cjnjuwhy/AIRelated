function begin
flag=1;                                          %1:red hat,0:green hat
x=input('type the number of the picture:','s');
ImagePath=['in\',x,'.jpg'];                      % the number of the picture
why=Christmas_Hat(imread(ImagePath),flag);       %add the hat automatically
%why=pin_get(imread(ImagePath));            %add the hat by choosing the points
imwrite(why,['out\',x,'.jpg'])