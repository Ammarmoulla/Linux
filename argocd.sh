#setup argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get po -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

#install CLI
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd

#add cluster
argocd cluster list
argocd cluster add --kubeconfig <path-of-kubeconfig-file> --kube-context string <cluster-context> --name <cluster-name>
#or
argocd cluster add local # if kubeconfig in ~/.kube/config

#check cont
argocd cluster get local
argocd cluster rm local