version: "3"

services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
	network_mode: host
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "8085:80/tcp"
      - "4434:443/tcp"
    environment:
      TZ: 'America/Sao_Paulo'
    volumes:
      - './etc-pihole/:/etc/pihole/'
      - './etc-dnsmasq.d/:/etc/dnsmasq.d/'
    dns:
      - 127.0.0.1
      - 1.1.1.1
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
