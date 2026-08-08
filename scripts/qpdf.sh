function slice-pdf() {
    qpdf "$1" --pages . $3-$4 -- "$2"
}