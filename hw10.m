data = [ 2, 2; 
         4, 2; 
         3, 3; 
         5, 3; 
         6, 3; 
         4, 4; 
         5, 4; 
         7, 4; 
         5, 5; 
         6, 5; 
         7, 6];
     meanY = 0;
     meanX = 0;
     
     for n = 1:11
         meanX = meanX + data(n,1);
         meanY = meanY + data(n,2);
         
     end
     meanX = meanX/11;
     meanY = meanY/11;
     
     s = data;
     for n = 1:11
         s(n,1) = data(n,1)-meanX;
         s(n,2) = data(n,2)-meanY;
     end
     st = transpose(s);
     q = st*s;
     
     [V,D,W] = eig(q);
     x = [0 0];
     disp(s);

     qx = q(:,1);
     qy = q(:,2);
     
     plot(s(:,1),s(:,2),'.');
     hold on;
     plot([0 V(1,2)],[0 V(2,2)]);
     
     hold off;
     



     
     