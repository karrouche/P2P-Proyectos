#! /bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
        echo "INDIQUE QUE OPCIÓN DESEE REALIZAR:"
        echo
        echo
        echo "1) Instalar Servicio NO-IP."
        echo "2) Crear el script para iniciar automaticamente."
        echo "3) Salir."
        echo -n "Indica una opcion: "
}
until [ "$opc" = "3" ];
do
        case $opc in
                1)	cd /home/bananapi
                        wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
                        tar -zxf noip-duc-linux.tar.gz
                        cd noip-2.1.9-1/
                        make
                        sudo make install
                        cd ..
                        rm -r noip-duc-linux.tar.gz
                        echo
                        echo
                        _MENU
                        ;;

                2)      echo "#! /bin/bash
### BEGIN INIT INFO
# Provides: blabla
# Required-Start: $syslog
# Required-Stop: $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: blabla
# Description:
#
### END INIT INFO
sudo /usr/local/bin/noip2" > /etc/init.d/noip2
                        sudo chmod +x /etc/init.d/noip2
                        sudo update-rc.d noip2 defaults
                        echo
                        echo "Script creado correctamente"
                        sleep 4
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
