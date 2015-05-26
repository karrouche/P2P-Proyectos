#!/bin/bash
#Mohamed Mohand Karrouche
#Crea un script que al pasarle una opción, realice varias cosas.
_MENU()
{
    echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
    echo
    echo
    echo "1) Instalar Servidor SAMBA"
    echo "2) Desinstalar Servidor SAMBA."
    echo "3) Añadir Usuario a SAMBA."
    echo "4) Eliminar Usuario de SAMBA."
    echo "5) Añadir directorio compartido."
    echo "6) Iniciar Servicio Samba."  
    echo "7) Parar Servicio Samba."
    echo "8) Reiniciar Servicio Samba."
    echo "9) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "9" ];
do
    case $opc in
        1)  sudo apt-get -y install samba samba-common samba-common-bin samba-doc
            echo
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        2)  sudo apt-get -y purge samba samba-common samba-common-bin samba-doc
            echo
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            clear
            _MENU
            ;;
        

        3)  read -p "Indique el nombre de Usuario: " var1;
            sudo adduser --no-create-home $var1;
            sudo smbpasswd -a $var1;
            echo
            echo
            echo "Usuario añadido correctamente a Samba"
            sleep 4
            clear
            _MENU
            ;;

        4)  read -p "Seleccione el nombre de Usuario a ELIMINAR: " var2;
            sudo smbpasswd -x $var2
            echo
            echo
            echo "Usuario Eliminado"
            sleep 4
            clear
            _MENU
            ;;

        5)  read -p "Indique el nombre de la carpeta: " var3
            sudo echo "[$var3]" >> /home/bananapi/Desktop/smb.conf
            read -p "Ubicación en el servidor: " var4
            sudo mkdir $var4
            sudo echo "path = $var4" >> /home/bananapi/Desktop/smb.conf
            read -p "Explorable? YES/NO: " var5
            sudo echo "browsable = $var5" >> /home/bananapi/Desktop/smb.conf
            read -p "Solo lectura? YES/NO: " var6
            sudo echo "read only = $var6" >> /home/bananapi/Desktop/smb.conf
            read -p "Usuarios validos: " var7
            sudo echo "valid user = $var7" >> /home/bananapi/Desktop/smb.conf
            read -p "Permisos para crear archivos en codigo numerico: " var8
            sudo echo "create mask = $var8" >> /home/bananapi/Desktop/smb.conf
            read -p "Permisos para crear directorios en codigo numerico: " var9
            sudo echo "directory mask = $var9" >> /home/bananapi/Desktop/smb.conf
            echo
            echo
            echo
            echo "Carpeta Compartida añadida al fichero smb.conf. Reinicie el servicio para hacer efecto el cambio"
            sleep 4
            clear
            _MENU
            ;;

        6)  
            sudo service samba start
            echo "Servicio iniciado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        7)  sudo service samba stop
            echo "Servicio parado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        8)  sudo service samba restart
            echo "Servicio reiniciado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        9)
        exit
        ;; 
  
        *)
        clear
        echo "Por favor indica una de las siguientes opciones"
        _MENU
        ;;
    esac
read opc
done
