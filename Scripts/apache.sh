#!/bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
    echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
    echo
    echo
    echo "1) Instalar Servidor Apache (LAMP)."
    echo "2) Desinstalar Servidor Apache (LAMP)."
    echo "3) Iniciar Servicio Apache."  
    echo "4) Parar Servicio Apache."
    echo "5) Reiniciar Servicio Apache."
    echo "6) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "6" ];
do
    case $opc in

        1)  sudo apt-get -y install  apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
	    echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        2)  sudo apt-get -y purge apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            clear
            _MENU 
            ;;
        
        3)  sudo /etc/init.d/apache2 start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            clear
            _MENU 
            ;;

        4)  sudo /etc/init.d/apache2 stop 
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        5)	sudo /etc/init.d/apache2 restart 
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        6)  sudo ./instalar.sh ;;

        *)
        clear
        echo "Por favor indica una de las siguientes opciones"
        _MENU
        ;;
    esac
read opc
done
