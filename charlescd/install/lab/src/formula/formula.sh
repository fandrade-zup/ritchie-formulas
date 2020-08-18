#!/bin/sh
runFormula() {
  echo $"$KUBECONFIG" > /tmp/kubeconfigcharlesinstalllab
  if which wget ; then
    if wget -O /tmp/charles-single-file.yaml https://raw.githubusercontent.com/ZupIT/charlescd/master/install/helm-chart/single-file.yaml ; then
      echo "file saved"
    else
      echo "error while downloading charles file, verify your connection and try again"
      exit 1
    fi
  else
    echo "you have to install wget first"
  fi
  if [ $HOSTNAME != "charles.info.example" ] ; then
    echo "updating hostname..."
    sed -i -E "s/(charles\.info\.example)/$HOSTNAME/" /tmp/charles-single-file.yaml
  else
    $HOSTNAME="charles.info.example"
  fi
  if which kubectl ; then
    kubectl --kubeconfig /tmp/kubeconfigcharlesinstalllab create ns charles
    kubectl --kubeconfig /tmp/kubeconfigcharlesinstalllab -n charles apply -f /tmp/charles-single-file.yaml
  else
    echo "you have to install kubectl first"
    exit 1
  fi
  echo -e "\n\n\n"
  echo "Now run the following command:"
  echo "kubectl get svc -n charles nginx"
  echo "from the output copy the external IP and add to your /etc/hosts file a new line with:"
  echo "xxx.xxx.xxx.xxx $HOSTNAME"
  echo "where the xxx.xxx.xxx.xxx will be your external IP get from the earlier step"
}
