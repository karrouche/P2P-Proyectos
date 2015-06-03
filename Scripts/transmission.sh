#!/bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
    echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
    echo
    echo
    echo "1) Instalar Servidor Transmission"
    echo "2) Desinstalar Servidor Transmission."
    echo "3) Configuracion del servicio."
    echo "4) Iniciar Servicio Transmission."  
    echo "5) Parar Servicio Transmission."
    echo "6) Reiniciar Servicio Transmission."
    echo "7) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "7" ];
do
    case $opc in
        1)  sudo apt-get -y install transmission transmission-daemon
            echo
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        2)  sudo apt-get -y purge transmission transmission-daemon
            echo
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            clear
            _MENU
            ;;
        

        3)  sudo ./transmissionconfiguracion.sh
            clear
            _MENU
            ;;

        4)  
            sudo /etc/init.d/transmission-daemon start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        5)  sudo /etc/init.d/transmission-daemon stop
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        6)  sudo /etc/init.d/transmission-daemon restart
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        7)  sudo ./instalar.sh ;; 
  
        *)
        clear
        echo "Por favor indica una de las siguientes opciones"
        _MENU
        ;;
    esac
read opc
done
