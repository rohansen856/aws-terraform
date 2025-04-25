provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  namespace  = "ingress-nginx"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.10.0"

  create_namespace = true

  values = [
    <<EOF
controller:
  service:
    annotations:
      service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    targetPorts:
      http: http
      https: https
EOF
  ]
}
