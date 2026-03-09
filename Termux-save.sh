#!/bin/bash

#b
z() {

spin='λϟ∡∝∀'
i=0

while [ $i -lt 30 ]
do
    printf "\rLoading ${spin:i++%${#spin}:1}"
    sleep 0.1
done

echo
}
clear
#persiapan
echo "CATATAN!!=════════════════════════╗"
echo " Jika anda pertma kali menjalankan║"
echo " Tools ini. pilih saja   'ya'     ║"
echo " Jika anda sudah pernah  'no'     ║"
echo " 'ya'=untuk menginstal            ║"
echo " 'no'=untuk melewati              ║"
echo "══════════════════════════════════╝"
echo

while true; do
read -p "lewati [ya/no] " Keep
case $Keep in
no)
echo "melewati persiapan"
break
;;

ya)
echo "install bahan"
pkg update > /dev/null 2>&1
command -v yt-dlp >/dev/null 2>&1 || pkg install -y yt-dlp >/dev/null 2>&1
command -v aria2c >/dev/null 2>&1 || pkg install -y aria2  >/dev/null 2>&1
command -v ffmpeg >/dev/null 2>&1 || pkg install -y ffmpeg >/dev/null 2>&1

pid=$!
z$pid
break
;;

*)
echo "yang bener cuk"
;;
esac

done

#persiapan folder+file
mkdir -p storage/dcim/Save-Temux-mp3 2> /dev/null
mkdir -p storage/dcim/Save-Temux-mp4 2> /dev/null

options=("Video" "Music" "Playlist" "TikTok" "Exit")
selected=0

draw_menu(){
clear
echo -e '\e[96m'
cat << "EOF"
   ********                                   ****       **
  **//////                                   */// *     */*
 /**         ******   **    **  *****       /    /*    * /*
 /********* //////** /**   /** **///**        ****    *****
 ////////**  ******* //** /** /*******        /// *  /////*
        /** **////**  //****  /**////        *   /*      /*
  ******** //********  //**   //******      / ****       /*
 ////////   ////////    //     //////        ////        /*
 ==========================================================
EOF
echo -e '\e[0m'
echo -e "\e[97m"
cat << "EOF"
╔════════════════════════╗
║   TERMINAL DOWNLOADER  ║
╠════════════════════════╣
EOF

for i in "${!options[@]}"; do
if [ "$i" -eq "$selected" ]; then
printf "║ > %-20s ║\n" "${options[$i]}"
else
printf "║   %-20s ║\n" "${options[$i]}"
fi
done

echo "╚════════════════════════╝"
echo -e "\e[0m"
}

while true
do
draw_menu
read -rsn1 key

if [[ $key == $'\x1b' ]]; then
read -rsn2 key
case $key in
"[A") ((selected--));;
"[B") ((selected++));;
esac
elif [[ $key == "" ]]; then
break
fi

[ $selected -lt 0 ] && selected=$((${#options[@]}-1))
[ $selected -ge ${#options[@]} ] && selected=0

done

choice=${options[$selected]}
if [[ "$choice" == "Exit" ]]; then
echo "Keluar dari program..."
exit
fi
#clear
echo "╔════════════════════════╗"
echo "║ Mode == [$choice]       "
echo "╚════════════════════════╝"
echo
echo "MASUKAN LINK DI BAWAH PASTE&ENTER !JANGAN ADA YANG KOSOSNG!"
echo -e "BILA MAU BERHENTI KETIK \e[92m stop \e[0m"
lin="link.txt"
touch "$lin"
#plus=

while read -r -p "masukan link $plus : " lst
do
[[ "$lst" == "stop" ]] && break
echo "$lst" >> "$lin"
#((plus++))
done
echo
echo "loding bentar biar keren dikit"
echo -n "Loading "
z
echo
wc -l "$lin"
echo "======================="
echo

if [[ "$choice" == "Video" ]]; then

echo "Pilih kualitas:"
echo "1] 1080p"
echo "2] 720p"
echo "3] 360p"
echo
read -p "Pilih: " asu

case $asu in
1)
yt-dlp -a 'link.txt' \
-f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" \
--merge-output-format mp4 \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \
;;

2)
yt-dlp -a 'link.txt' \
-f "bv*[ext=mp4][height<=720]+ba[ext=m4a]/b[ext=mp4]" \
--merge-output-format mp4 \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \
;;

3)
yt-dlp -a 'link.txt' \
-f "bv*[ext=mp4][height<=360]+ba[ext=m4a]/b[ext=mp4]" \
--merge-output-format mp4 \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \
;;
esac

fi

echo "TUNGGU SEDANG MENGUNDUH 📩"
if [[ "$choice" == "Music" ]]; then

#read -p "Masukan URL: " url

yt-dlp -a 'link.txt' \
-x --audio-format mp3 \
--audio-quality 0 \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \

fi
echo "TUNGGU SEDANG MENGUNDUH 📩"
if [[ "$choice" == "Playlist" ]]; then

yt-dlp -a 'link.txt' \
--yes-playlist \
-f "bv*+ba/b" \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \

fi

echo "TUNGGU SEDANG MENGUNDUH 📩"
if [[ "$choice" == "TikTok" ]]; then

yt-dlp -a 'link.txt' \
--downloader aria2c \
--downloader-args "aria2c:-x16 -s16 -k1M" \

fi

if [[ "$choice" == "Exit" ]]; then
exit
fi
rm -f link.txt
mv *.mp3* storage/dcim/Save-Temux-mp3 >/dev/null
mv *.mp4* storage/dcim/Save-Temux-mp4 >/dev/null

echo
echo "Download selesai ✔"
