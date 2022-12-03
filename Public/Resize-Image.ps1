<#
.SYNOPSIS
    Resize-Image
.DESCRIPTION
    Resize an image and save it to the specified OutFile path.
.EXAMPLE
.INPUTS
.OUTPUTS
.NOTES
    Author: Fxbyy
.FUNCTIONALITY
    Resize an image and save it to the specified OutFile path.
#>
function Resize-Image {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $InFile,

        [Parameter(Mandatory = $true)]
        [string] $OutFile,

        [Parameter(Mandatory = $true)]
        [int] $Width,

        [Parameter(Mandatory = $true)]
        [int] $Height
    )
    
    begin {
        [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    }
    
    process {
        $img = [System.Drawing.Image]::FromFile((Get-Item $InFile))

        $resizedImage = New-Object System.Drawing.Bitmap($Width, $Height)

        $graphics = [System.Drawing.Graphics]::FromImage($resizedImage)
        $graphics.DrawImage($img, 0, 0, $Width, $Height)
        $graphics.Dispose()
    }
    
    end {
        $resizedImage.Save($OutFile)
        Write-Verbose "Resized image ($($Width)px * $($Height)px) and saved it to $OutFile."
    }
}