p1 = [0;1;0;1;1;1;0;1;0];
p2 = [0;1;0;1;1;1;0;1;0];
p3 = [0;1;0;1;1;1;1;0;0];
x1 = [1;0;1;0;1;0;1;0;1];
x2 = [1;0;0;0;1;0;1;0;1];
x3 = [1;0;1;0;1;0;1;0;1];

t1 = [0;1;1;1;1;1;0;1;0];
t2 = [1;0;1;0;1;0;1;1;1];

I = eye(9);

Cp = [p1,p2,p3];
Cx = [x1,x2,x3];

[Up,Sp,Vp] = svd(Cp);
[Ux,Sx,Vx] = svd(Cx);

Up1 = [Up(:,1),Up(:,2)];
Ux1 = [Ux(:,1),Ux(:,2)];

Upt =transpose(Up1);
Uxt =transpose(Ux1);

Up2 = Up1*Upt;
Ux2 = Ux1*Uxt;

t1p = norm( (I-Up2)*t1 );
t1x = norm( (I-Ux2)*t1 );

if t1p < t1x
    text = sprintf('plus test image:\nnorm Plus class = %.2f, norm X class = %.2f\nclassify as Plus\n',t1p,t1x);
else
    text = sprintf('plus test image:\nnorm Plus class = %.2f, norm X class = %.2f\nclassify as X\n',t1p,t1x);
end
disp(text);

t2p = norm( (I-Up2)*t2 );
t2x = norm( (I-Ux2)*t2 );

if t2p < t2x
    text = sprintf('X test image:\nnorm Plus class = %.2f, norm X class = %.2f\nclassify as Plus\n',t2p,t2x);    
else
    text = sprintf('X test image:\nnorm Plus class = %.2f, norm X class = %.2f\nclassify as X\n',t2p,t2x);
end
disp(text);