#kubectx docker-desktop

# Apps
echo "Deploying apps..."
kubectl create namespace apps
kubectl -n apps apply -f noddyapp.yaml
echo "Deploying apps - done!"

# Monitoring
echo "Getting ready to deploy monitoring stack..."
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "Getting ready to deploy monitoring stack - done!"

echo "Deploying the monitoring stack..."
helm install -f values.yaml prometheus-stack prometheus-community/kube-prometheus-stack
echo "Deploying the monitoring stack - done!"

# Dashboard
kubectl create namespace kubernetes-dashboard
kubectl apply -f k8s-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.1.0/aio/deploy/recommended.yaml
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" | pbcopy


echo "The k8s token has been copied to your pasteboard"
kubectl proxy &

echo "small pause before opening services..."
sleep 5

open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
open http://localhost:30090
open http://localhost:30903