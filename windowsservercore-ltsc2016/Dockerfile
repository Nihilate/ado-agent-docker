FROM microsoft/windowsservercore:ltsc2016

ARG AGENT_VERSION=2.146.0
ARG AGENT_FILENAME=vsts-agent-win-x64-$AGENT_VERSION.zip
ARG MD5_CHECKSUM=bcb38f46de3b89fbbbd84eab41ca1d44

WORKDIR c:/setup
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Download the file
ADD https://vstsagentpackage.azureedge.net/agent/$AGENT_VERSION/$AGENT_FILENAME .

# Copy the required scripts
COPY VerifyChecksum.ps1 .
COPY InstallAgent.ps1 .
COPY ConfigureAgent.ps1 .

# Verify the file is what we think it is
RUN powershell .\VerifyChecksum.ps1

# Install the agent
RUN powershell .\InstallAgent.ps1

# Configure the agent
CMD powershell -noexit .\ConfigureAgent.ps1
