#! /bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
        echo "Seleccione alguno de los siguientes Servicios:"
        echo
        echo
        echo "1) Servidor Apache."
        echo "2) Servidor OpenSSH."
        echo "3) Plataforma Pydio."
        echo "4) Servidor Samba."
        echo "5) Servicio NO-IP."
        echo "6) Servicio Telegram."
        echo "7) Cliente Transmission."
        echo "8) Salir."
        echo -n "Indica una opcion: "
}
until [ "$opc" = "8" ];
do
        case $opc in
                1)  sudo ./apache.sh
                    clear
            		_MENU ;;

                2)  sudo ./openssh.sh
                    clear
            		_MENU ;;

                3)	sudo ./pydio.sh
                    clear
            		_MENU ;;

                4)	sudo ./samba.sh
                    clear
            		_MENU ;;

                5)	sudo ./noip.sh
                    clear
            		_MENU ;;

                6)	sudo ./telegram.sh
                    clear
            		_MENU ;;

                7)	sudo ./transmission.sh
                    clear
            		_MENU ;;

                8) exit ;;

                *)
                clear
                echo "Por favor indica una de las siguientes opciones"
                _MENU
                ;;

        esac
read opc
done
