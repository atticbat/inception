if grep -Ex "127.0.0.1\s+khatlas.42.fr" /etc/hosts
then
    echo "Host file already updated"
else
    echo "127.0.0.1 khatlas.42.fr" >> /etc/hosts
fi