docker build -t niteshks/multik8s-client:latest -t niteshks/multik8s-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t niteshks/multik8s-server:latest -t niteshks/multik8s-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t niteshks/multik8s-worker:latest -t niteshks/multik8s-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push niteshks/multik8s-client:latest
docker push niteshks/multik8s-client:$GIT_SHA
docker push niteshks/multik8s-server:latest
docker push niteshks/multik8s-server:$GIT_SHA
docker push niteshks/multik8s-worker:latest
docker push niteshks/multik8s-worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=niteshks/multik8s-server:$GIT_SHA
kubectl set image deployments/client-deployment client=niteshks/multik8s-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=niteshks/multik8s-worker:$GIT_SHA