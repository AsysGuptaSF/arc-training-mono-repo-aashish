aws eks update-kubeconfig --name refarchdevops-dev-devops-k8s-cluster --region ap-south-1
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
kubectl proxy
