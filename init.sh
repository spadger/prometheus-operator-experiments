kubectx docker-desktop

# Apps
kubectl create namespace apps
kubectl -n apps apply -f noddyapp.yaml

# Prometheus
kubectl apply -f operators.yaml
kubectl create namespace monitoring
kubectl apply -n monitoring -f prometheus-rbac.yaml
kubectl apply -n monitoring -f prometheus.yaml

# Dashboard
kubectl create namespace kubernetes-dashboard
kubectl apply -f k8s-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.1.0/aio/deploy/recommended.yaml
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" | pbcopy


echo "The k8s token has been copied to your pasteboard"
kubectl proxy &
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/