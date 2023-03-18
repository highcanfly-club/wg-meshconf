# wg-meshconf
wg-meshconf minimalist docker image

# Howto
## Init
```sh
mkdir wg
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf init
```

## Add a standard peers
```sh
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf  addpeer master --address 10.18.0.1/32 --endpoint 1.2.3.4 --listenport 51820
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf  addpeer worker1 --address 10.18.0.2/32 --endpoint 1.2.3.5 --listenport 51820
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf  addpeer worker2 --address 10.18.0.3/32 --endpoint 1.2.3.6 --listenport 51820
```

## Show peers
```sh
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf showpeers
```

## Generate config
```sh
docker run -v ./wg:/home/wgmeshconf -it highcanfly/wg-meshconf genconfig
```

## distribute config
```sh
scp wg/output/master.conf root@1.2.3.4:/etc/wireguard/wg0.conf
scp wg/output/worker1.conf root@1.2.3.5:/etc/wireguard/wg0.conf
scp wg/output/worker2.conf root@1.2.3.6:/etc/wireguard/wg0.conf
```

## activate config on systemd
```sh
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0
```