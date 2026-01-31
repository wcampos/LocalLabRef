# Storage (Cluster)

![Kubernetes](https://cdn.simpleicons.org/kubernetes/326CE5)

Cluster-wide **StorageClass** for local PersistentVolumes. Use this when your cluster does not provide a default storage provisioner (e.g. bare-metal, MicroK8s without hostpath-storage).

## What it does

- **local-storage** – StorageClass with `kubernetes.io/no-provisioner`
- **WaitForFirstConsumer** – PV binding deferred until a pod uses the PVC
- **Manual PVs** – You must create PersistentVolumes for each PVC

## When to use

- MicroK8s: consider `microk8s enable hostpath-storage` instead
- Bare-metal: create PVs pointing to local paths or NFS
- Development: use hostpath or local-path provisioner if available

## Deploy

```bash
kubectl apply -f namespace.yaml
kubectl apply -f storageclass.yaml
```

## Create PVs

For each PVC (e.g. `pvc-adguard`), create a matching PV with `storageClassName: local-storage` and a `local` volume pointing to a host path or NFS.

## References

- [Kubernetes Storage](https://kubernetes.io/docs/concepts/storage/)
