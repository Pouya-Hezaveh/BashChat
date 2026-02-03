source ./lib/colors.sh

warn() {
    echo -e "${WARN}${*}${NC}"
}

error() {
    echo -e "${ERROR}${*}${NC}"
}

info() {
    echo -e "${INFO}${*}${NC}"
}

ask() {
    # -n ==> Don't print endline
    echo -n -e "${ASK}${*}${NC}"
}

success() {
    # -n ==> Don't print endline
    echo -e "${SUCCESS}${*}${NC}"
}

greet() {
    # -n ==> Don't print endline
    echo -e "${GREET}${*}${NC}"
}
