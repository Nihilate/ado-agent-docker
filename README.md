# Self-Hosted Azure DevOps Agents in Docker

## What is this repo for?

This repository contains Dockerfiles which will allow you to create images for self-hosted [build and release agents for Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/agents?view=azdevops).

## How do I run these images?

You can tweak the settings for performance as required, but a basic example might look something like this:

`docker run -d -m 4GB --storage-opt size=100GB -e "ADO_URL=https://dev.azure.com/JupiterMiningCorporation" -e "ADO_PAT=FAKETOKEN" -e "ADO_POOL_NAME=windows-agents" -e "ADO_AGENT_NAME=red-dwarf" nihilate/ado-agent:2.144.0-windowsservercore-ltsc2016`

The example above would start a v2.144.0 agent running on Windows Server Core called `red-dwarf` and add it to the `windows-agents` agent pool within the JupiterMiningCorporation organisation (using `FAKETOKEN` to authenicate).

The following environment variables are required by the container in order to run successfully:

* ADO_URL - The URL of your ADO instance. This will usually match the following pattern: `https://dev.azure.com/{your organization}`.
* ADO_PAT - The [personal access token](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azdevops)  (PAT) you want the agent to use to authenticate. The PAT will need the **Agent Pools (read, manage)** scope selected.
* ADO_POOL_NAME - The [agent pool](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/pools-queues?view=azdevops) you want to add this agent to. The pool will need to be created in advance.
* ADO_AGENT_NAME - The name of your agent.