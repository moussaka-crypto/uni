#!/bin/bash

cd /flask

dos2unix /flask/*.py
dos2unix /flask/App/*.py


#can be changed to longer/shorter depending on your computer
waittime=40

echo "Waiting ${waittime} seconds for MySQL to start up ...."

# Provide MySQL with enough time to properly start up ...
sleep ${waittime}


# Only one DB initialization shall take place.
# There are far better ways to solve this,
# but we want to keep things simple ...
if ! mysql -u itsadmin -pitsadmin -h mysql -e "use reisekosten_db; show tables;" | grep users >/dev/null ; then
    python3 manage.py db init
    python3 manage.py db migrate
    python3 manage.py db upgrade
fi

python3 manage.py runserver
