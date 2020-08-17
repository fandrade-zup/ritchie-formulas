#!/bin/sh
runDeleteNamespace() {
    echo $"$KUBECONFIG" > /tmp/kubeconfig-rit
    kubectl --kubeconfig /tmp/kubeconfig-rit delete namespace $1
}
