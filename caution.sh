echo "---------------------------------------------"
echo "| STOP DOCKER                               |"
echo "---------------------------------------------"

docker stop $(docker ps -a -q)
docker volume prune

echo "---------------------------------------------"
echo "| DROP ALL IMAGES                           |"
echo "---------------------------------------------"


docker rmi $(docker images -q) -f

echo "---------------------------------------------"
echo "| DROP ALL CONTAINTERS                       |"
echo "---------------------------------------------"


docker rm $(docker ps -a -q) -f 
