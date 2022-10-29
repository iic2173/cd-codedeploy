#!/bin/bash

deploymentId=$( echo '{"deploymentId": "d-PM6XM56SK"}' | jq '.deploymentId' )
echo "{deploymentId}={$deploymentId}"