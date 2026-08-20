[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet(
        'GOOGLE_ADS_DEVELOPER_TOKEN',
        'GOOGLE_ADS_LOGIN_CUSTOMER_ID',
        'GOOGLE_ADS_CLIENT_CUSTOMER_ID'
    )]
    [string]$Name,

    [SecureString]$Value,

    [string]$VaultPath = (Join-Path $env:LOCALAPPDATA 'AdMcpTool\google-ads-mcp.secrets.clixml')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not $Value) {
    $Value = Read-Host -Prompt "Enter $Name" -AsSecureString
}

$vaultDirectory = Split-Path -Parent $VaultPath
if (-not (Test-Path -LiteralPath $vaultDirectory)) {
    New-Item -ItemType Directory -Path $vaultDirectory -Force | Out-Null
}

if (Test-Path -LiteralPath $VaultPath) {
    $vault = Import-Clixml -LiteralPath $VaultPath
    if (-not $vault.Secrets) {
        throw "Vault format is invalid: $VaultPath"
    }
}
else {
    $vault = [pscustomobject]@{
        Version = 1
        Secrets = [pscustomobject]@{}
    }
}

$entry = $vault.Secrets.PSObject.Properties[$Name]
if ($entry) {
    $entry.Value = $Value
}
else {
    $vault.Secrets | Add-Member -NotePropertyName $Name -NotePropertyValue $Value
}

$temporaryVaultPath = "$VaultPath.tmp"
try {
    $vault | Export-Clixml -LiteralPath $temporaryVaultPath -Force
    Move-Item -LiteralPath $temporaryVaultPath -Destination $VaultPath -Force
}
catch {
    throw "Windows DPAPI could not encrypt the vault for the current profile. Run this in the interactive Windows user session that will start the MCP server, or use your organization secret manager. Inner error: $($_.Exception.Message)"
}
finally {
    if (Test-Path -LiteralPath $temporaryVaultPath) {
        Remove-Item -LiteralPath $temporaryVaultPath -Force
    }
}

Write-Host "Saved encrypted secret '$Name' to the current user's local DPAPI vault."
