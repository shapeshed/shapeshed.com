+++
date = "2017-01-25T01:01:00+00:00"
description = "How to deploy a new version of an image into a Kubernetes cluster"
slug = "rolling-deployments-with-kubernetes"
tags = ["Kubernetes", "Linux", "Unix"]
title = "Rolling deployments with Kubernetes"
+++

In a [previous post][6] I worked through getting a Kubernetes cluster up and
running on a local machine using [minikube][2]. Within this cluster I have one
deployment of a simple Hello World Go application.

```sh
kubectl get deployments
NAME       DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
hello-go   1         1         1            1           1d
```

How then do you deploy a new image? It is a simple case of updating an image
within a deployment.

```sh
kubectl set image deployment/hello-go hello-go=shapeshed/hello-go:latest
```

The status of a rollout can be checked as follows

```sh
kubectl set image rollout status deployment/hello-go
Waiting for rollout to finish: 0 of 1 updated replicas are available...
deployment "hello-go" successfully rolled out
```

If for whatever reason you need to rollback just update the image to an older
version.

```sh
kubectl setkubectl set image deployment/hello-go hello-go=shapeshed/hello-go:22ee0304
```

## Recording history

Deployment history can be recorded by either adding `--record` when a deployment
is created or by adding it to commands that modify a deployment. This provides
details on any amends made to a deployment and the command issued.

```sh
kubectl set image deployment/hello-go hello-go=shapeshed/hello-go:latest --record
```

Now the history of a deployment may be seen

```sh
    kubctl rollout history deployment hello-go
    REVISION        CHANGE-CAUSE
    1               kubectl set image deployment/hello-go hello-go=shapeshed/hello-go:22ee0304 --record
    2               kubectl set image deployment/hello-go hello-go=shapeshed/hello-go:latest --record
```

A deployment may be rolled back as follows

```sh
kubectl rollout undo deployment hello-go
```

## Summary

I have worked with most deployment tools - from FTP to Capistranoto Git
post-receive hooks. Kubernetes offers a super simple way to update a deployment
that can easily be integrated into Continuous Deployment workflows. Given that
it is just containers that are being deployed there is a guaranteed idempotent
version of an application. That makes Continuous Deployment far less risky and
increases the possibility of shipping code to customers faster. A win all round.

## Further reading

- [Kubernetes Deployments documentation][1]
- [Kubernetes - Rolling updates with deployment][3]
- [How to rollout or rollback a deployment on a Kubernetes cluster?][4]
- [Rolling Updates and Rollbacks using Kubernetes Deployments][5]

[1]: https://kubernetes.io/docs/user-guide/deployments/
[2]: https://github.com/kubernetes/minikube
[3]: https://tachingchen.com/blog/Kubernetes-Rolling-Update-with-Deployment/
[4]:
  https://romain.dorgueil.net/blog/en/tips/2016/08/27/rollout-rollback-kubernetes-deployment.html
[5]:
  https://www.linux.com/learn/rolling-updates-and-rollbacks-using-kubernetes-deployments
[6]: https://shapeshed.com/getting-started-with-kubernetes/
