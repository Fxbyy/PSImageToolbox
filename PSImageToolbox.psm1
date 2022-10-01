# Getting public and private function files
$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse)

foreach ($import in @($Public + $Private)) {
    try {
        . $import.FullName
    } catch {
        Write-Error "[PSImageToolbox] Failed to import function $($import.FullName): $_"
    }
}

# Importing config
$PSImageToolboxPath = $PSScriptRoot
$PSImageToolboxConfig = Get-Content "$PSImageToolboxPath\Include\config.json" | ConvertFrom-Json -Verbose

# Loading Functions
Export-ModuleMember -Function $Public.Basename -Verbose

Export-ModuleMember -Variable "PSImageToolboxPath" -Verbose
Export-ModuleMember -Variable "PSImageToolboxConfig" -Verbose