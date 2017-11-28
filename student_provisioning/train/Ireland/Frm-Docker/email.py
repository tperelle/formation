#!/usr/bin/env python
# -*- coding: utf-8 -*-

# prompts
subject = raw_input("Enter the 'Subject' for the outgoing message: ")

# static
body = """

Bonjour !

Bienvenu à cette formation Docker.

Vous trouverez ci-joint la liste des VM que j'ai provisionné pour vous avec le
couple de clés publique/privée qui vous permettra de vous connecter.

Enregistrez les clés où vous le souhaitez sur votre machine et positionnez les droits à 600 :
$ chmod 600 maClé.pem maClé.ppk

Utilisez la clé .pem pour vous connecter en SSH avec le compte centos :
$ ssh -i maClé.pem centos@monServeur

Testez rapidement l'accès à vos différentes VM pour que l'on puisse détecter
au plus tôt tout éventuel problème.

Si vous rencontrez le moindre soucis, je reste à votre disposition.

"""
