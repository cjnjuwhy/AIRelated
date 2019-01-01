%demo to detect the face, eyes, nose and the mouth
reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end

img = imread('in\1.jpg');

detector = buildDetector();
[bbox bbimg faces bbfaces] = detectFaceParts(detector,img,2);

figure;imshow(bbimg);
for i=1:size(bbfaces,1)
 figure;imshow(bbfaces{i});
end
