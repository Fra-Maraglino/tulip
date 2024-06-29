#!/bin/bash

number=1 # numero del file
sequence=1 # sequenza di appartenenza

for ((;;)) #ciclo infinito
do
    # Dopo 35 file (quindi ogni 35 minuti) li rimuove e inizia una nuova sequenza
    if [ "$number" -gt 35 ]; then
        number=1
        rm -f all_${sequence}_* 
        ((sequence++)) 
    fi
    timestamp=$(date -d '+2 hours' +"%Y-%m-%d_%H:%M:%S")
    timeout 1m tcpdump -s 0 -i game -w all_${sequence}_${number}_${timestamp}.pcap
    ((number++))

done

