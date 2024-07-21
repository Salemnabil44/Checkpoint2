## Q1.1 
Pour commencer nous allons vérifier les adresses ipv4 sur le Serveur et sur le cient Windows avec la commande ipconfig.     
Adresse Serveur 172.16.10.10/24    
Adresse Client 171.16.100.50/24    
à partir du serveur nous allons ouvrir le terminal powershell et taper la commande "ping 172.16.10.10"    
Le message suivant s'affiche "PING: transmit failed. General Failure" cela indique un problème de connectivité réseau au niveau du serveur.    

Pour modifier l'adresse ipv4 nous allons taper la commande suivante "netsh interface ipv4 set address name="Ethernet" static 175.16.10.11  255.255.255.0 none"
On vérifie bien que l'adresse statique a été changé avec la commande "ip config"     

## Q1.2
à partir du terminal nous lançons la commande Ping Client1

le résultat qui s'affiche est le suivant:

Reply from fe80:d4ce:8d4d:fdb%6: time<1ms        
Reply from fe80:d4ce:8d4d:fdb%6: time<1ms      
Reply from fe80:d4ce:8d4d:fdb%6: time<1ms       
Reply from fe80:d4ce:8d4d:fdb%6: time<1ms 

Ping statistics for fe80:d4ce:8d4d:fdb%6:     
   Packets: sent = 4, Received = 4, Lost = 0 (0% loss),       
 Approximate rount trip times in milli-seconds:        
   Minimum = 0ms, Maximum = 1ms, Average = 0ms         

 Le résultat que vous voyez indique que le ping a été effectué avec succès, mais il utilise des adresses IPv6 au lieu d'adresses IPv4. 
 nous allons nous assurer que nous pouvons pinguer en utilisant IPv4 en tapant la commande ping 175.16.10.11
 le résultat qui s'affiche est le suivant:

 Pinging 172.16.10.11 with 32 bytes of date:
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   

  Ping statistics for 172.16.10.11:   
     Packets: sent = 4, Received = 4, Lost = 0 (0% loss),   
  Approximate rount trip times in milli-seconds:   
     Minimum = 0ms, Maximum = 1ms, Average = 0ms   

Le résultat  montre un ping réussi vers l'adresse IPv4 172.16.10.11   

### Q1.3
Pour changer j'ai désactivé l'ipv6 en utilisant l'interface graphique.   
Panneau de configuration > Réseau et Internet > Centre Réseau et partage ensuite cliquez sur Modifier les paramètres de la carte, puis clique droit sur Ethernet > Propriétés et déselectionnez Protocole Internet version 6 (TCP/Ipv6)   

Depuis le serveur on lance la commande ping Client1   
le résultat qui s'affiche est le suivant:   

 Pinging 172.16.10.11 with 32 bytes of date:   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128  
  Reply from 172.16.10.11: bytes=32 time<1ms TTL=128   

  Ping statistics for 172.16.10.11:   
     Packets: sent = 4, Received = 4, Lost = 0 (0% loss),   
  Approximate rount trip times in milli-seconds:   
     Minimum = 0ms, Maximum = 1ms, Average = 0ms   

Je n'ai eu aucune modification à apporter le ping fonctionne.   

### Q1.4
Pour configurer l'adressage automatique en dhcp j'ai modifié les paramètres sur le client en mode GUI.  
Panneau de configuration > Réseau et Internet > Centre Réseau et partage ensuite cliquez sur Modifier les paramètres de la carte, puis clique droit sur Ethernet > Propriétés et double cliquer sur Protocole Internet version 4 (TCP/Ipv4) puis cliquer sur Obtenir une adresse IP automatiquement.   

Par curiosité j'ai été sur le serveur et depuis le terminal j'ai fait un ping Client1, et sans avoir configuré le DHCP sur le serveur je me suis rendu compte que le ping fonctionnait et que le Client1 s'était vu attribué l'adresse 175.15.10.20    
Après avoir été sur Server Manager, je me suis rendu compte que le dhcp était déjà mis en place.   

