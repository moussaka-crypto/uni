sudo apt-get update
sudo apt-get install -y -qq apt-transport-https     ca-certificates curl software-properties-common

# Achten Sie darauf, dass im folgenden Befehl in der zweiten
# Zeile das letzte Zeichen ein „richtiges“ Minuszeichen ist ...
curl -fsSL https://download.docker.com/linux/debian/gpg |     sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64]     https://download.docker.com/linux/debian     $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo usermod -aG docker itsadmin
