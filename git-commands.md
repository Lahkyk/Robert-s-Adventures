# Useful git commands

## Pour démarrer un projet git dans un dossier existant
```bash
git init
```

## Pour cloner un repo existant (cas classique) :
```bash
git clone [url du repo]
```

## Pour cloner une seule branch du repo :
```bash
git clone [url du repo] --branch [nom de la branche] --single-branch
```

## Pour récupérer les derniers uploads sur le repo en ligne :
```bash
git pull
```

## Pour upload des fichiers dans un repo existant
### git add
- Un fichier: 
```bash
git add [nom du fichier]
```
- Tous les ajouts et les modifications
```bash
git add *
```
- Tous les ajouts, les modifications et les suppressions
```bash
git add -A
```

### git commit
Une fois les modifications selectionnées, on ajoute les modifications sur le repo local
```bash
git commit -m "[message du commit]"
```

### git push
Une fois les modifications locales faites (un ou plusieurs commits), on les push sur le repo en ligne
```bash
git push
```

Si le repo en ligne n'est pas défini, la console de git bash vous donnera normalement la commande à utiliser

## Faire une branche
```bash
git branch -b [nom de la branche]
```

## Supprimer une branche
- Localement
```bash
git branch -d [nom de la branche]
```

- Forcer la suppression locale
```bash
git branch -D [nom de la branche]
```

- Supprimer la branche en ligne
```bash
git push origin --delete [nom de la branche]
```

## Se déplacer sur une branche
```bash
git checkout [nom de la branche]
```

### Merge une branche
```bash
git checkout [nom de la branche sur laquelle on va merge]
git merge [nom de la branche à merge]
```

## Autres
[google it](https://www.google.com/)