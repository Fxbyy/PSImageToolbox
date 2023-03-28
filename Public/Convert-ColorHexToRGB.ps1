<#
 .SYNOPSIS
    Convert-ColorHexToRgb
 .DESCRIPTION
    Converts a HEX color code to RGB color code.
 .EXAMPLE
    Convert-ColorHexToRgb -Hex "280996"
 .INPUTS
 .OUTPUTS
 .NOTES
    Author: Fxbyy
 .FUNCTIONALITY
    Converts a HEX color code to RGB color code.
 #>
 
function Convert-ColorHexToRgb {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory = $true)]
      [ValidateScript( { $_ -match "[A-Fa-f0-9]{6}" })]
      [string] $Hex
   )
 
   begin {

   }
 
   process {
      $hexRed = $Hex[0] + $Hex[1]
      $hexGreen = $Hex[2] + $Hex[3]
      $hexBlue = $Hex[4] + $Hex[5]

      $red = [convert]::ToInt32($hexRed, 16)
      $green = [convert]::ToInt32($hexGreen, 16)
      $blue = [convert]::ToInt32($hexBlue, 16)

      @($red, $green, $blue)
   }
    
   end {

   }
}
