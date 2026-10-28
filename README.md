# PPSA01289 Launcher — prototype

Base de dépôt pour développer sous Linux/Bazzite autour de PPSA01289.

## État actuel — important

Cette version produit un **payload ELF de diagnostic**. Elle ne produit pas de PKG installable, ne monte aucune image `.exfat`, n'enregistre pas un jeu dans la bibliothèque PS5 et ne lance pas `eboot.bin`.

Le SDK public `ps5-payload-dev/sdk` sert à compiler des payloads ELF pour des chargeurs compatibles. Le SDK public PS5Dev indique également que sa chaîne actuelle ne construit pas encore à elle seule des applications PS5 natives complètes. Voir la documentation amont : <https://github.com/PS5Dev/PS5SDK>.

**État de la CI :** le workflow de compilation ELF et les contrôles CI ont réussi sur la branche `improve/build-artifacts` pour le commit `4d0eb3907d84b2cffd3507d0b9d1085a132d40bd`. Cela valide seulement la compilation de l'ELF de diagnostic, pas son exécution sur console ni la création d'un PKG.

La compatibilité avec le firmware PS5 13.20 et etaHEN reste à confirmer séparément. Aucun test matériel n'est revendiqué.

## Arborescence

- `src/main.c` — payload de diagnostic minimal.
- `Makefile` — compilation avec `ps5-payload-dev/sdk`.
- `.github/workflows/build-elf.yml` — compile l'ELF et publie l'artefact avec une empreinte SHA-256 et les métadonnées de build.
- `.github/workflows/ci.yml` — vérifications de source sur l'hôte.
- `assets/icon0.png` — icône provisoire de diagnostic, pas l'illustration officielle du jeu.
- `CLAUDE.md` et `CONTEXTE.md` — consignes et état du projet.

## Compilation locale sous Bazzite

Le plus simple est d'utiliser la distribution binaire du SDK public. Voir les instructions amont : <https://github.com/ps5-payload-dev/sdk>.

Dépendances usuelles sous Fedora/Bazzite (les noms peuvent varier selon l'image) :

```bash
sudo dnf install git make clang lld wget cmake meson pkgconf-pkg-config python3 python3-pyelftools unzip
```

Télécharge et installe le SDK depuis ses releases, puis décompresse-le sous `/opt/ps5-payload-sdk`. Exemple si tu as téléchargé l'archive officielle `ps5-payload-sdk.zip` :

```bash
sudo mkdir -p /opt/ps5-payload-sdk
sudo unzip ps5-payload-sdk.zip -d /opt/ps5-payload-sdk
export PS5_PAYLOAD_SDK=/opt/ps5-payload-sdk
make clean all
```

Si tu construis le SDK depuis les sources, suis la procédure amont et installe-le avec `make DESTDIR=/opt/ps5-payload-sdk install`. Le résultat attendu de ce dépôt est `build/ppsa01289-diagnostic.elf`.

> L'ELF est un payload pour un chargeur compatible, pas un fichier installable directement depuis l'écran d'accueil PS5.

## GitHub Actions

Le workflow `Build PS5 diagnostic ELF` se déclenche sur les pushes vers les branches ainsi que manuellement via **Actions → Build PS5 diagnostic ELF → Run workflow**. L'artefact contient l'ELF, `SHA256SUMS.txt` et `build-info.txt`. Les artefacts sont conservés pendant 14 jours.

## Chemin vers une application installable

Un PKG installable nécessite une chaîne distincte de création d'application native, de métadonnées de titre et de packaging. Le SDK de payload utilisé ici ne suffit pas à produire ce résultat. La prochaine étape est d'évaluer une chaîne publique, reproductible et compatible avec le firmware cible, puis de construire et valider une application homebrew de diagnostic avant d'envisager un paquet installable.

Le projet ne doit pas déclarer un PKG comme prêt tant qu'un artefact réel n'a pas été généré, inspecté et testé dans un environnement compatible. Le prototype actuel ne contient pas de moteur de montage d'image et ne lance aucun exécutable de jeu.

Ne place pas d'image de jeu, de dump, de `eboot.bin` ni de données propriétaires dans ce dépôt.

## Étapes suivantes

1. [x] Vérifier le workflow de compilation ELF et les contrôles CI sur la branche de développement.
2. [ ] Identifier et documenter une chaîne native homebrew/packaging publique et reproductible.
3. [ ] Remplacer le payload de diagnostic par une application homebrew autonome, avec une identité de titre dédiée et ses ressources.
4. [ ] Produire un artefact de packaging réel si la chaîne retenue le permet.
5. [ ] Inspecter l'artefact, documenter ses conditions d'installation et valider séparément le firmware cible.
