#!/bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
    echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
    echo
    echo
    echo "1) Instalar Servidor OpenSSH."
    echo "2) Desinstalar Servidor OpenSSH."
    echo "3) Iniciar Servicio OpenSSH."  
    echo "4) Parar Servicio OpenSSH."
    echo "5) Reiniciar Servicio OpenSSH."
    echo "6) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "6" ];
do
    case $opc in

        1)	sudo apt-get install -y openssh-client openssh-server ssh
		echo
            	echo "Servicio instalado correctamente"
            	sleep 4
           	clear
           	_MENU
           	;;

        2)	sudo apt-get purge -y openssh-client openssh-server ssh
		echo
           	echo "Servicio eliminado correctamente"
            	sleep 4
           	clear
            	_MENU
            	;;
        
        3)	sudo /etc/init.d/ssh start
		echo
           	echo "Servicio instalado correctamente"
            	sleep 2
           	clear
            	_MENU
            	;;

        4)	sudo /etc/init.d/ssh stop
		echo
           	echo "Servicio instalado correctamente"
            	sleep 2
           	clear
            	_MENU
            	;;

        5)	sudo /etc/init.d/ssh restart
		echo
           	echo "Servicio instalado correctamente"
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
