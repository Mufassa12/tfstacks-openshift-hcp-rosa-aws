# terraform k8s provider


provider "kubernetes" {
    username = var.username
    password = var.password
    host     = var.host
}

# provider "aws" {
#   region = "ap-southeast-1"
# }
# data "aws_eks_cluster_auth" "example" {
#   name =  "2ia9qfuruad03j42cd2ck25r8jp91nmi"
# }

# data "aws_eks_cluster" "example" {
#   name = "rosa-dev-cluster"
# }

# output "auth" {
#   value = nonsensitive(data.aws_eks_cluster_auth.example.token)
# }

# output "cluster" {
#   value = nonsensitive(data.aws_eks_cluster.example)
# }

# data "kubernetes_namespace" "default" {
#   metadata {
#     name = "default"
#   }
# }

# output "namespace" {
#   value = data.kubernetes_namespace.default.metadata[0].name 
# }

# │ Error: namespaces "default" is forbidden: User "system:anonymous" cannot get resource "namespaces" in API group "" in the namespace "default"
# │ 
# │   with data.kubernetes_namespace.default,
# │   on main.tf line 18, in data "kubernetes_namespace" "default":
# │   18: data "kubernetes_namespace" "default" {



