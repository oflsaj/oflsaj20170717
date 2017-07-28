I = imread('kadai1.jpg');
I = rgb2gray(I);

Icorrected = imtophat(I, strel('disk', 15));

BW1 = imbinarize(Icorrected);

figure;
imshowpair(Icorrected, BW1, 'montage');

results = ocr(BW1, 'CharacterSet', '0123456789', 'TextLayout','Block');

results.Text
regularExpr = '\d';

bboxes = locateText(results, regularExpr, 'UseRegexp', true);

digits = regexp(results.Text, regularExpr, 'match');

Idigits = insertObjectAnnotation(I, 'rectangle', bboxes, digits);

figure;
imshow(Idigits);

