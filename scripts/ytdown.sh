#!/usr/bin/env bash

show-help() {
  echo "-v <URL> -> Download a single video"
  echo "-l <URL> -> Download a playlist"
}

ask-details() {
  read -rp "Enter title: " title
  read -rp "Enter artist: " artist
  read -rp "Enter album: " album

  output="${artist} - ${title}"
}

video() {
  ask-details
  echo "Download started..."

  yt-dlp \
    --quiet --newline --progress --no-playlist \
    --add-metadata --extract-audio --embed-thumbnail \
    --audio-format mp3 --output "${output}" \
    --paths "$(xdg-user-dir DOWNLOAD)/ytdlp-output" \
    --postprocessor-args ffmpeg:"-metadata artist='${artist}' -metadata title='${title}' -metadata album='${album}'" \
    $1

  echo "Download finished. Output in $(xdg-user-dir DOWNLOAD)/ytdlp-output"
}

playlist() {
  count=$(yt-dlp --print "%(playlist_count)s" --skip-download -I 1 $1)

  for ((i = 1; i <= ${count}; i++)); do
    clear
    echo "Processing video $i/${count}:"
    yt-dlp --no-warnings -I $i --print "Video Title: %(title)s" --print "Channel: %(channel)s" $1

    ask-details
    echo "Download started..."

    yt-dlp \
      --quiet --newline --progress -I $i --add-metadata --extract-audio --embed-thumbnail \
      --audio-format mp3 --output "${output}" \
      --paths "$(xdg-user-dir DOWNLOAD)/ytdlp-output" \
      --postprocessor-args ffmpeg:"-metadata artist='${artist}' -metadata title='${title}' -metadata album='${album}'" \
      $1

    echo "Download finished."
    read "Press any key to continue..."
  done

  echo "Download finished. Output in $(xdg-user-dir DOWNLOAD)/ytdlp-output"
}

isYtUrl="^https:\/\/(?:www\.|music\.)?youtube\.com\/.*$"
if [[ $# != 2 || $2 =~ isYtUrl ]]; then
  show-help
  exit 1
fi

case "$1" in
"-v") video $2 ;;
"-l") playlist $2 ;;
*)
  show-help
  exit 1
  ;;
esac
