# cluster_docker

L'objectif est de provisionner l'environnement de travail de départ nécessaire au déroulement des formations officielles Docker.

Dans le cas présent on crée l'environnement sur la machine locale en utilisant Vagrant comme `provider` de VM (via VirtualBox) et Ansible comme `provisioner`.

*A noter qu'il faut que Ansible soit installé au préalable sur la machine locale*

Le cluster est constitué de 4 VM Ubuntu 16.04 :
- un master
- 3 nodes

## Création/Démarrage
Pour créer/démarrer l'environnement complet :
`vagrant up`

Pour créer/démarrer un seul noeud :
`vagrant up master/node[1-3]`

Pour vérifier l'état des VM :
`vagrant global-status`

### Inventaire
Un fichier d'inventaire Ansible est auto-généré à l'initialisation dans :
`.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory`

Voici son contenu :
```
# Generated by Vagrant
master ansible_ssh_host=127.0.0.1 ansible_ssh_port=2202 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='/Users/thomas/Dev/Vagrant/cluster_docker/.vagrant    /machines/master/virtualbox/private_key'
node1 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2222 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='/Users/thomas/Dev/Vagrant/cluster_docker/.vagrant/    machines/node1/virtualbox/private_key'
node2 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2200 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='/Users/thomas/Dev/Vagrant/cluster_docker/.vagrant/    machines/node2/virtualbox/private_key'
node3 ansible_ssh_host=127.0.0.1 ansible_ssh_port=2201 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='/Users/thomas/Dev/Vagrant/cluster_docker/.vagrant/    machines/node3/virtualbox/private_key'
```

## Configuration
Lors de la création des Vms, des playbooks Ansible sont appelés pour le provisionning.

### Provisionning commun
Le provisionning commun, appliqué sur l'ensemble des VM (node ou master), réalise les opérations suivantes :
* Création de l'utilisateur `student`
* Installation de `Docker` à partir des repo Docker (et non Ubuntu)
* Ajout de l'utilisateur `student` aux groupes `sudo` et `docker`

### Provisionning master
Le provisionning du master réalise les opérations suivantes :
* Installation de `Ansible`

## Arrêt
Pour arrêter l'environnement complet :
`vagrant destroy`

Pour arrêter un noeud :
`vagrant destroy master/node[1-3]`
