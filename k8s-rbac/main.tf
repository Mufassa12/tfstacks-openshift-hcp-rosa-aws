
# odic-identity pre-requisite

# data "kubernetes_namespace" "example" {
#   metadata {
#     name = "kube-system"
#   }
# }

# data "aws_eks_cluster_auth" "example" {
#   name =  "2i6vh00537t32a8d9igh8hgo10dpijt5"
# }
# resource "kubernetes_cluster_role_binding_v1" "oidc_role" {
#   metadata {
#     generate_name = "odic-identity"
#   }

#   role_ref {
#     api_group = "rbac.authorization.k8s.io"
#     kind      = "ClusterRole"
#     name      = "cluster-admin"
#   }
#   subject {
#     api_group = "rbac.authorization.k8s.io"
#     kind      = "Group"
#     name      = var.tfc_organization_name
#   }
# }