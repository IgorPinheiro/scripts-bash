#!/bin/bash


if [ "$1" == "" ]
then
	echo "    DORK GOOGLE"
	echo "Criado por: Igor Pinheiro"
	echo "    Data: 09-06-20"
	echo ""
	echo "[+] MODO DE USAR [+]"
	echo "./dork.sh site.target.com"
else

echo "Executando Busca..."
sleep 2
echo "searching file .PDF!"
echo ""

lynx --dump "https://google.com/search?&q=site:$1+ext:pdf" | grep .pdf | cut -d "=" -f2 | egrep -v "site|google" | sed "s/...$//" > temp

echo "[+] PREPARANDO PARA BAIXAR ARQUIVOS ENCONTRADOS [+]"
sleep 2

for pdf in $(cat temp);
do

	echo "Downloading file [$pdf]"
	wget -q $pdf
done

echo "*** >>>DOWNLOAD FINALIZADO<<< ***"
echo ""
echo "bye"
rm temp
fi
