# argoworkflows-test

## Start 

Make sure you have [Kind](https://kind.sigs.k8s.io/) installed.

Install the [Argo CLI](https://github.com/argoproj/argo-workflows/releases/tag/v3.4.3)

From the root of your cloned repo, execute:

```
./run.sh
```

## Submit workflow

From the root of your cloned repo, execute:
```
argo submit -n argo workflows/suspend-on-check-failure.yaml
```

## Clean up

From the root of your cloned repo, execute:
```
./delete.sh
```