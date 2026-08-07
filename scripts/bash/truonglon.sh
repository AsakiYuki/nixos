function ftp-truonglon() {
    # deo quan tam ve van de bao mat, host nhu lon
    lftp -e "mirror --verbose $1 /home/asakiyuki/Downloads/truonglon/$2" -u "b24_42415981,J3dv72#&j2Y2ae^TaUmN" ftpupload.net
}