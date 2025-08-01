echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
echo "; App untuk set crossover menjadi reset trial;"
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
            # sudo sed -i -e 's/if builddate > expirationdate:/#if builddate > expirationdate:\n\tif False:/g' $userinputpath/lib/python/demoutils.py
            # File konfigurasi yang akan diedit
            CONFIG_FILE="$userinputpath/etc/cxoffice.conf"
            CONFIG_FILE2="$userinputpath/share/crossover/data/cxoffice.conf"

            # Generate timestamp UTC dalam format yang diinginkan
            CURRENT_TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")

            # Mengganti baris yang mengandung "BuildTimestamp" dengan nilai baru
            sudo sed -i "s/\(\"BuildTimestamp\" = \"\)[0-9T]*Z\"/\1$CURRENT_TIMESTAMP\"/" "$CONFIG_FILE"
            sudo sed -i "s/\(\"BuildTimestamp\" = \"\)[0-9T]*Z\"/\1$CURRENT_TIMESTAMP\"/" "$CONFIG_FILE2"
        fi

    else
        userinputpath="/opt/cxoffice"
        # sudo sed -i -e 's/if builddate > expirationdate:/#if builddate > expirationdate:\n\tif False:/g' $userinputpath/lib/python/demoutils.py
        # File konfigurasi yang akan diedit
        CONFIG_FILE="$userinputpath/etc/cxoffice.conf"
        CONFIG_FILE2="$userinputpath/share/crossover/data/cxoffice.conf"

        # Generate timestamp UTC dalam format yang diinginkan
        CURRENT_TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")

        # Mengganti baris yang mengandung "BuildTimestamp" dengan nilai baru
        sudo sed -i "s/\(\"BuildTimestamp\" = \"\)[0-9T]*Z\"/\1$CURRENT_TIMESTAMP\"/" "$CONFIG_FILE"
        sudo sed -i "s/\(\"BuildTimestamp\" = \"\)[0-9T]*Z\"/\1$CURRENT_TIMESTAMP\"/" "$CONFIG_FILE2"
    fi

    
}

update_bottle(){
    # Cari file cxbottle.conf di seluruh sistem (butuh sudo) atau dalam direktori tertentu
    FILES=$(sudo find ~/.cxoffice/ -type f -name "cxbottle.conf" 2>/dev/null)

    # Generate timestamp UTC dalam format yang diinginkan
    CURRENT_TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")

    # Loop melalui setiap file yang ditemukan
    for FILE in $FILES; do
        echo -e '\r'
        echo -e '\r'
        echo -e '====================================='
        echo "Memperbarui Timestamp di: $FILE"
        # echo -e '\r'
        # echo -e '\r'
        
        # Gunakan sed untuk mengganti timestamp lama dengan yang baru
        sed -i "s/\(\"Timestamp\" = \"\)[0-9T]*Z\"/\1$CURRENT_TIMESTAMP\"/" "$FILE"
        # echo -e '\r'
        # echo -e '\r'
        # echo "Timestamp diperbarui menjadi: $CURRENT_TIMESTAMP di $FILE"
        echo -e '====================================='
        echo -e '\r'
        echo -e '\r'
    done

    # Jika tidak ada file ditemukan, tampilkan pesan
    if [[ -z "$FILES" ]]; then
        echo -e '\r'
        echo -e '\r'
        echo -e '====================================='
        echo "File cxbottle.conf tidak ditemukan."
        echo -e '====================================='
        echo -e '\r'
        echo -e '\r'
    fi
}

update_bottle2(){
    # Cari file .update-timestamp di seluruh sistem (butuh sudo) atau dalam direktori tertentu
    FILES=$(sudo find ~/.cxoffice/ -type f -name ".update-timestamp" 2>/dev/null)

    # Generate timestamp dalam format yang diinginkan
    CURRENT_TIMESTAMP=$(date +%s)

    # Loop melalui setiap file yang ditemukan
    for FILE in $FILES; do
        echo -e '\r'
        echo -e '\r'
        echo -e '====================================='
        echo "Memperbarui Timestamp di: $FILE"
        # echo -e '\r'
        # echo -e '\r'
        
        # Gunakan sed untuk mengganti timestamp lama dengan yang baru
        sed -i "1,\$c\\$CURRENT_TIMESTAMP" "$FILE"
        # echo -e '\r'
        # echo -e '\r'
        # echo "Timestamp diperbarui menjadi: $CURRENT_TIMESTAMP di $FILE"
        echo -e '====================================='
        echo -e '\r'
        echo -e '\r'
    done

    # Jika tidak ada file ditemukan, tampilkan pesan
    if [[ -z "$FILES" ]]; then
        echo -e '\r'
        echo -e '\r'
        echo -e '====================================='
        echo "File .update-timestamp tidak ditemukan."
        echo -e '====================================='
        echo -e '\r'
        echo -e '\r'
    fi
}

input_crossover_location
update_bottle
update_bottle2

echo -e '\r'
echo -e '\r'
echo "Crossover Reset Trial Berhasil...!" 
echo -e '\r'
echo -e '\r'
