# terraform-nginx-service-mesh
terraform-nginx-service-mesh

https://docs.nginx.com/nginx-service-mesh/tutorials/observability/

```
terraform init
terraform plan
terraform apply
```

This setup also deploys the following:  
Kubernetes Dashboard
```
How to Access
kubectl proxy

Go to 
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/ 

Use this command to get a token
kubectl -n kubernetes-dashboard create token admin-user
```
