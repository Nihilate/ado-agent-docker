[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [string]$FolderName,

    [Parameter(Mandatory=$false)]
    [switch]$RunningOnADO
)

# Get the agent version from the Dockerfile
([string](Get-Content (Join-Path $FolderName "Dockerfile"))) -match "AGENT_VERSION\s*=\s*([\d\.]+)" > $null
$agentVersion = $Matches[1]

# Generate the image tag
$imageTag = "$agentVersion-$FolderName"

if ($RunningOnADO) {
    Write-Output "##vso[task.setvariable variable=imageTag;isOutput=true]$imageTag"
}
else {
    Write-Output $imageTag
}