#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      # //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray Menu
# //	email: abuddin388@gmail.com
# //  telegram: https://t.me/badbudstore
# //====================================================
# // font color configuration | BADBUD STORE AUTOSCRIPT
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bulevpn/hss/main/v5 > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bulevpn/hss/main/v5 | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bulevpn/hss/main/v5 | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

clear
chngelimit() {
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m        Chnge Xray/Vmess Account         \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vmess/.vmess.db")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo ""
        echo "   You have no existing clients!"
        echo ""
        exit 0
    fi
    echo ""

    until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
        echo -e " "
        read -rp "Input Username : " user
        CLIENT_EXISTS=$(grep -w $user /etc/vmess/.vmess.db | wc -l)

        if [[ ${CLIENT_EXISTS} == '0' ]]; then
            echo "No customer name available"
        else
            sec=3
            spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
            while [ $sec -gt 0 ]; do
                echo -ne "\e[33m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
                sleep 1
                sec=$(($sec - 1))
            done
            clear
            echo -e "\e[1;32mINPUT DEPENDECIES ACCOUNT $user\e[0m\n"
            until [[ $Quota =~ ^[0-9]+$ ]]; do
                read -p "Limit User (GB): " Quota
            done
            until [[ $iplim =~ ^[0-9]+$ ]]; do
                read -p "Limit User (IP): " iplim
            done

            if [ ! -e /etc/vmess ]; then
                mkdir -p /etc/vmess
            fi
            if [ -z ${iplim} ]; then
                iplim="0"
            fi
            if [ -z ${Quota} ]; then
                Quota="0"
            fi
            c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
            d=$((${c} * 1024 * 1024 * 1024))
            if [[ ${c} != "0" ]]; then
                echo "${d}" >/etc/vmess/${user}
                echo "${iplim}" >/etc/vmess/${user}IP
            fi
            clear
            echo "-----------------------------------------------"
            echo -e "Chnge Vmess Account Username ${grenbo}$user${NC} Successfully"
            echo -e "limit Quota $Quota GB limit Login IP $iplim Device"
            echo "-----------------------------------------------"
            echo ""
            exit
        fi
    done

}
log-ws() {
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m         log Xray/Vmess Account          \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vmess/.vmess.db")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo ""
        echo "   You have no existing clients!"
        echo ""
        exit 0
    fi
    until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
        echo -e " "
        read -rp "Input Username : " user
        CLIENT_EXISTS=$(grep -w $user /etc/vmess/.vmess.db | wc -l)

        if [[ ${CLIENT_EXISTS} == '0' ]]; then
            echo "No customer name available"
        else
            clear
            cat /var/log/xray/access.log | grep $user
            exit
        fi
    done
}
detail-ws() {
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m         Detail Xray/Vmess Account       \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vmess/.vmess.db")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo ""
        echo "   You have no existing clients!"
        echo ""
        exit 0
    fi

    until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
        echo -e " "
        read -rp "Input Username : " user
        CLIENT_EXISTS=$(grep -w $user /etc/vmess/.vmess.db | wc -l)

        if [[ ${CLIENT_EXISTS} == '0' ]]; then
            echo "No customer name available"
        else
            clear
            cat /etc/xray/log-create-${user}.log
            exit
        fi
    done
}
mem-ws() {
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m        Member Xray/Vmess Account        \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vmess/.vmess.db")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo ""
        echo "   You have no existing clients!"
        echo ""
        exit 0
    fi
    listmem=$(grep -s "^### " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2-3 | column -t | nl)
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m        Member Xray/Vmess Account        \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo "    NO  USERNAME     EXPIRED"    
    echo "    ------------------------"
    echo "$listmem"
    exit

}
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER VMESS              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreating a Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mDelete Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mRenew Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mCheck Vmess login Account${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mMember Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}6.${NC} \033[0;36mChnge Vmess limit Account${NC}"
echo -e "\033[1;93m│  ${grenbo}7.${NC} \033[0;36mLog Vmess login Account${NC}"
echo -e "\033[1;93m│  ${grenbo}8.${NC} \033[0;36mDetail Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}9.${NC} \033[0;36mTrial Vmess Account${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 9 ] : " menu
case $menu in
1) add-ws ;;
2) del-ws ;;
3) renew-ws ;;
4) cek-ws ;;
5) mem-ws ;;
6) chngelimit ;;
7) log-ws ;;
8) detail-ws ;;
9) trial-ws ;;
*)
    exit 0
    ;;
esac
