docker build -t djedjethai/kubclient:latest -t djedjethai/kubclient:$SHA -f ./client/Dockerfile ./client
docker build -t djedjethai/kubserver:latest -t djedjethai/kubserver:$SHA -f ./server/Dockerfile ./server
docker build -t djedjethai/kubworker:latest -t djedjethai/kubworker:$SHA -f ./worker/Dockerfile ./worker

docker push djedjethai/kubclient:latest
docker push djedjethai/kubserver:latest
docker push djedjethai/kubworker:latest

docker push djedjethai/kubclient:$SHA
docker push djedjethai/kubserver:$SHA
docker push djedjethai/kubworker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=djedjethai/kubserver:$SHA
kubectl set image deployments/client-deployment client=djedjethai/kubclient:$SHA
kubectl set image deployments/worker-deployment worker=djedjethai/kubworker:$SHA
