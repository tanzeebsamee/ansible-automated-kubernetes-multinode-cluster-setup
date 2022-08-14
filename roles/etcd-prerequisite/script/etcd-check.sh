export PEER_NAME=$(hostname)
export PRIVATE_IP=$(ip addr show ens192 | grep -Po 'inet \K[\d.]+')

cd /etc/etcdk8s/ssl/
/usr/local/bin/cfssl print-defaults csr > config.json
sed -i 's/www\.example\.net/'"$PRIVATE_IP"'/' config.json
sed -i 's/example\.net/'"$PEER_NAME"'/' config.json
sed -i '0,/CN/{s/example\.net/'"$PEER_NAME"'/}' config.json
/usr/local/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server config.json | /usr/local/bin/cfssljson -bare server
/usr/local/bin/cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=peer config.json | /usr/local/bin/cfssljson -bare peer
