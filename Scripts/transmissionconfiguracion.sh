#!/bin/bash
#Mohamed Mohand Karrouche
_MENU()
{
    echo "INDIQUE QUE OPCIÓN QUE DESEE CONFIGURAR:"
    echo
    echo
    echo "1) Configurar directorio de Torrents COMPLETOS."
    echo "2) Configurar directorio de Torrents INCOMPLETOS."
    echo "3) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "3" ];
do
    case $opc in
        1)  sudo chmod -R 777 /etc/transmission-daemon
	    sudo /etc/init.d/transmission-daemon stop
            read -p "Lugar del nuevo directorio de Torrents COMPLETOS: " var1
	    sudo sed -i "s%$(head -n 15 /etc/transmission-daemon/settings.json | tail -1)%    \"download-dir\": \"$var1\", %g" /etc/transmission-daemon/settings.json
	    sudo sed -i "s%$(head -n 15 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"download-dir\": \"$var1\", %g" /var/lib/transmission-daemon/info/settings.json
	    sudo /etc/init.d/transmission-daemon start
            echo "Cambio realizado correctamente"
	    clear
            _MENU
            ;;

        2)  sudo chmod -R 777 /etc/transmission-daemon
	    sudo /etc/init.d/transmission-daemon stop
            read -p "Lugar del nuevo directorio de Torrents INCOMPLETOS: " var2
	    sudo sed -i "s%$(head -n 23 /etc/transmission-daemon/settings.json | tail -1)%    \"incomplete-dir\": \"$var2\", %g" /etc/transmission-daemon/settings.json
	    sudo sed -i "s%$(head -n 23 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"incomplete-dir\": \"$var2\", %g" /var/lib/transmission-daemon/info/settings.json
	    sudo sed -i "s/$(head -n 24 /etc/transmission-daemon/settings.json | tail -1)/    \"incomplete-dir-enabled\": \"true\", /g" /etc/transmission-daemon/settings.json
	    sudo sed -i "s/$(head -n 24 /var/lib/transmission-daemon/info/settings.json | tail -1)/    \"incomplete-dir-enabled\": \"true\", /g" /var/lib/transmission-daemon/info/settings.json
	    sudo /etc/init.d/transmission-daemon start
            clear
            _MENU
            ;;
        

        3)  sudo ./transmission.sh ;; 
  
        *)
        clear
        echo "Por favor indica una de las siguientes opciones"
        _MENU
        ;;
    esac
read opc
done
