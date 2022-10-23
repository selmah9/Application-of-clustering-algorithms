function [CENTS, DAL] = km_fun(F, K, N)
CENTS = F( ceil(rand(K,1)*size(F,1)) ,:);              % Centar klastera
DAL   = zeros(size(F,1),K+2);                          % Udaljenost
for n = 1:N
        
   for i = 1:size(F,1)
      for j = 1:K  
        DAL(i,j) = norm(F(i,:) - CENTS(j,:));      
      end
      [Distance, CN] = min(DAL(i,1:K));                % 1:K su udaljenosti od centra klastera 1:K 
      DAL(i,K+1) = CN;                                 % K+1 je oznaka klastera
      DAL(i,K+2) = Distance;                           % K+2 je minimalna distanca
   end
   for i = 1:K
      A = (DAL(:,K+1) == i);                          
      CENTS(i,:) = mean(F(A,:));                       % Novi centri klastera
      if sum(isnan(CENTS(:))) ~= 0                     % Za CENTS(i,:) zamijeni sa random ta?nom 
         NC = find(isnan(CENTS(:,1)) == 1);            
         for Ind = 1:size(NC,1)
         CENTS(NC(Ind),:) = F(randi(size(F,1)),:);
         end
      end
   end
end
end

