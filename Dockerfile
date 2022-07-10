FROM pihole/pihole:latest

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80/tcp

ENV TZ="America/Los_Angeles"
ENV WEBPASSWORD_FILE="/secrets/secret.txt"
ENV ADMIN_EMAIL="webmaster@mgamlem3.com"
ENV PIHOLE_DNS_="1.1.1.1;1.0.0.1"
ENV TEMPERATUREUNIT="f"
ENV WEBTHEME="default-auto"

COPY "secret.txt" "/secrets/"

RUN apt update -y
RUN apt install -y git
RUN apt install -y nano

WORKDIR /usr/local/bin
RUN git clone https://github.com/mgamlem3/pihole-cloudsync.git --branch dev
RUN git clone https://github.com/mgamlem3/my-pihole-lists.git
RUN ./pihole-cloudsync/pihole-cloudsync --initpull
