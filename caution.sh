
docker stop $(docker ps -a -q)
docker volume prune
echo "Elimiando imagenes"
docker rmi $(docker images -q) -f
echo "Eliminando contenedores"
docker rm $(docker ps -a -q) -f 
