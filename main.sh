
if [ ! -f "alist" ];then
  #download alist lastest
  curl -L https://github.com/alist-org/alist/releases/download/v2.6.3/alist-linux-amd64.tar.gz -o alist-linux-amd64.tar.gz
  tar -zxvf alist-linux-amd64.tar.gz
  rm -f alist-linux-amd64.tar.gz
  mv alist-linux-musl-amd64 alist
  chmod +x alist

  #download config(listen on port 3000)
  mkdir data
  cd data
  cat > config.json <<EOF
{
  "force": false,
  "address": "0.0.0.0",
  "port": 3000,
  "assets": "/",
  "local_assets": "",
  "sub_folder": "",
  "database": {
    "type": "sqlite3",
    "host": "",
    "port": 0,
    "user": "",
    "password": "",
    "name": "",
    "db_file": "data/data.db",
    "table_prefix": "x_",
    "ssl_mode": ""
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "cache": {
    "expiration": 60,
    "cleanup_interval": 120
  },
  "temp_dir": "data/temp"
}
EOF

fi
#启动alist
./alist -docker
