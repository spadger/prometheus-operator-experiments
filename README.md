# Some experiments with Prometheus Kubernetes operators

## Wut?
Prometheus can be deployed to kubernetes with a Deployment & Service, like any other app, but some nice folks have also created a k8s operator and CRDs to define a prometheus setup as well [take a look](https://github.com/prometheus-operator/prometheus-operator).

This is just some stuff thrown together to configure a private K8s instance on my laptop for:
 * A simple app
 * The Prometheus Operator &  CRDs
 * some RBAC stuff
 * The k8s UI
