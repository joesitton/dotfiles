#! /bin/sh
#
# bar input parser for bspwm  Tuesday, 01 July 2014 22:57

#screen_width=$(sres -W)

NORMIFS=$IFS
FIELDIFS=':'


source $(dirname $0)/panel_config

while read -r line ; do
    case $line in
        S*)
            # conky
            sys_infos="${line#?}"
            ;;
        #A*)
        #    # custom window title using xprop xwinfo
        #    title="%{F$TITLE_FG B-}${PAD}$(xwinfo -c ${line#?} | sed 's@N/A@@')${PAD}%{F- B-}"
        #    ;;
        #C*)
            ##clock
            #clock="${line#?}"
            #clock="%{F$CLOCK_BG}⮂%{F- B$CLOCK_BG A:dzen_popup_toggle.sh calendar:} ${clock} %{A B- F$CLOCK_BG}⮀%{F-}"
            #;;
        T*)
            # window title
            title=$(echo ${line#?} | sed 's^\(.\{80\}\).*^\1...^')
            #title="%{F$TITLE_FG} ${title} ${LPAD} %{F-}"
            ;;
        W*)
            # bspwm internal state
            wm_infos=""
            IFS=$FIELDIFS
            set -- ${line#?}
            while [ $# -gt 0 ] ; do
                item=$1
                case $item in
                    [OoFf]*)
                        # desktops
                        name=${item#?}
                        case $item in
                            O*)
                                # focused occupied desktop
                                desk="■"
                                ;;
                            F*)
                                # focused free desktop
                                desk="□"
                                ;;
                            o*)
                                # occupied desktop
                                desk="□"
                                ;;
                            f*)
                                # free desktop
                                desk="-"
                                ;;
                        esac
                        wm_infos="${wm_infos}%{A:bspc desktop -f ${name}:}${PAD}${desk}${PAD}%{A}"
                        ;;
                esac
                shift
            done
            IFS=$NORMIFS
            ;;
    esac
    printf "%s\n" "%{l #FF1F1F1F}$wm_infos %{F$F_O_BG B-}%{F-} %{c}${title} %{r}$sys_infos%{B-}"
done
