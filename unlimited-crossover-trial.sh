echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
echo "; App untuk set crossover menjadi trial unlimited ;"
echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
echo -e '\r'
echo -e '\r'


input_crossover_location() {
    echo "Masukan path crossover...!"
    read -p "Jika anda menginstall padal lokasi lain (default path: /opt/cxoffice/) : " userinputpath

    if [ "$userinputpath" != "" ]; then

        if [! -d "$userinputpath"]; then
            echo "$userinputpath tidak ditemukan."
        else
            sudo sed -i -e 's/if builddate > expirationdate:/#if builddate > expirationdate:\n\tif False:/g' $userinputpath/lib/python/demoutils.py
        fi

    else
        userinputpath="/opt/cxoffice"
        sudo sed -i -e 's/if builddate > expirationdate:/#if builddate > expirationdate:\n\tif False:/g' $userinputpath/lib/python/demoutils.py
    fi


}

input_crossover_location

echo -e '\r'
echo -e '\r'
echo "Crossover Unlimited Trial Berhasil...!" 
echo -e '\r'
echo -e '\r'