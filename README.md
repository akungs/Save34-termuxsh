Save34 Termux Downloader

Simple downloader tool for Termux using "yt-dlp", "aria2", and "ffmpeg".

This script allows you to download videos, music, and playlists directly from the terminal with an interactive menu.

---

Features

- Download YouTube Video
- Download Music / Audio
- Download Playlist
- Fast download using aria2 multi-thread
- Automatic merge video + audio
- Interactive terminal menu
- Automatically saves files to phone storage

---

Requirements

This script uses:

- yt-dlp
- aria2
- ffmpeg

The script will install them automatically if they are not installed.

---

Installation

Open Termux and run:
copy and paste!!!

pkg update && pkg upgrade -y && pkg install -y git

git clone https://github.com/akungs/save34-termux

cd Save34-termux && bash Termux-save.sh

---

Usage

1. Run the script
2. Choose the download option from the menu
3. Paste the video link
4. Wait for the download process to finish

---

Output Folder

Downloaded files will be saved to:

Video:

/storage/emulated/0/DCIM/Save-Termux-mp4

Music:

/storage/emulated/0/DCIM/Save-Termux-mp3

---

Author

Created by akungs

---

Disclaimer

This tool is intended for personal use only.
Please respect the terms of service of the platforms you download from.
