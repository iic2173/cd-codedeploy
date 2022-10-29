#!/bin/bash

deploymentId=$( echo '{"deploymentId": "d-PM6XM56SK"}' | jq -r '.deploymentId' )
echo "deploymentId=$deploymentId"