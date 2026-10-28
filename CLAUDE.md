# Instructions pour Claude Code

- Lire `CONTEXTE.md` avant toute modification.
- Cible évoquée : PS5, etaHEN, firmware communiqué 13.20, développement Linux/Bazzite.
- Ne jamais annoncer qu'un ELF de payload est un PKG installable.
- Ne jamais affirmer la compatibilité avec le firmware 13.20 sans documentation ou test vérifiable.
- Garder les builds reproductibles et faire échouer le workflow en cas d'erreur.
- Ne pas ajouter d'image de jeu, de `eboot.bin`, de dump `.exfat` ou de données propriétaires au dépôt.
- Le prototype actuel reste limité au diagnostic : pas de montage d'image, pas de modification noyau, pas d'enregistrement de jeu et pas de lancement de titre.
- Mettre à jour `CONTEXTE.md` et le README quand l'état ou les limites changent.
