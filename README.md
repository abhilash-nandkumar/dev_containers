

Add User info to .env file.

``` bash
echo "UID=$(id -u)" > .env
echo "GID=$(id -g)" >> .env
echo "USERNAME=$(whoami)" >> .env
```

Build and Start container using 
```
docker compose build
docker compose up -d
```


To attach to the running container in other terminals
```
docker exec -it ros2-humble zsh
```
