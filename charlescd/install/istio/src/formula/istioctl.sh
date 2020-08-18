#!/bin/bash
runIstioctl() {
    if [ "$1" = "yes" ]; then
        echo "Istioctl installation..."

        curl -L https://istio.io/downloadIstio | sh -
        mkdir -p ~/.rit-programs/bin
        rm -rf "$HOME/.rit-programs/istio-$ISTIO_VERSION/"
        mv "istio-$ISTIO_VERSION/" ~/.rit-programs
        rm $HOME/.rit-programs/bin/istioctl
        ln -sf $HOME/.rit-programs/istio-$ISTIO_VERSION/bin/istioctl $HOME/.rit-programs/bin/istioctl
    else
        echo "Skipping Istioctl installation..."
    fi
}

runIstioctlInstall() {
    echo $"$KUBECONFIG" > /tmp/kubeconfig-rit
    if [ "$2" == "1.4.10" ]; then
        $HOME/.rit-programs/istio-$ISTIO_VERSION/bin/istioctl --kubeconfig /tmp/kubeconfig-rit manifest apply --set profile="$1"
    fi
    if [ "$2" == "1.6.8" ]; then
        $HOME/.rit-programs/istio-$ISTIO_VERSION/bin/istioctl --kubeconfig /tmp/kubeconfig-rit install --set profile="$1"
    fi
}
