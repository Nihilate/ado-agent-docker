Write-Verbose -Verbose "Extracting deployment agent"
Add-Type -AssemblyName System.IO.Compression.FileSystem ; 
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:AGENT_FILENAME", "$PWD")