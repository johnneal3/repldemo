#! /bin/bash
#
# this script MUST be run as root or using sudo

# PATH to where ancillary files that need to be copied reside
SUPPORTING_FILES="."
#
REPL_INST_ENV="user=attunity group=attunity pass=admin verbose=true debug="
REPL_RPM="https://attunity-patch.s3.amazonaws.com/_servicepacks/Replicate/6.2.0/sp05-6.2.0-Replicate/areplicate-6.2.0-284.x86_64.rpm"

DEMO_USER="demo"
DEMO_PASSWORD="welcome1"
ATTU_USER="attunity"
ATTU_PASSWORD="welcome1"

#
# create demo user password groups
#
# Usage: create_user <username> <password>
#
create_user() {
   if [ "$#" -ne 2 ]
   then
      logit "Usage: ${FUNCNAME[0]} <username> <password>"
      exit 1
   fi
   logit "$1"
   # add a user without password
   useradd --shell /bin/bash --create-home --home "/home/$1" --user-group "$1"

   # set password
   echo "$1:$2" | chpasswd
   logit "done"
}

#
# Use "curl" to fetch a remote file and place in in a local directory
#
# Usage: get_file <remote_path> <local_path>
#
get_file() {
   if [ "$#" -ne 2 ]
   then
      logit "Usage: ${FUNCNAME[0]} <remote_path> <local_path>"
      exit 1
   fi
   logit "curl -L $1 -o $2"
   curl -L "$1" -o "$2"
   logit "done"
}

#
# Install Attunity Replicate from an RPM file
#
# Usage: install_replicate <path_to_file> <install_env>
#
install_replicate() {
   if [ "$#" -ne 2 ]
   then
      logit "Usage: ${FUNCNAME[0]} <path_to_file> <install_env>"
      exit 1
   fi
   logit "$1"

   export $2;  yum -y install "$1"

   logit "done"
}


# 
# Install other utilities needed in the environment
#
# Usage: install_other_utils
#
install_other_utils() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "installing"
   # install the dialog framework for tty dialogs
   yum -y install dialog
   logit "done"
}

# 
# Install the database clients needed for Replicate
#
# Usage: install_db_clients
#
install_db_clients() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "Installing database clients"
   # install Unix ODBC
   logit "installing unixODBC"
   yum -y install unixODBC
   # install mysql client libraries
   logit "Installing mysql"
   yum -y install https://dev.mysql.com/get/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.11-1.el7.x86_64.rpm 
   # install postgres client libraries
   logit "Installing PostgreSQL client"
   yum -y install https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-3.noarch.rpm
   yum -y install postgresql94
   yum -y install postgresql94-odbc
   # install Oracle instant client
   #logit "Installing Oracle client"
   #yum -y install $SUPPORTING_FILES/rpm/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
   #yum -y install $SUPPORTING_FILES/rpm/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm
   #ln -s /usr/lib/oracle/12.2/client64/lib/libclntsh.so.12.* /usr/lib/oracle/12.2/client64/lib/libclntsh.so
   #add_to_ld_path "/usr/lib/oracle/12.2/client64/lib"
   # install SQL Server ODBC driver
   logit "Installing SQL Server client"
   curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo

   yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
   ACCEPT_EULA=Y yum -y install msodbcsql
   cd /opt/microsoft/msodbcsql/lib64 || logit "msodbcsql: /opt/microsoft/msodbcsql/lib64 directory not found"
   TFILE=$(ls libmsodbcsql-13.1.so.*)
   if [ "$TFILE" -ne "libmsodbcsql-13.1.so.0.0" ]
   then
      logit "msodbcsql: linking $TFILE to libmsodbcsql-13.1.so.0.0"
      ln -s "$TFILE" libmsodbcsql-13.1.so.0.0
   fi
   cd - || logit "msodbcsql: unable to change to original directory"
   add_to_ld_path "/opt/microsoft/msodbcsql/lib64/"
   # optional: for bcp and sqlcmd
   ACCEPT_EULA=Y yum -y install mssql-tools
   # use single quotes so we don't expand variables here
   add_to_path "/opt/mssql-tools/bin"
   #
   logit "done"
}

# 
# Install and configure docker
#
# Usage: install_docker
#
install_docker() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "Installing Docker"
   # install packages required for docker
   yum -y install yum-utils device-mapper-persistent-data lvm2
   # set up the stable repository
   yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
   # install docker
   yum -y install docker-ce

   # configure Docker to start automatically on boot
   logit "configuring docker to start on boot"
   systemctl enable docker

   #
   logit "done"
}

#
# Install docker-compose using python pip. This is an alternate method that
# can be challenging. Best to try the curl method first.
#
# Usage: install_compose_pip
#
install_compose_pip() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "Installing docker-compose using pip"
   # install the EPEL repository
   yum -y install epel-release
   # install pip
   yum -y install python-pip
   # upgrade python
   yum -y upgrade python*
   # adjust the python libs because the pip install messes things up
   yum -y remove python-urllib3
   yum -y remove python-requests
   yum -y install python-urllib3
   yum -y install python-requests
   # install docker-compose
   pip install docker-compose
   logit "done"
}

