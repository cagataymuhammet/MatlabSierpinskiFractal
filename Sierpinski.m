n=3;
is=10000;  % iterasyon sayısı
x_buz = [ 1/2 1/2 1/2]; % x buzulmesi
y_buz = x_buz;
olcek   = [ 1/2  0 ; 0 1/2];
oteleme = [ 1    0 ; 0 1 ];
dondurme = [ cosd(0) -sind(0) ; sind(0) cosd(0) ];
donme=[0 1/2 1/2*cosd(60); 0 0 1/2*sind(60)];

Map = zeros(2,2,n);
for i=1:n
   Map(:,:,i) = dondurme*oteleme*olcek;
end

boy = abs(x_buz.*y_buz);
en = boy/sum(boy);
top = cumsum(en);
x = zeros(2,is);
x(:,1) =[0;0] ;

for i = 2:is
u = ornek_uret(top);
x(:,i) = Map(:,:,u)*x(:,i-1) + donme(:,u);
end

plot(x(1,:),x(2,:),'b.','MarkerSize',0.1)
