## Q1.1 
Pour commencer nous allons vérifier les adresses ipv4 sur le Serveur et sur le cient Windows avec la commande ipconfig.
Adresse Serveur 172.16.10.10/24
Adresse Client 171.16.100.50/24
à partir du serveur nous allons ouvrir le terminal powershell et taper la commande "ping 172.16.10.10"
Le message suivant s'affiche "PING: transmit failed. General Failure" cela indique un problème de connectivité réseau au niveau du serveur.

Pour modifier l'adresse ipv4 nous allons taper la commande suivante "netsh interface ipv4 set address name="Ethernet" static 175.16.10.11 255.255.255.0 none"
On vérifié bien que l'adresse statique a été changé avec la commande "ip config"

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

 "Pinging 172.16.10.11 with 32 bytes of date:
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

 "Pinging 172.16.10.11 with 32 bytes of date:
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
Pour configurer l'adressage automatique en dhcp j'ai modifié les paramètres sur le client.
Panneau de configuration > Réseau et Internet > Centre Réseau et partage ensuite cliquez sur Modifier les paramètres de la carte, puis clique droit sur Ethernet > Propriétés et double cliquer sur Protocole Internet version 4 (TCP/Ipv4) puis cliquer sur Obtenir une adresse IP automatiquement.
Par curiosité j'ai été sur le serveur et depuis le terminal j'ai fait un ping Client1, et sans avoir configuré le DHCP sur le serveur je me suis rendu compte que le ping fonctionnait et que le Client1 s'était vu attribué l'adresse 175.15.10.20  
Après avoir été sur Server Manager, je me suis rendu compte que le dhcp était déjà mis en place.

### Q1.5

