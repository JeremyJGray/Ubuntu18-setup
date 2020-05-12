Most of this is taken from https://www.linuxbabe.com/ubuntu/install-lamp-stack-ubuntu-20-04-server-desktop

# Install MariaDB Server on Ubuntu 20.04 (Focal Fossa)
# We always start our installations by ensuring the system is updated. This can be achieved by running the commands:

sudo apt update
sudo apt -y upgrade

# Once the system is updated, use the following commands to install MariaDB Server on Ubuntu 20.04 (Focal Fossa).

sudo apt install software-properties-common mariadb-server mariadb-client

# Confirm that the service is started.

systemctl status mariadb

# To enable MariaDB to automatically start at boot time, run

sudo systemctl enable mariadb

# By default, you should be able to access the mysql command line as root user without being prompted to
# provide a password. Let’s ensure we harden our MariaDB server and set the root password.

sudo mysql_secure_installation

# Install Apache Web Server

sudo apt install -y apache2 apache2-utils

# After it’s installed, Apache should be automatically started. Check its status with systemctl.

systemctl status apache2

# It’s also a good idea to enable Apache to automatically start at system boot time.

sudo systemctl enable apache2

# Check Apache version:

apache2 -v

# Now we need to set www-data (Apache user) as the owner of document root (otherwise known as web root). 
# By default it’s owned by the root user.

sudo chown www-data:www-data /var/www/html/ -R


# Install PHP7.4

# At the the time of this writing, PHP7.4 is the latest stable version of PHP and has a minor performance edge over PHP7.3. Enter the following command to install PHP7.4 and some common PHP modules.

sudo apt install -y php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline
sudo apt install -y php7.4-gd php7.4-json php7.4-mysql php7.4-curl php7.4-mbstring
sudo apt install -y php7.4-intl php-imagick php7.4-xml php7.4-zip

# Enable the Apache php7.4 module then restart Apache Web server.

sudo a2enmod php7.4

sudo systemctl restart apache2

# Check PHP version information.

php --version



# Install Nextcloud

# Download the latest .zip from https://nextcloud.com/install/#instructions-server

unzip nextcloud-x.y.z.zip


sudo cp -r nextcloud /var/www/html/






sudo apt-get install -y apache2 mariadb-server libapache2-mod-php7.2
sudo apt-get install -y php7.2-gd php7.2-json php7.2-mysql php7.2-curl php7.2-mbstring
sudo apt-get install -y php7.2-intl php-imagick php7.2-xml php7.2-zip
