FROM mysql:5.6
LABEL maintainer "Cheewai Lai <cheewai.lai@gmail.com>"
COPY set-mysql-uid.sh /usr/local/bin/set-mysql-uid.sh
ENTRYPOINT ["/usr/local/bin/set-mysql-uid.sh"]
