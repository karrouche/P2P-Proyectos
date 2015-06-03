#! /bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
        echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
        echo
        echo
        echo "1) Instalar Servicio Telegram."
        echo "2) Cambiar número de teléfono de Telegram."
        echo "3) Salir."
        echo -n "Indica una opcion: "
}
until [ "$opc" = "3" ];
do
        case $opc in
                1)      cd /home/bananapi
                        sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make git python python-sip python-mysqldb
                        sudo git clone --recursive https://github.com/vysheng/tg.git && cd tg
                        sudo ./configure --disable-json
                        make
                        echo
                        echo
                        echo "Servicio Instalado correctamente"
                        sleep 4
                        _MENU
                        ;;

                2)      sudo rm -r /root/.telegram-cli/
			cd tg
			sudo bin/telegram-cli -k tg-server.pub -W
			clear
                        _MENU
                        ;;

                3) sudo ./instalar.sh ;;

                *)
                clear
                echo "Por favor indica una de las siguientes opciones"
                _MENU
                ;;

        esac
read opc
done
