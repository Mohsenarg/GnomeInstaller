#!/bin/bash


echo -e '```````` __      __      ___          _____           ___ __    
````````/ _`|\ |/  \|\/||__    ||\ |/__`| /\ |   |   |__ |__) 
````````\__>| \|\__/|  ||___   || \|.__/|/~~\|___|___|___|  \ 
`````````````````````````````````````````````````````````````'


echo 'Install Started.'

detect-distro() 
{
    OS=$(uname -s | tr A-Z a-z)
    
    case $OS in linux)
        source /etc/os-release
        case $ID in
          debian)
            local result="debian"
            echo "$result"
            ;;
            
          ubuntu|kali)
            local result="ubuntu"
            echo "$result"
            ;;

          fedora)
            local result="fedora"
            echo "$result"
            ;;
            
          arch)
            local result="arch"
            echo "$result"
            ;;
            
          *)
            echo -n "unsupported linux distro"
            ;;
        esac
      ;;
    
      *)
        echo -n "unsupported OS"
        ;;
    esac
}

GnomeDebian() {

    apt update -y && echo 'apt update OK' || echo 'apt update Failed'

    apt install gnome/stable -y && echo 'apt install OK' || echo 'apt install Failed'

    echo "Gnome Installed Finished !"
}

GnomeUbuntu() {

    apt update -y && echo 'apt update OK' || echo 'apt update Failed'

    apt apt install ubuntu-gnome-desktop -y && echo 'apt install OK' || echo 'apt install Failed'

    apt sudo apt install ubuntu-desktop-minimal -y && echo 'apt install OK' || echo 'apt install Failed'

    apt install vanilla-gnome-desktop vanilla-gnome-default-settings -y && echo 'apt install OK' || echo 'apt install Failed'

    echo "Gnome Installed Finished !"
}

GnomeFedora() {

    dnf update -y && echo 'dnf update OK' || echo 'dnf update Failed'

    dnf install gnome-tweaks gnome-extensions-app -y && echo 'dnf install OK' || echo 'dnf install Failed'

    echo "Gnome Installed Finished !"
}

GnomeArch() {

    pacman -Syu --noconfirm && echo 'pacman update OK' || echo 'pacman update Failed'

    pacman -S xorg xorg-server --noconfirm

    pacman -S gnome --noconfirm && echo 'pacman install OK' || echo 'pacman install Failed'

    systemctl start gdm.service && echo 'service start OK' || echo 'service start Failed'

    systemctl enable gdm.service && echo 'service enable OK' || echo 'service enable Failed'

    echo "Gnome Installed Finished !"
}

res=$(detect-distro)

if [ $res == 'debian' ]
then
    echo 'linux distro detected !'

    GnomeDebian

    echo 'We Will Restart In 5s'

    sleep 5s

    reboot

    
elif [ $res == 'ubuntu' ] 
then
    echo 'linux distro detected !'

    GnomeUbuntu

    echo 'We Will Restart In 5s'

    sleep 5s

    reboot

elif [ $res == 'fedora' ] 
then
    echo 'linux distro detected !'

    GnomeFedora

    echo 'We Will Restart In 5s'

    sleep 5s

    reboot

elif [ $res == 'arch' ] 
then
    echo 'linux distro detected !'
    
    GnomeArch

    echo 'We Will Restart In 5s'

    sleep 5s

    reboot
    
elif [ $res == 'unsupported linux distro' ] 
then
    echo 'unsupported linux distro !'
    
else
     echo 'unsupported OS !'
fi