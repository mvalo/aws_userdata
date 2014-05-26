# Mise à jour de la distrib.
yum -y update
# Installation des outils de dev, compilateurs etc...
yum -y groupinstall "Development Tools"

# Se placer dans le répertoire de travail
cd /usr/src
# Récupération d'une version spécifique node, pour le moment c'est la 0.10.26 mais peut changer...
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz
# Décompression
tar zxf node-v0.10.28.tar.gz
cd node-v0.10.28
# Configuration + compilation + installation globale sur l'OS
./configure
make
make install

# Verification de la version de node en cours
node -v

# Installation de forever en module global
npm -g install forever

## TO DO
# P.S. 1 : A cela tu peux également ajouter la copie du fichier « switchplus.conf » dans « /etc/init » afin que switchplus puisse être démarrer 
# sous forme de service sur la machine, par contre sous CentOS, la commande service est :
# sudo initctl [start/stop] switchplus

# P.S. 2 : Attention dans le fichier « switchplus.conf » et pour les machines de prod, on n’aura peut etre pas besoin de la ligne : « start on started mongodb » puisque 
# mongodb n’est pas installé sur la même machine… à retirer donc…
