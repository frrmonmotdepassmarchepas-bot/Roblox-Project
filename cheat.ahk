#Requires AutoHotkey v2.0
#SingleInstance Force

; Variable pour mesurer le temps entre les clics
DernierClic := 0

; On vérifie si Roblox est ouvert.
if !WinExist("ahk_exe RobloxPlayerBeta.exe") {
    MsgBox("Ce panneau de contrôle est conçu exclusivement pour être utilisé avec Roblox.`nVeuillez lancer Roblox d'abord !", "Erreur de compatibilité", "IconX")
    ExitApp
}

; Création de la fausse interface de triche
MonPanneau := Gui("-MaximizeBox -MinimizeBox", "Roblox Multi-Hack Menu v4.4")
MonPanneau.BackColor := "1A1A1A" ; Fond noir gaming

; En-tête
MonPanneau.SetFont("s14 w700 cFF3333", "Segoe UI") ; Texte Rouge
Titre := MonPanneau.AddText("w300 Center", "🔴 CHEAT MENU (ROBLOX) 🔴")

MonPanneau.SetFont("s9 w400 c888888", "Segoe UI")
SousTitre := MonPanneau.AddText("w300 Center y+2", "Statut : Connecté au processus Roblox")

; Boutons
MonPanneau.SetFont("s11 w600 cFFFFFF", "Segoe UI")
MonPanneau.AddGroupBox("w280 h150 xm y+20", " Options disponibles ")
BtnFly := MonPanneau.AddButton("xp+15 yp+30 w250 h40", "Activer le FLY MODE")
BtnAim := MonPanneau.AddButton("xp yp+55 w250 h40", "Activer l'AIMBOT")

; On gère les clics avec notre système personnalisé plus sensible
BtnFly.OnEvent("Click", GérerLeClic)
BtnAim.OnEvent("Click", GérerLeClic)

; Affichage de la fenêtre
MonPanneau.Show("w300 h240")

; Système intelligent qui différencie le clic normal du spam
GérerLeClic(btn, *) {
    global DernierClic
    Maintenant := A_TickCount ; Récupère le temps actuel en millisecondes
    
    ; Si le temps entre ce clic et le précédent est inférieur à 500ms (demi-seconde)
    if (Maintenant - DernierClic < 500) {
        DoubleClicTriche()
    } else {
        ; Sinon, c'est un simple clic normal
        SoundPlay("*16") ; Son d'erreur
        MsgBox("Hé non ! C'est pas bien de tricher ! 😉", "Anti-Cheat System", "Iconi")
    }
    
    DernierClic := Maintenant ; On enregistre le temps de ce clic
}

; La grosse blague du forçage
DoubleClicTriche() {
    ; Changement d'ambiance visuelle : le panneau passe en mode "alerte" jaune
    MonPanneau.BackColor := "332200"
    Titre.Opt("cFFFF00") ; Correction ici : .Opt au lieu de SetOptions pour le jaune !
    Titre.Text := "⚠️ INJECTION EN COURS... ⚠️"
    SousTitre.Text := "Forçage des protocoles de sécurité..."
    
    SoundPlay("*64") ; Son d'information de Windows
    Sleep(800) ; Petite pause pour le suspense
    
    ; Deuxième bip de confirmation
    SoundPlay("*48") 
    Sleep(600)
    
    ; Message final
    MsgBox("Dis donc, tu forces trop ! 😂`n`nTu as cru que ça allait marcher ? Même pour 2 secondes, l'anti-triche ne lâche rien !", "Système Anti-Forçage", "IconX")
    
    ; Remise à zéro de l'interface après le message
    MonPanneau.BackColor := "1A1A1A"
    Titre.Opt("cFF3333") ; Correction ici : .Opt au lieu de SetOptions pour le rouge !
    Titre.Text := "🔴 CHEAT MENU (ROBLOX) 🔴"
    SousTitre.Text := "Statut : Connecté au processus Roblox"
}
