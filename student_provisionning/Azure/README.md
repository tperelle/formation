# Azure provisionning

## Prérequis
- Il faut au préalable avoir installé la CLI Azure 2.0 sur l'hôte :\
https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli?view=azure-cli-latest
- Il faut également avoir généré une paire de clés dédiée à la formation :\
`ssh-keygen`
- Ensuite adapter les paramètres dans le fichier `env.sh`

## Exécution
- Lancer le script `azure_provisionning.sh` pour provisionner les ressources sur Azure, le script `summary.sh` sera automatiquement exécuté.
- Lancer le script `summary.sh` à la demande pour voir le détail de l'environnement

## Connexion
Pour se connecter aux VM :\
`ssh -i [PRIVATE_KEY_PATH] student@[IP]`
