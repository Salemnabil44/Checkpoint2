### Q2.1
1er étape : création du dossier Scripts > New-Item -ItemType Directory -Path "C:\Scripts"
2ème étape : Copier les fichiers à partir du serveur > copy-item -path "\\WINSERV\C:\Scripts\*" -destination "C:\Scripts" -recurse
Après avoir  tester l'accès avec la commande Test-Path : Test-Path "\\WINSERV\C:\Scripts\"
J'ai une sortie False, cela signifie que le chemin n'est pas accessible. Désolé mais je ne vois pas comment récuperer les dossiers sans accéder au serveur et sans le manipuler.

### Q2.5
le premier utilisateur n'est pas pris en compte car la gestion de la première ligne du fichier CSV n'est pas bonne. Il faut s'assurer que la lecture du fichier CSV commence correctement sans sauter la première ligne.

### Q2.6
Le champ Description est importé du fichier CSV mais n'est pas utilisé.
Modification :
Ajout de $Description = $user.description et utilisation du champ lors de la création des utilisateurs.

### Q2.7 
Pour importer uniquement les champes nécessaires, voilà les modifications à apporter au script
$users = Import-Csv -Path "Users.csv" -Delimiter ';' | Select-Object prenom, nom, description, mail, scriptPath

### Q2.8
Afficher un message coloré après la création de l'utilisateur 
Write-Host "Le compte $Name a été créé avec le mot de passe $Password" -ForegroundColor Green

### Q2.9

### Q2.10
Afficher un message coloré si l'utilisateur existe déjà 
if ($existingUser) {
    Write-Host "Le compte $Name existe déjà" -ForegroundColor Red
    Log -Message "Le compte $Name existe déjà"
    continue
}

### Q2.11
Correction : Add-LocalGroupMember -Group "Users" -Member $Name

### Q2.12
Variable : $Name = "$Prenom.$Nom"

### Q2.13
Les comptes utilisateurs ont un mot de passe qui expire
New-LocalUser -Name $Name -Password (ConvertTo-SecureString $Password -AsPlainText -Force) -Description $Description -PasswordNeverExpires

### Q2.14
Modifier la génération du mot de passe pour qu'il soit de 12 caractères 
$Password = [System.Web.Security.Membership]::GeneratePassword(12, 2)

### Q2.15
Remplacer le temps d'attente par une pause
Write-Host "Appuyez sur Entrée pour terminer..."
[void][System.Console]::ReadLine()

### Q2.16
Cette fonction est utilisée pour standardiser les noms en supprimant les accents et en appliquant une capitalisation correcte.

### Script modifié :

# Lignes ajoutées/modifiées

# Import-CSV avec seulement les champs nécessaires et en tenant compte de l'encodage
$users = Import-Csv -Path "Users.csv" -Delimiter ';' | Select-Object prenom, nom, description, mail, scriptPath

foreach ($user in $users) {
    $Prenom = $user.prenom
    $Nom = $user.nom
    $Description = $user.description
    $Mail = $user.mail
    $ScriptPath = $user.scriptPath
    $Name = "$Prenom.$Nom"  # Ligne ajoutée

    # Vérifier si l'utilisateur existe déjà
    $existingUser = Get-LocalUser -Name $Name -ErrorAction SilentlyContinue
    if ($existingUser) {
        Write-Host "Le compte $Name existe déjà" -ForegroundColor Red  # Ligne ajoutée
        Log -Message "Le compte $Name existe déjà"  # Ligne ajoutée
        continue
    }

    # Générer un mot de passe de 12 caractères
    $Password = [System.Web.Security.Membership]::GeneratePassword(12, 2)  # Ligne modifiée
    
    # Créer le compte utilisateur
    New-LocalUser -Name $Name -Password (ConvertTo-SecureString $Password -AsPlainText -Force) -Description $Description -PasswordNeverExpires  # Ligne modifiée

    # Ajouter l'utilisateur au groupe des utilisateurs locaux
    Add-LocalGroupMember -Group "Users" -Member $Name  # Ligne modifiée

    # Afficher un message de succès avec le mot de passe
    Write-Host "Le compte $Name a été créé avec le mot de passe $Password" -ForegroundColor Green  # Ligne ajoutée
    
    # Utiliser la fonction Log pour enregistrer l'activité
    Log -Message "Le compte $Name a été créé avec le mot de passe $Password"  # Ligne ajoutée
}

# Pause à la fin de l'exécution
Write-Host "Appuyez sur Entrée pour terminer..."  # Ligne ajoutée
[void][System.Console]::ReadLine()  # Ligne ajoutée









 
