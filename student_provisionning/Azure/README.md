# Azure provisionning

## Prérequis
- Il faut au préalable avoir installé la CLI Azure 2.0 sur l'hôte :\
https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli?view=azure-cli-latest
- Il faut également avoir généré une paire de clés dédiée à la formation :\
`ssh-keygen`
- Ensuite adapter les paramètres dans le fichier `env.sh`

## Exécution
- Lancer le script `azure_provisionning.sh` pour provisionner les ressources sur Azure, le script `summary.sh` sera automatiquement exécuté.
- Lancer le script `summary.sh` à la demande pour voir le résumé de l'environnement

Exemple de résumé :
```
#######################################################
# Formation : LBN
# Formateur : Thomas (t.perelle@treeptik.fr)
# Cloud : Azure
# Groupe de ressources : Thomas-Form-LBN
#######################################################

Machines virtuelles :
LBN-student1-node0 52.233.129.74
LBN-student1-node1 52.233.194.61
LBN-student1-node2 52.178.64.114
LBN-student1-node3 52.233.195.40
```

## Connexion
Pour se connecter aux VM :\
`ssh -i [PRIVATE_KEY_PATH] student@[IP]`
