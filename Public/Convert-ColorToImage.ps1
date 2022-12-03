<#
 .SYNOPSIS
    Convert-ColorToImage
 .DESCRIPTION
    Converts a color code to a solid image.
 .EXAMPLE
    Convert-ColorToImage -OutFile "C:\test.jpg" -Width 256 -Height 256 -RGB @(40, 9, 150)
 .INPUTS
 .OUTPUTS
 .NOTES
    Author: Fxbyy
 .FUNCTIONALITY
    Converts a color code to a solid image.
 #>
 
function Convert-ColorToImage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $OutFile,

        [Parameter(Mandatory = $false)]
        [int] $Width,

        [Parameter(Mandatory = $false)]
        [int] $Height,

        # [Parameter(Mandatory = $false)]
        # [int] $R,

        # [Parameter(Mandatory = $false)]
        # [int] $G,

        # [Parameter(Mandatory = $false)]
        # [int] $B,

        [Parameter(Mandatory = $false)]
        [int[]] $RGB
    )
 
    begin {
      Add-Type -AssemblyName System.Drawing
    }
 
    process {
      $bitmap = new-object System.Drawing.Bitmap $Width, $Height
      $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

      $color = [System.Drawing.Color]::FromArgb($RGB[0], $RGB[1], $RGB[2])

      $graphics.Clear($color)
      $graphics.DrawImage($bitmap, 0, 0, $Width, $Height)

      $graphics.Dispose() 
    }
    
    end {
      Write-Verbose "Saved the image to $OutFile."
      $bitmap.Save($OutFile) 
    }
}
