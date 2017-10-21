#!/bin/bash

cat >./data.ldif <<EOL
dn: ou=Groups, dc=example,dc=org
objectclass: top
objectclass: organizationalunit
ou: Groups

dn: ou=Staff, dc=example,dc=org
objectclass: top
objectclass: organizationalunit
ou: Staff

dn: cn=Alex Alpha ,ou=Staff,dc=example,dc=org
cn: Alex Alpha
sn: Alpha
givenname: Alex
objectclass: inetOrgPerson
uid: alpha
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=Brooklyn Bravo,ou=Staff,dc=example,dc=org
cn: Brooklyn Bravo
sn: Bravo
givenname: Brooklyn
objectclass: inetOrgPerson
uid: bravo
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=Cameron Charlie,ou=Staff,dc=example,dc=org
cn: Cameron Charlie
sn: Charlie
givenname: Cameron
objectclass: inetOrgPerson
uid: charlie
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=Dakota Delta,ou=Staff,dc=example,dc=org
cn: Dakota Delta
sn: Delta
givenname: Dakota
objectclass: inetOrgPerson
uid: delta
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=Eli Echo,ou=Staff,dc=example,dc=org
cn: Eli Echo
sn: Echo
givenname: Eli
objectclass: inetOrgPerson
uid: echo
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=Frankie Foxtrot,ou=Staff,dc=example,dc=org
cn: Frankie Foxtrot
sn: Foxtrot
givenname: Frankie
objectclass: inetOrgPerson
uid: foxtrot
userPassword:: e01ENX1YMDNNTzFxblpkWWRneWZldUlMUG1RPT0=

dn: cn=devops, ou=Groups, dc=example,dc=org
cn: devops
objectclass: top
objectclass: groupofuniquenames
ou: Groups
uniquemember: uid=alpha,ou=Staff,dc=example,dc=org
uniquemember: uid=bravo,ou=Staff,dc=example,dc=org
uniquemember: uid=charlie,ou=Staff,dc=example,dc=org

dn: cn=management, ou=Groups, dc=example,dc=org
cn: management
objectclass: top
objectclass: groupofuniquenames
ou: Groups
uniquemember: uid=delta,ou=Staff,dc=example,dc=org
uniquemember: uid=echo,ou=Staff,dc=example,dc=org
uniquemember: uid=foxtrot,ou=Staff,dc=example,dc=org
EOL
