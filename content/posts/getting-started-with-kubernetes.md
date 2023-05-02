+++
date = "2017-01-25T01:00:00+00:00"
description = "How to get started with using Kubernetes on a local machine using minikube"
slug = "getting-started-with-kubernetes"
tags = ["Kubernetes", "Linux", "Unix"]
title = "Getting started with Kubernetes"
+++

Over the last few weeks I have been learning [Kubernetes][1]. Here is how I got
set up and started learning.

To experiment with Kubernetes I used [minikube][2] to run a local cluster. This
has dependencies of [virtualbox][3] and [kubectl][4].

On Arch Linux [minkube][5] and [kubectl][4] may be installed from the AUR.
Virtualbox is available in the core Arch Linux repositories. Once installed a
Kubernetes cluster can be started as follows.

```sh
minikube start
Starting local Kubernetes cluster...
Kubectl is now configured to use the cluster.
```

Note that this can take some time to complete. Once complete some information
can be gathered about the cluster.

```sh
kubectl cluster-info
Kubernetes master is running at https://192.168.99.101:8443
KubeDNS is running at https://192.168.99.101:8443/api/v1/proxy/namespaces/kube-system/services/kube-dns
kubernetes-dashboard is running at https://192.168.99.101:8443/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard
```

Kubernetes ships with a dashboard that can be viewed as follows

```sh
minikube dashboard
```

Whilst it is possible to manage and deploy applications through the dashboard I
prefer the command line! Nevertheless the dashboard is useful to visualise
quickly what you have and it would be useful for teams to serve as a dashboard.

![Kubenetes dashboard][8]

## Deploying an image

Now the cluster is running an image can be deployed into it. I used a Hello
World web server written in Go that I had already created and pushed into the
public registry.

### Deploy an image

```sh
kubectl run hello-go --image=shapeshed/hello-go --port=8000
```

### Expose the deployment

```sh
kubectl expose deployment hello-go --type=NodePort
```

### Get the status of the pod

```sh
kubectl get pod
NAME                       READY     STATUS   RESTARTS   AGE
hello-go-772128995-1x5wj   1/1       Running  0          12m
```

### Discover the URL of the service

```sh
minikube service hello-go --url
```

Visiting the URL serves the application through Kubernetes.

![hello go][9]

## Summary

Getting Kubernetes up and running on Arch Linux was really straightforward and I
found the documentation to be fantastic. I now have an environment where I can
experiment with exploring more of what Kubernetes can do.

## Further reading

- [minikube README][6]
- [kubernetes documentation][7]

[1]: https://kubernetes.io/
[2]: https://github.com/kubernetes/minikube
[3]: https://www.virtualbox.org/
[4]: https://aur.archlinux.org/packages/kubectl-bin/
[5]: https://aur.archlinux.org/packages/minikube/
[6]: https://github.com/kubernetes/minikube/blob/master/README.md
[7]: https://kubernetes.io/docs/
[8]: /images/articles/kubernetes-dashboard.webp "Kubernetes dashboard"
[9]: /images/articles/hello-go.webp "Hello Go web server"
