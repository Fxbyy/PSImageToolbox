<#
 .SYNOPSIS
    Convert-ColorToImage
 .DESCRIPTION
    Converts a color code to a solid image.
 .EXAMPLE

 .INPUTS
 .OUTPUTS
 .NOTES
    Author: Fxbyy
 .FUNCTIONALITY
    Converts a color code to a solid image.
 #>
 
function Convert-ColorToImage {
    [CmdletBinding(DefaultParameterSetName = 'AutoSize')]
    param (
        [Parameter(Mandatory = $true)]
        [string] $OutFile,

        [Parameter(Mandatory = $false)]
        [int] $Width,

        [Parameter(Mandatory = $false)]
        [int] $Height,

        [Parameter(Mandatory = $false)]
        [int] $R,

        [Parameter(Mandatory = $false)]
        [int] $G,

        [Parameter(Mandatory = $false)]
        [int] $B
    )
 
    begin {
        Add-Type -AssemblyName System.Drawing
    }
 
    process {
        $bitmap = new-object System.Drawing.Bitmap $Width, $Height
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

        $color = [System.Drawing.Color]::FromArgb($R, $G, $B)

        $graphics.Clear($color)
        $graphics.DrawImage($bitmap, 0, 0, $Width, $Height)

        $graphics.Dispose() 
        $bitmap.Save($OutFile) 
    }
    
    end {

    }
}
