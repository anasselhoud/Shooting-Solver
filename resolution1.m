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
 
    [Z,Y]=ode45(@(z,y) fn(z,y,ci,Valpha(i),Ru), Z, BC(i,:));
    f = Y(end,1) ; % Valeur de W3 en z=10
    g = Y(end,2) ; % Valeur de la dérivée de W3 en z=10
    B=g+Valpha(i)*f;
    
    %méthode de point fixe (g+alpha*f=0)
    while abs(B)>eps

        [Z,Yp]=ode45(@(z,y) fn(z,y,ci+eps,Valpha(i),Ru), Z,BC(i,:));
        fp = Yp(end,1) ;
        gp = Yp(end,2) ;
        Bp=gp+Valpha(i)*fp;
        
        [Z,Ym]=ode45(@(z,y) fn(z,y,ci-eps,Valpha(i),Ru), Z, BC(i,:));
        
        fm =Ym(end,1);
        gm =Ym(end,2);
        Bm=gm+Valpha(i)*fm;
        
        Bpr=(Bp-Bm)/(2*eps);

        ci=ci - B/Bpr;
        
        [Z,Y]=ode45(@(z,y) fn(z,y,ci,Valpha(i),Ru), Z, BC(i,:));
        f=Y(end,1);
        g=Y(end,2);
        B=g+Valpha(i)*f;
    end
    
    Vci(i)=ci;
    AlphaC(1,i)=ci*Valpha(i);
    
    niter=i; %for number of iteration
end

fprintf('The convergence is achieved within %4.0f iteration \n',niter)



%Modele théorique
for i=1:length(Valpha)
    AlphaCth(i)=(Ru/2)*sqrt(exp(-4*Valpha(i))-(2*Valpha(i)-1)^2);
end


%plotting results
plot(Valpha,AlphaC,'-x','LineWidth',1)
xlabel('Alpha')
ylabel('Alpha*C')
hold on
plot(Valpha,AlphaCth,'LineWidth',1)
legend('Numérique','Théorique')


