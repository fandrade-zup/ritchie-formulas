#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")"/formula/create_namespace.sh --source-only
#In sh for receive inputs of CLI use: $SAMPLE_TEXT, $SAMPLE_LIST and $SAMPLE_BOOL for this example

runCreateNamespace "$NAMESPACE" "$ENABLE_ISTIO"
