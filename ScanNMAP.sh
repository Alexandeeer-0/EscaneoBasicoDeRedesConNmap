#!/bin/bash
#Inicio de Escaneo NMAP:
echo "Iniciando escaneo de red..."

# Variables para reducir procesos:
NETWORK="***.***.*.*/24" # Cambiar con respecto a su IP.
OUTPUT_DIR="resultadosNMAP"

# Creacion de una carpeta para el guardado de datos (resultados)
mkdir -p $OUTPUT_DIR

# Hacemos el primer scaneo con -sn (Escaneo de Ping, identifica dispositivos activos en la red sin hacer el escaneo de puertos)
echo "Escaneando dispositivos activos..."
# Viene siendo el mas basico
sudo nmap -sn $NETWORK -oN $OUTPUT_DIR/activos_$(date '+%Y-%m-%d_%H-%M-%S').txt

# Segundo lugar, escaneo de puertos TCP abiertos, este scaneo es mas completo se le conoce como TCP Connect Scan, sirve para identificar puerto abiertos del dispositivo en la red
echo "Escaneando puertos TCP abiertos..."
# Suele durar mas tiempo por el hecho que establece conexion completa con los puertos 
sudo nmap -sT $NETWORK -oN $OUTPUT_DIR/tcp_$(date '+%Y-%m-%d_%H-%M-%S').txt

# Escaneo SYN rápido
echo "Realizando escaneo SYN..."
sudo nmap -sS $NETWORK -oN $OUTPUT_DIR/syn_$(date '+%Y-%m-%d_%H-%M-%S').txt


echo "Escaneo completado. Los resultados están en la carpeta $OUTPUT_DIR."
