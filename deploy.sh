docker build -t alk3mist/multi-client:latest -t alk3mist/multi-client:"$SHA" -f ./client/Dockerfile ./client
docker build -t alk3mist/multi-server:latest -t alk3mist/multi-server:"$SHA" -f ./server/Dockerfile ./server
docker build -t alk3mist/multi-worker:latest -t alk3mist/multi-worker:"$SHA" -f ./worker/Dockerfile ./worker

docker push alk3mist/multi-client:latest
docker push alk3mist/multi-server:latest
docker push alk3mist/multi-worker:latest

docker push alk3mist/multi-client:"$SHA"
docker push alk3mist/multi-server:"$SHA"
docker push alk3mist/multi-worker:"$SHA"

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=alk3mist/multi-client:"$SHA"
kubectl set image deployments/server-deployment server=alk3mist/multi-server:"$SHA"
kubectl set image deployments/worker-deployment worker=alk3mist/multi-worker:"$SHA"
