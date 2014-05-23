# Mise à jour de la distrib.
yum -y update
# Installation des outils de dev, compilateurs etc...
yum -y groupinstall "Development Tools"

# Se placer dans le répertoire de travail
cd /usr/src
# Récupération d'une version spécifique node, pour le moment c'est la 0.10.26 mais peut changer...
wget http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
# Décompression
tar zxf node-v0.10.26.tar.gz
cd node-v0.10.26
# Configuration + compilation + installation globale sur l'OS
./configure
make
make install

# Vérification de la version de node en cours
node -v
