#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "Run me as root pls" 1>&2
    exit 1
fi

# Create User
user="ansible"
password=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head  -c 15)

useradd -m -p $password $user
usermod -aG sudo $user

touch /etc/sudoers.d/$user
echo "# Ansible User created via ansiblelify.sh script" > "/etc/sudoers.d/$user"
echo "$user ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers.d/$user"

# Add ssh key
ansibleKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjC9ZIcIn6mJxdcvxjbK0VVIWYL6YgMqRuhleeuovMUa7qC93DHuWuMfhI4GH9rQ9qg8BrtYGyRtRL+5o5RPoWn+yCN0gH65jnMNCDWgdnjrMgeveqbQbhi4fcC8plJaGPSDgWPYqWyBGjfZqTz2yhsl2lH9ngQNIAgwntNjyi9KIGpGTXBxvik6H52aaLqvjF99rgKmShak5EcsgWflANllgYeydi+YP/3YNWzCNG6C6RF8gyxm1xiVjcgp8s45G2rTwuipc2QERBeGQAMyEwKaUoicYoC8BPBJgSqaxlReJlZvZAPlEP0vYr/5WTYENB1QpL+jtvQHrTgzXPeYw5hDOgIHNX/wOpLb552eQ/PNaert6NLr/WdmCG1F0hvt11Y0V/eKratK2pk91k2j22DiuN7QbITLKdPq1Rq3A8SwFUNa0GQ2AfE7tRAzsG8LGj8RuBLvGhbnTOZYkx/QeqTvPeKOwGBk3z6nydUViKDALNVMZiOQusxozTxqPeyh/+Zex4gu1jDWwod1T3K43ZzkqpNRtmliys/4WlG3vsYiGzSVOLj6lfzA+/v/muokRajJwFYyA+mgJw+wmEJ0ZyqOyXB22wddsUKZ6d9MrAgZrXWPpbyt8DrQTHqce7z4WOk5UnnybWajLuLGQ949TjFsPkvlEB5NfRj7irlcBKoQ== vince@DESKTOP-8Q54CHI"
mkdir -p /home/$user/.ssh/
echo $ansibleKey > /home/$user/.ssh/authorized_keys