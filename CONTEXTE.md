# CONTEXTE.md

## Projet
PPSA01289 Launcher — prototype de diagnostic et base de build CI.

## Cible déclarée
- Console : PS5
- Firmware communiqué : 13.20
- Environnement communiqué : etaHEN
- Poste de développement : Linux/Bazzite
- Objectif final décrit : une icône unique associée à PPSA01289, avec une image `.exfat` embarquée, et un lancement depuis le menu sans dépendance à ShadowMountPlus.

## État de la version
Prototype initial. Le code fourni vise un payload ELF de diagnostic. Aucun PKG installable n'est généré. Aucun montage d'image, enregistrement dans la bibliothèque ou lancement de jeu n'est implémenté.

## Décisions
- Utiliser `ps5-payload-dev/sdk` pour la cible ELF de diagnostic, pas la toolchain PS4 OpenOrbis.
- Ne pas inclure d'image de jeu ou de fichiers propriétaires dans Git.
- Le SDK de payload ne doit pas être présenté comme une chaîne complète de création d'application native PS5.
- La compatibilité avec le firmware 13.20 doit être vérifiée séparément.
- Le workflow GitHub Actions publie uniquement l'ELF de diagnostic.

## À faire
1. Vérifier le build CI avec la version actuelle du SDK amont.
2. Vérifier le format ELF obtenu et le tester uniquement dans un chargeur compatible.
3. Identifier une chaîne documentée de création de titre PS5 natif/PKG pour la cible.
4. Réévaluer le packaging après validation de la chaîne et des permissions disponibles.
