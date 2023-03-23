if [ ! -d /home/$SUDO_USER/data/mysql ]; then
    mkdir -p /home/$SUDO_USER/data/mysql
fi

if [ ! -d /home/$SUDO_USER/data/wordpress ]; then
    mkdir -p /home/$SUDO_USER/data/wordpress
fi