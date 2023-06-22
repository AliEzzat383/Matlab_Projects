loc_x=[70,70,70,70,70,70,70,70,70];
loc_y=[60,61,62,63,64,65,66,67,68];

mat_r = zeros(100,100);
mat_g = zeros(100,100);
mat_b = zeros(100,100);
update_snake(loc_x,loc_y)
imshow(cat(3,mat_r,mat_g,mat_b));

function update_snake(loc_x,loc_y)
    mat_r(loc_x(1),loc_y(1))=0;
    mat_g(loc_x(1),loc_y(1))=0;
    mat_b(loc_x(1),loc_y(1))=225;

    for i=2:length(loc_x)
        mat_r(loc_x(i),loc_y(i))=0;
        mat_g(loc_x(i),loc_y(i))=225;
        mat_b(loc_x(i),loc_y(i))=0;
    end
end



