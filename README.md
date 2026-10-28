# PPSA01289 Launcher — prototype

Base de dépôt pour développer sous Linux/Bazzite autour de PPSA01289.

## État actuel — important

Cette version est un **payload ELF de diagnostic**. Elle ne produit pas un PKG installable, ne monte aucune image `.exfat`, n'enregistre pas un jeu dans la bibliothèque PS5 et ne lance pas `eboot.bin`.

Le SDK public `ps5-payload-dev/sdk` sert à compiler des payloads ELF pour des chargeurs compatibles. Il ne fournit pas à lui seul une chaîne complète pour construire une application PS5 native installable avec une icône sur l'accueil. La compatibilité avec le firmware PS5 13.20 et etaHEN doit être confirmée séparément.

Le moteur de montage autonome n'est pas implémenté dans ce prototype. Cette base permet de vérifier la chaîne de build et d'avoir un workflow GitHub Actions reproductible sans prétendre qu'un ELF de payload est un PKG.

## Arborescence

- `src/main.c` — payload de diagnostic minimal.
- `Makefile` — compilation avec `ps5-payload-dev/sdk`.
- `.github/workflows/build-elf.yml` — compile et publie l'ELF comme artefact.
- `.github/workflows/ci.yml` — vérifications de source sur l'hôte.
- `assets/icon0.png` — icône provisoire de diagnostic, pas l'illustration officielle du jeu.
- `CLAUDE.md` et `CONTEXTE.md` — consignes et état du projet.

## Compilation locale sous Bazzite

Le plus simple est d'utiliser la distribution binaire du SDK public. Voir les instructions amont : <https://github.com/ps5-payload-dev/sdk>.

Dépendances usuelles sous Fedora/Bazzite (les noms peuvent varier selon l'image) :

```bash
sudo dnf install git make clang lld wget cmake meson pkgconf-pkg-config python3 python3-pyelftools unzip
```

Télécharger et installer le SDK depuis ses releases, puis décompresser sous `/opt/ps5-payload-sdk`. Exemple si tu as téléchargé l'archive officielle `ps5-payload-sdk.zip` :

```bash
sudo mkdir -p /opt/ps5-payload-sdk
sudo unzip ps5-payload-sdk.zip -d /opt/ps5-payload-sdk
export PS5_PAYLOAD_SDK=/opt/ps5-payload-sdk
make clean all
```

Si tu construis le SDK depuis les sources, suis la procédure amont et installe-le avec `make DESTDIR=/opt/ps5-payload-sdk install`. Le résultat attendu de ce dépôt est `build/ppsa01289-diagnostic.elf`.

> L'ELF est un payload pour un chargeur compatible, pas un fichier que l'on peut installer directement depuis l'écran d'accueil PS5.

## GitHub Actions

Le workflow `Build PS5 diagnostic ELF` se déclenche sur un push vers `main` ou manuellement via **Actions → Build PS5 diagnostic ELF → Run workflow**. L'ELF est publié comme artefact de workflow pour 14 jours.

Pour créer un dépôt GitHub, crée un dépôt vide nommé `PPSA01289-Launcher-Prototype`, puis depuis ce dossier :

```bash
git init
git add .
git commit -m "Initial PS5 diagnostic prototype"
git branch -M main
git remote add origin https://github.com/TON_COMPTE/PPSA01289-Launcher-Prototype.git
git push -u origin main
```

Remplace `TON_COMPTE` par ton identifiant GitHub.

## Étapes de développement suivantes

1. Vérifier que le workflow amont compile toujours sur le runner choisi.
2. Tester l'ELF uniquement dans un chargeur compatible et documenté.
3. Identifier une chaîne publique et documentée de création d'application PS5 native/PKG pour la cible.
4. Vérifier séparément les capacités de l'environnement etaHEN sur le firmware annoncé.
5. Réévaluer le packaging et le lancement uniquement après ces validations.

Ne place pas d'image de jeu, de dump, de `eboot.bin` ni de données propriétaires dans ce dépôt.
