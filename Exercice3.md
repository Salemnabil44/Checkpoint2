### Q3.1 
Il s'agit d'un switch, également appelé commutateur réseau.  
Le switch connecte les ordinateurs PC1, PC2, PC3, PC4 et PC5, permettant la communication entre eux au sein du même réseau local (LAN).   
Il achemine les paquets de données entre les dispositifs connectés de manière efficace.   

### Q3.2
Il s'agit d'un routeur.   
l achemine les paquets de données entre différents réseaux. Pour le réseau 10.10.0.0/16, le routeur gère le trafic sortant et entrant, permettant aux machines du réseau local d'accéder à d'autres réseaux, y compris le réseau 172.16.5.0/24.    

### Q3.3   
Il s'agit des interfaces de connexion.   
f0/0 : Interface FastEthernet 0/0. Il s'agit d'une interface Ethernet avec une vitesse de 100 Mbps.   
g1/0 : Interface GigabitEthernet 1/0. Il s'agit d'une interface Ethernet avec une vitesse de 1 Gbps.   

### Q3.4
Il s'agit de son masque de sous réseau.   
/16 : Indique le préfixe de sous-réseau (ou le masque de sous-réseau), ce qui signifie que les 16 premiers bits de l'adresse IP représentent la partie réseau, cela correspond à un masque de sous-réseau de 255.255.0.0.   

### Q3.5
Il s'agit de la passerelle par défaut pour l'ordinateur PC2. C'est l'adresse IP de l'interface du routeur B connectée au réseau 10.10.0.0/16, permettant au PC2 de communiquer avec d'autres réseaux via ce routeur.   

### Q3.6
Pour les ordinateurs PC1, PC2, et PC5, donne :   

PC1 (10.10.4.1/16) :    
Adresse de réseau : 10.10.0.0   
Première adresse disponible : 10.10.0.1   
Dernière adresse disponible : 10.10.255.254   
Adresse de diffusion : 10.10.255.255   

PC2 (10.11.80.2/16) :     
Adresse de réseau : 10.11.0.0   
Première adresse disponible : 10.11.0.1   
Dernière adresse disponible : 10.11.255.254   
Adresse de diffusion : 10.11.255.255  

PC5 (10.10.4.7/15) :    
Adresse de réseau : 10.10.0.0   
Première adresse disponible : 10.10.0.1   
Dernière adresse disponible : 10.11.255.254   
Adresse de diffusion : 10.11.255.255   

### Q3.7
PC1 et PC4 peuvent communiquer entre eux directement car ils sont dans le même sous-réseau 10.10.0.0/16.   
PC2 et PC5 peuvent communiquer entre eux directement car le PC5 est en /15    
PC5 peut communiquer avec le PC1, PC2 et PC3 car son masque /15 couvre les plages de 10.10.0.0 à 10.11.255.255   

### Q3.8
Accès au réseau 172.16.5.0/24   
PC1, PC2, PC3, PC4 et PC5 : Tous les ordinateurs peuvent atteindre le réseau 172.16.5.0/24 via le routeur B, car ils sont connectés au même réseau local et peuvent utiliser la passerelle par défaut pour accéder aux autres réseaux.   

### Q3.9
Leur capacité à communiquer directement ne change pas puisque cela dépend de leurs adresses IP et masques de sous-réseau, pas de leurs ports physiques sur le switch.   

### Q3.10
Pour mettre la configuration IP des ordinateurs en dynamique, on peut utiliser le DHCP mais pour ça il faudrait ajouter un serveur DHCP.   

### Q3.11
L'adresse mac est la suivante MAC 00:50:79:66:68:00 on en déduit qu'il s'agit de l'ordinateur 1   

### Q3.12
la communication enregistrée dans cette capture a réussi elle se fait entre le PC1 mac 00:50:79:66:68:00 et le PC4 00:50:79:66:68:03   

### Q3.13
00:50:79:66:68:00 10.10.4.1 request PC1   
00:50:79:66:68:03 10.10.4.2 reply PC4   

### Q3.14
Il s'agit d'une encapsulation de type Ethernet , couche liaison du modèle OSI. Son rôle consiste à ajouter des en-têtes autour des données à transmettre pour former une trame Ethernet. Cette trame est ensuite envoyée à travers le réseau.   

### Q3.15
1.  le PC1 prépare un paquet IP à envoyer au PC4.      
2. L'interface réseau de l'ordinateur A encapsule ce paquet IP dans une trame Ethernet, en ajoutant les adresses MAC, le type de protocole (IPv4), etc.   
3. La trame Ethernet est transmise sur le réseau.   
4. L'interface réseau de l'ordinateur B reçoit la trame, vérifie l'intégrité des données avec le FCS, et décapsule les données pour extraire le paquet IP.   
5. Le paquet IP est ensuite traité par les couches supérieures du réseau de l'ordinateur B.

### Q3.16
c'est le PC3 son adresse ip est la 10.10.80.3   
