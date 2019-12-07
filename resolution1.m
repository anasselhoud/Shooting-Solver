%Données
Valpha=linspace(0.06,0.9,40); %valeurs de alpha
Vci=zeros(1,length(Valpha)); %valeurs de ci
AlphaC=zeros(1,length(Valpha)); %valeurs de alpha*ci
ci=0.91; %valeur initial de alpha (par le modèle approché)
eps=0.0001; %epsilon pour la méthode de newton
Ru=1;


%Discrétisation du domaine (maillage)
zmin=-10;
zmax=10;
p=0.01; %pas de discrétisation
z=[zmin:p:zmax];

%conditions aux limites
Z=[zmin zmax];
BC=[ones(1,length(A)),]


%résolution 
for i=1:length(A)
    
    
    
    B=g+Valpha(i)*f;
    %méthode de point fixe (g+alpha*f=0)
    while abs(B)>eps 
        
        
        c=c-B/Bp;
        f=;
        g=:
        B=g+Valpha(i)*f;
    end
    
    Vci(i)=c;
    AlphaC=c*Valpha(i)
    
end


%plotting results

