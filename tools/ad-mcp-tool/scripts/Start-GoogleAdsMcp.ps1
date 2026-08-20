[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ServerCommand,

    [string[]]$ServerArguments = @(),

    [string]$VaultPath = (Join-Path $env:LOCALAPPDATA 'AdMcpTool\google-ads-mcp.secrets.clixml')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $VaultPath)) {
    throw "Encrypted Google Ads MCP vault was not found. Run Save-GoogleAdsMcpSecret.ps1 first."
}

$vault = Import-Clixml -LiteralPath $VaultPath
if (-not $vault.Secrets) {
    throw "Vault format is invalid: $VaultPath"
}

$originalValues = @{}
$serverExitCode = 1
try {
    foreach ($property in $vault.Secrets.PSObject.Properties) {
        if ($property.Name -notmatch '^GOOGLE_ADS_(DEVELOPER_TOKEN|LOGIN_CUSTOMER_ID|CLIENT_CUSTOMER_ID)$') {
            throw "Unexpected secret name in vault: $($property.Name)"
        }

        if ($property.Value -isnot [SecureString]) {
            throw "Vault value for $($property.Name) is not a SecureString."
        }

        $originalValues[$property.Name] = [Environment]::GetEnvironmentVariable($property.Name, 'Process')
        $plainValue = [System.Net.NetworkCredential]::new('', $property.Value).Password
        [Environment]::SetEnvironmentVariable($property.Name, $plainValue, 'Process')
        $plainValue = $null
    }

    & $ServerCommand @ServerArguments
    if ($null -eq $LASTEXITCODE) {
        $serverExitCode = 0
    }
    else {
        $serverExitCode = $LASTEXITCODE
    }
}
finally {
    foreach ($name in $originalValues.Keys) {
        [Environment]::SetEnvironmentVariable($name, $originalValues[$name], 'Process')
    }
}

exit $serverExitCode
