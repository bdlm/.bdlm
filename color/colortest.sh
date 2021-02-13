#!/usr/bin/env bash

for a in `seq 1 255`; do
    fg="__BDLM_CLR_FG_${a}"
    bg="__BDLM_CLR_BG_${a}"
    blk=${__BDLM_CLR_FG_BLCK}
    printf "% 3s) FG: ${!fg}${fg}${__BDLM_CLR_RST_ALL}    BG: ${blk}${!bg}${bg}${__BDLM_CLR_RST_ALL}\n" "$a"
done

echo "Normal           : ${__BDLM_CLR_RST_ALL}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Normal Underline : ${__BDLM_CLR_STL_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Normal Bold      : ${__BDLM_CLR_STL_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Normal Highlight : ${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Normal Faded     : ${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Black            : ${__BDLM_CLR_FG_BLCK}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Black  Underline : ${__BDLM_CLR_FG_BLCK}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Black  Bold      : ${__BDLM_CLR_FG_BLCK}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Black  Highlight : ${__BDLM_CLR_FG_BLCK}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Red              : ${__BDLM_CLR_FG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Red Underline    : ${__BDLM_CLR_STL_RST_ULINE}${__BDLM_CLR_FG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Red Bold         : ${__BDLM_CLR_STL_RST_BOLD}${__BDLM_CLR_FG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Red Highlight    : ${__BDLM_CLR_STL_HLT}${__BDLM_CLR_FG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Red Faded        : ${__BDLM_CLR_STL_DIM}${__BDLM_CLR_FG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Green              : ${__BDLM_CLR_FG_GREN}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green Underline    : ${__BDLM_CLR_FG_GREN}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green Bold         : ${__BDLM_CLR_FG_GREN}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green Highlight    : ${__BDLM_CLR_FG_GREN}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green Faded        : ${__BDLM_CLR_FG_GREN}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green (dark) Faded : ${__BDLM_CLR_FG_GREN_DK}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green (dark) Highlight : ${__BDLM_CLR_FG_GREN_DK}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Yellow           : ${__BDLM_CLR_FG_YLOW}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Yellow Underline : ${__BDLM_CLR_FG_YLOW}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Yellow Bold      : ${__BDLM_CLR_FG_YLOW}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Yellow Highlight : ${__BDLM_CLR_FG_YLOW}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Yellow Faded     : ${__BDLM_CLR_FG_YLOW}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Brown            : ${__BDLM_CLR_FG_BRWN}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Brown Underline  : ${__BDLM_CLR_FG_BRWN}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Brown Bold       : ${__BDLM_CLR_FG_BRWN}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Brown Highlight  : ${__BDLM_CLR_FG_BRWN}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Brown Faded      : ${__BDLM_CLR_FG_BRWN}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Blue             : ${__BDLM_CLR_FG_BLUE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Blue Underline   : ${__BDLM_CLR_FG_BLUE}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Blue Bold        : ${__BDLM_CLR_FG_BLUE}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Blue Highlight   : ${__BDLM_CLR_FG_BLUE}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Blue Faded       : ${__BDLM_CLR_FG_BLUE}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Purple           : ${__BDLM_CLR_FG_PURP}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Purple Underline : ${__BDLM_CLR_FG_PURP}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Purple Bold      : ${__BDLM_CLR_FG_PURP}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Purple Highlight : ${__BDLM_CLR_FG_PURP}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Purple Faded     : ${__BDLM_CLR_FG_PURP}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Orange           : ${__BDLM_CLR_FG_ORNG}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Orange Underline : ${__BDLM_CLR_FG_ORNG}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Orange Bold      : ${__BDLM_CLR_FG_ORNG}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Orange Highlight : ${__BDLM_CLR_FG_ORNG}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Orange Faded     : ${__BDLM_CLR_FG_ORNG}${__BDLM_CLR_STL_DIM}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Cyan             : ${__BDLM_CLR_FG_CYAN}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Cyan Underline   : ${__BDLM_CLR_FG_CYAN}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Cyan Bold        : ${__BDLM_CLR_FG_CYAN}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Cyan Highlight   : ${__BDLM_CLR_FG_CYAN}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "White            : ${__BDLM_CLR_FG_WHTE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "White Underline  : ${__BDLM_CLR_FG_WHTE}${__BDLM_CLR_STL_RST_ULINE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "White Bold       : ${__BDLM_CLR_FG_WHTE}${__BDLM_CLR_STL_RST_BOLD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "White Highlight  : ${__BDLM_CLR_FG_WHTE}${__BDLM_CLR_STL_HLT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo
echo "Black Background : ${__BDLM_CLR_BG_BLCK}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Red Background   : ${__BDLM_CLR_BG_REDD}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Green Background : ${__BDLM_CLR_BG_GREN}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Yellow Background: ${__BDLM_CLR_BG_YLOW}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Blue Background  : ${__BDLM_CLR_BG_BLUE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Magenta Backgroun: ${__BDLM_CLR_BG_MGNT}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Cyan Background  : ${__BDLM_CLR_BG_CYAN}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "Purple Background: ${__BDLM_CLR_BG_PURP}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
echo "White Background : ${__BDLM_CLR_BG_WHTE}The quick brown fox jumped over the lazy dog.${__BDLM_CLR_RST_ALL}"
