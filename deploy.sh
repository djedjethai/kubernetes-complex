docker build -t djedjethai/kubclient -f ./client/Dockerfile ./client
docker build -t djedjethai/kubserver -f ./server/Dockerfile ./server
docker build -t djedjethai/kubworker -f ./worker/Dockerfile ./worker
docker push djedjethai/kubclient
docker push djedjethai/kubserver
docker push djedjethai/kubworker
kubctl apply -f k8s

