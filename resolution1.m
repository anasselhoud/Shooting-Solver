clc
clear

%Données
Valpha=linspace(0.06,0.9,41); %valeurs de alpha
Vci=zeros(1,length(Valpha)); %valeurs de ci
AlphaC=zeros(1,length(Valpha)); %valeurs de alpha*ci
ci=0.91; %valeur initial de alpha (par le modèle approché)
eps=0.00000001; %epsilon pour la méthode de newton
Ru=1;


%Discrétisation du domaine (maillage)
zmin=-10;
zmax=10;
p=0.01; %pas de discrétisation
z1=[zmin:p:zmax];

%conditions aux limites
Z=[zmin zmax];
BC=[ones(length(Valpha),1),Valpha'];


%résolution 
for i=1:length(Valpha)
    a=Valpha(i);
    IC = [1 a];
    [Z,Y]=ode45(@(z,y) fn(z,y,ci,Valpha(i),Ru), Z, IC); %BC(i,:));
    f = Y(length(Z),1) ; % Valeur de W3 en z=10
    g = Y(length(Z),2) ; % Valeur de la dérivée de W3 en z=10
    B=g+Valpha(i)*f;
    
    %méthode de point fixe (g+alpha*f=0)
    while abs(B)>0.00000001

        [Z,Yp]=ode45(@(z,y) fn(z,y,ci+eps,Valpha(i),Ru), Z,IC); %BC(i,:));
        
        fp = Yp(length(Z),1) ;
        gp = Yp(length(Z),2) ;
        Bp=gp+Valpha(i)*fp;
        
        [Z,Ym]=ode45(@(z,y) fn(z,y,ci-eps,Valpha(i),Ru), Z, IC); %BC(i,:));
        
        fm =Ym(length(Z),1);
        gm =Ym(length(Z),2);
        Bm=gm+Valpha(i)*fm;
        
        Bpr=(Bp-Bm)/(2*eps);

        ci=ci - B/Bpr;
        
        [Z,Y]=ode45(@(z,y) fn(z,y,ci,Valpha(i),Ru), Z, IC); %BC(i,:));
        f=Y(length(Z),1);
        g=Y(length(Z),2);
        B=g+Valpha(i)*f;
    end
    
    Vci(i)=ci;
    AlphaC(1,i)=ci*Valpha(i);
    
    if ci*Valpha(i)<0.05
        break
    end
    
    niter=i;
end

fprintf('The converengece is reached whithin %6.0f iteration /n',niter)

%plotting results
plot(Valpha,AlphaC,'-x')


