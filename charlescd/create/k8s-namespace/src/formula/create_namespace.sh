#!/bin/sh
runCreateNamespace() {
    echo $"$KUBECONFIG" > /tmp/kubeconfig-rit
    kubectl --kubeconfig /tmp/kubeconfig-rit create namespace $1

    if [ "$2" == "yes" ]; then
        echo "Enabling Istio on namespace $1"
        kubectl --kubeconfig /tmp/kubeconfig-rit label namespace $1 istio-injection=enabled
    else
        echo "Istio will not be enable on namespace $1"
    fi
}
