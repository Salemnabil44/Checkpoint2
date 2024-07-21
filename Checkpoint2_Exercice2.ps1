# Importer le module Functions.psm1
Import-Module .\Functions.psm1

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
