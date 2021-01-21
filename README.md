# Some experiments with Prometheus Kubernetes operators

## Wut?
Prometheus can be deployed to kubernetes with a Deployment & Service, like any other app, but some nice folks have also created a k8s operator and CRDs to define a prometheus setup as well [take a look](https://github.com/prometheus-operator/prometheus-operator).

This is just some stuff thrown together to configure a private K8s instance on my laptop for:
 * A simple app
 * The Prometheus Operator &  CRDs
 * some RBAC stuff
 * The k8s UI

## How?
Run 
 1. The script uses [kubectx](https://github.com/ahmetb/kubectx) to switch k8s contexts
 1. Ensure you have a kubernetes install running.  I use the docker-desktop one on my mac
 1. Run `./init.sh`, which will configure everything for you, including:
  * All k8s resources
  * running kubectl proxy
  * Copying the k8s-UI access-token to your clipboard
  * Opening the k8s UI in your default browser