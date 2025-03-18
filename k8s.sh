#raplica
kubectl -n dev delete rs myapp
kubectl delete replicaset sample
kubectl create -f replica-set.yaml
kubectl apply -f replica-set.yaml
kubectl scale --replicas=3 -f replica-set.yaml
kubectl scale --replicas=5 replicaset myapp
kubectl -n dev scale -f replica-set.yaml --replicas=2
kubectl -n dev edit rs myapp -o yaml

#port-forward
kubectl port-forward nginx 8000:80


#labels
kubectl get pod --show-labels
kubectl -n dev get pod --show-labels
kubectl -n dev get rs --show-labels
kubectl get po -n dev -l "run=pods"
watch kubectl -n dev get pods

#namespace
kubectl create namespace dev
kubectl get ns


#deploy
kubectl apply -f deployment.yaml -n dev
kubectl -n dev delete deployment deploy
kubectl -n dev scale --replicas=4 deployment deploy
kubectl -n dev scale --replicas=1 -f deployment.yaml

#run pod
kubectl -n dev run app --image=nginx 
kubectl -n dev delete po -l "run=app"


#svc
kubectl -n dev apply -f svc.yml
kubectl port-forward svc/ngx 8088
kubectl get ep -n dev:80



#
kubectl apply -f jfrog-ns.yaml
kubectl apply -f jfrog-svc.yaml
kubectl apply -f jfrog-deploy.yaml
kubectl apply -f jfrog-ingress.yaml


#secrets
kubectl edit serviceaccount default -n test
kubectl -n test create secret docker-registry pmovideo --docker-server="https://index.docker.io/v1/" --docker-username="monafdas" --docker-password="dckr_pat_r89i_Gte3h3oLtbMG-7vD5wcN3Q"
kubectl -n pmo create secret docker-registry lcpsecret --docker-server="https://index.docker.io/v1/" --docker-username="zahlat" --docker-password="DockerHub2024"
kubectl create -n test secret docker-registry regcred --docker-server="https://index.docker.io/v1/" --docker-username="mohalisol" --docker-password="dckr_pat_hibjhhrKs7DYB_DAIQHp1kGbRgc"
imagePullSecrets:
- name: baeldung-secret


kubectl logs -l app=nginx
watch kubectl -n test logs -l app=jvb
kubectl exec -it jvb-8697c4d74b-6n52j bash



#context cluster
kubectl config get-contexts
export KUBECONFIG=/home/stark/.kube/k3s.yaml



#helm
helm list -n test
helm install video helmvideo  -n test
helm upgrade video helmvideo -n test
helm rollback video -n test
helm history video -n test
helm uninstall video -n test
helm install video helmvideo --dry-run --debug -n test # check test

#Switched to context k3s-dev.
kubectl config use-context k3s-dev


#Switched to context docker.
kubectl config use-context docker-desktop


#instal kubectl
sudo snap install kubectl --classic
sudo snap install helm --classic

#auto complete k8s

cat <<'EOF' >> ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
EOF

#reload
source ~/.bashrc


#create dockerconfig.json
create file name dockerconfig.json and put
{
  "auths": {
    "https://hub.infostrategic.com": {
      "username": "ammar.moulla",
      "password": "hi",
      "auth": "bW9uYWYghhdg6SCV6aGfgQ4QGg5ZA=="
    }
  }
}
cat dockerconfig.json | base64 -w 0


#restart k3s
systemctl restart k3s.service


