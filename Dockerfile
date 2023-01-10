# skipcq: DOK-DL3007
FROM pihole/pihole:latest

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80/tcp

COPY "github-secret.txt" "/secrets/"

RUN git config --global user.email "mgamlem3@gmail.com" \
	&& git config --global credential.helper '!f() { printf "%s\n" "username=mgamlem3" "password=`cat /secrets/github-secret.txt`"; };f'

ENV TZ="America/Los_Angeles"
ENV WEBPASSWORD_FILE="/secrets/secret.txt"
ENV ADMIN_EMAIL="webmaster@mgamlem3.com"
ENV DNSMASQ_LISTENING="eth0"
ENV PIHOLE_DNS_="1.1.1.1;1.0.0.1"
ENV TEMPERATUREUNIT="f"
ENV WEBTHEME="default-auto"

COPY "secret.txt" "/secrets/"

RUN apt-get install git --no-install-recommends
WORKDIR /usr/local/bin
RUN git clone https://github.com/mgamlem3/pihole-cloudsync.git \
	&& git clone https://github.com/mgamlem3/my-pihole-lists.git \
	&& ./pihole-cloudsync/pihole-cloudsync --initpull
