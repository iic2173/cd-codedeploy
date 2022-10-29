#!/bin/bash

deploymentId = $( echo '{"deploymentId": "d-PM6XM56SK"}' | jq '.deploymentId' )
echo "::set-output name=deploymentId::$deploymentId"