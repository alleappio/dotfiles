options=("option1" "option2" "option3" "Quit")
selection=0
options_length=$(( ${#options[@]}-1 ));
flag=1;
cleanup() {
    tput cnorm
}

display() {
    clear;
    echo "Please choose an option:";
    for i in ${!options[@]}; do
        if [ $i -eq $1 ]; then
            printf ">" 
        else
            printf " "
        fi;
        printf "${options[$i]}\n";
    done;
}

change_theme(){
    clear;
    echo "You selected: ${options[$selection]}";
    echo "Press any key to continue...";
    read -rsn1;
}

trap cleanup EXIT
tput civis
while [ $flag -ne 0 ]; do
    display $selection;
    read -rsn1 input;
    if [[ $input == $'\x1b' ]]; then
        read -rsn2 input;
        if [[ $input == "[A" ]]; then
            ((selection--));
            if [ $selection -lt 0 ]; then
                selection=$options_length;
            fi;
        elif [[ $input == "[B" ]]; then
            ((selection++));
            if [ $selection -gt $options_length ]; then
                selection=0;
            fi;
        fi;
    elif [[ $input = "" ]]; then
        if [ $selection -eq $options_length ]; then
            printf "Bye bye!\n";
            flag=0;
        else
            change_theme $selection;
        fi;
    fi;
done