#
# Install docker-compose using curl
#
# Usage: install_compose_curl
#
install_compose_curl() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "Installing docker-compose using curl"
   # get the executable from github and put it in /usr/local/bin
   curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" \
           -o /usr/local/bin/docker-compose
   # make it executable
   chmod +x /usr/local/bin/docker-compose
   # test it
   docker-compose --version
   logit "done"
}

logit() {
   RED='\033[0;31m'
   GREEN='\033[0;32m'
   BLUE='\033[0;34m'
   NC='\033[0m' # No Color

   echo -e "${GREEN}***${NC}"
   echo -e "${GREEN}*** ${FUNCNAME[1]}(): $* ${NC}"
   echo -e "${GREEN}***${NC}"
}

# 
# Create the /etc/odbcinst.ini file based on the drivers we have installed.
#
# Usage: create_odbcinst
#
create_odbcinst() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "creating"
   if [ -f /etc/odbcinst.ini ]
   then
      mv /etc/odbcinst.ini /etc/odbcinst.ini.org
   fi
   cp "${SUPPORTING_FILES}/etc/odbcinst.ini" /etc
   chmod 664 /etc/odbcinst.ini

   logit "done"
}

#
# add data to PATH for the attunity and demo users
#
# Usage: add_to_path <data>
#
add_to__path() {
   if [ "$#" -ne 1 ]
   then
      logit "Usage: ${FUNCNAME[0]}: <data>"
      exit 1
   fi
   logit "adding $1 to PATH"
   # attunity user
   echo "export PATH=\"\$PATH:$1\"" >> /home/$ATTU_USER/.bash_profile
   echo "export PATH=\"\$PATH:$1\"" >> /home/$ATTU_USER/.bashrc
   # demo user
   echo "export PATH=\"\$PATH:$1\"" >> /home/$DEMO_USER/.bash_profile
   echo "export PATH=\"\$PATH:$1\"" >> /home/$DEMO_USER/.bashrc
}

#
# add data to LD_LIBARY_PATH for the attunity and demo users
#
# Usage: add_to_ld_path <data>
#
add_to_ld_path() {
   if [ "$#" -ne 1 ]
   then
      logit "Usage: ${FUNCNAME[0]}: <data>"
      exit 1
   fi
   logit "adding $1 to LD_LIBRARY_PATH"
   # attunity user
   echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$1\"" >> /home/$ATTU_USER/.bash_profile
   echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$1\"" >> /home/$ATTU_USER/.bashrc
   # attunity service
   echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$1\"" >> /opt/attunity/replicate/bin/site_arep_login.sh
   # demo user
   echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$1\"" >> /home/$DEMO_USER/.bash_profile
   echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$1\"" >> /home/$DEMO_USER/.bashrc
}

#
# copy files needed for the workshop/testdrive into the demo directory.
#
# Usage: copy_demo_files
#
copy_demo_files() {
   if [ "$#" -ne 0 ]
   then
      logit "Usage: ${FUNCNAME[0]}: too many arguments"
      exit 1
   fi
   logit "copying demo files"
   cp -R $SUPPORTING_FILES/demo/* /home/$DEMO_USER
   logit "changing ownership and permissions"
   cd /home/$DEMO_USER || logit "unable to change to demo home directory"
   chown -R $DEMO_USER:$DEMO_USER ./*
   chmod -R o+r ./*
   chmod +x ./*
   chmod -R +x bin/* baseball/demo/*
   cd - || logit "unable to change to original directory"
   logit "done"
}


############
#   MAIN   #
############

# 
# check to see if we are running with an effective user id of root.
# Exit if not.
#
if [ "$(id -u)" -ne 0 ]
then
   logit "Usage: you must run this script as root/sudo"
   exit 1
fi

# users have to be created before we start adding to PATH and LD_LIBRARY_PATH
# we might as well do it now.
create_user $DEMO_USER $DEMO_PASSWORD
create_user $ATTU_USER $ATTU_PASSWORD


# copy demo files to the demo home directory
copy_demo_files

install_replicate "$REPL_RPM" "$REPL_INST_ENV"
add_to_ld_path "/opt/attunity/replicate/lib:/usr/lib64"

install_docker
install_compose_curl
install_db_clients
install_other_utils


# can't add the demo user to group docker until after docker has been installed.
usermod -a -G docker $DEMO_USER

#create_odbcinst

logit "setup.sh: starting docker"
cd /home/$DEMO_USER/bin
./docker-start.sh

logit "setup.sh: running docker compose in detached mode"
su -c "cd /home/$DEMO_USER/docker; /usr/local/bin/docker-compose up -d" $DEMO_USER 

logit "adding containers to /etc/hosts"
cd 
chmod 775 ./addhosts.sh
./addhosts.sh

logit "setup.sh: setup is complete!"

exit 0
