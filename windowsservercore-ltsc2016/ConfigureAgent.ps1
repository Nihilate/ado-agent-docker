$url = $env:ADO_URL
$token = $env:ADO_PAT
$pool = $env:ADO_POOL_NAME
$agentName = $env:ADO_AGENT_NAME

Write-Verbose -Verbose "Configuring agent $agentName for pool $pool"

.\config.cmd --unattended `
            --url $url  `
            --auth pat  `
            --token $token  `
            --pool $pool  `
            --agent $agentName  `
            --acceptteeeula `
            --replace `
            --gituseschannel

.\run.cmd