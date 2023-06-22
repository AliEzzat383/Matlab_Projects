r=0 ; b=200 ; g=25;
mat_r = r*ones(10,10);
mat_g = g*ones(10,10);
mat_b = b*ones(10,10);
img=cat(3,mat_r,mat_g,mat_b);
subimage(uint8(img));