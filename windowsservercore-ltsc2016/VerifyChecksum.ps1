if (((CertUtil -hashfile .\$env:AGENT_FILENAME MD5)[1] -replace ' ','') -ne "$env:MD5_CHECKSUM")
{
    throw 'The MD5 checksum for the agent doesn''t match!'
}