### Q1.5
La première adresse IP d'un sous-réseau est appelée l'adresse de réseau (network address). Cette adresse est utilisée pour identifier le sous-réseau lui-même. c'est pour ça que le serveur DHCP ne le lui a pas donné cette adresse.
l'adresse ip qui a été attribué au client est la 175.15.10.20

### Q1.6

Pour que le client ait l'adresse 175.15.10.15, nous allons créer une reservation sur le serveur Dhcp. 
Nous allons nous connecter sur le server, à partir du Server Manager, nous allons cliquer sur DHCP.
Sur la fenetre principale nous allons cliquer droit sur WINSERV et cliquer sur DHCP Manager.

<img width="1408" alt="1" src="https://github.com/user-attachments/assets/ea30d8f0-1c7b-445b-812c-3e2d994ef81a">

Une fois la fenêtre DHCP ouverte, à droite on va cliquer sur DHCP > WINSERV > IPv4 > Scope 172.16.10.0 vlan 10 > réservations

<img width="863" alt="2" src="https://github.com/user-attachments/assets/a5e25df5-2951-4c6b-94bd-d815659ec51a">

à droite on va cliquer sur Reservations > more actions > New reservation 
On remplire le nom du client, l'adresse ip qu'on souhaite lui donner, et son adresse mac.
<img width="861" alt="3" src="https://github.com/user-attachments/assets/130a235c-ffd7-4fd0-b122-db0a91ae6fd8">

Une fois l'opération réalisée, on redémarre le serveur et le client et on peux vérifier que le client s'est bien vu donner l'adresse souhaitée
en ouvrant le terminal et en tapant la commande ipconfig /all et sur le serveur en tapant la commande arp -a
<img width="743" alt="4" src="https://github.com/user-attachments/assets/734f7ec5-32d2-4eb9-bf95-999ad00c59be">

<img width="631" alt="5" src="https://github.com/user-attachments/assets/12315939-c253-4e94-901c-c8c6f0160928">

### Q1.7
l'intérêt de passer le réseau en ipv6 sont les suivants : 
- Un espace d'sdresse IP plus étendus
- une simplification de la gestion du réseau, IPv6 facilite la gestion du réseau grâce à ses fonctionnalités d'autoconfiguration et de routage simplifié.
- IPv6 intègre des mécanismes de sécurité plus robustes.
- Efficacité et performance, IPv6 offre une meilleure performance réseau grâce à des en-têtes simplifiés et des mécanismes de routage plus efficaces.
Conclusion : Adopter IPv6 prépare également les réseaux à gérer la croissance future des dispositifs connectés et des applications modernes, garantissant une connectivité robuste et évolutive.

### Q1.8
Non, le serveur DHCP n'est pas obsolète, il suffit juste de configurer le serveur pour activer DHCPv6

Ouvrir le DHCP Manager :

Ouvrez Server Manager.
Cliquez sur Tools et sélectionnez DHCP pour ouvrir le DHCP Manager.
Configurer un Nouveau Scope IPv6 :

Dans le DHCP Manager, développez votre serveur DHCP.
Faites un clic droit sur IPv6 et sélectionnez New Scope.
Créer un Scope DHCPv6 :

Name and Description : Donnez un nom et une description au nouveau scope.
Prefix : Définissez le préfixe IPv6 que vous souhaitez utiliser (par exemple, 2001:db8::/64).
Preference : Définissez la préférence pour les adresses attribuées.
Valid Lifetime et Preferred Lifetime : Définissez la durée de vie des adresses assignées.
Configurer les Options DHCPv6 :

DNS Servers : Spécifiez les serveurs DNS que les clients IPv6 doivent utiliser.
Other Options : Configurez d'autres options selon vos besoins, comme les informations de serveur NTP, les options de gestion des équipements, etc.
Activer le Scope DHCPv6 :

Une fois la configuration terminée, suivez les instructions pour activer le scope.








