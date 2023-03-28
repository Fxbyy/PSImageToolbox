<#
.SYNOPSIS
    Invoke-RotateImage
.DESCRIPTION
.EXAMPLE
.INPUTS
.OUTPUTS
.NOTES
    Author: Fxbyy
.FUNCTIONALITY
#>
function Invoke-RotateImage {
    [CmdletBinding(DefaultParameterSetName = 'DefaultParameterSetName')]
    param (
        [Parameter(Mandatory = $true)]
        [string] $InFile,

        [Parameter(Mandatory = $true)]
        [ValidateScript({
            switch ($_) {
                90 {$true}
                180 {$true}
                270 {$true}
                default {throw "$_ is invalid. Valid values are 90, 180 or 270."}
            }
        })]
        [int] $RotationDegree,

        [Parameter(Mandatory = $false)]
        [ValidateScript({
            switch ($_) {
                "None" {$true}
                "X" {$true}
                "Y" {$true}
                "XY" {$true}
                default {throw "$_ is invalid. Valid values are None, X, Y, or XY."}
            }
        })]
        [string] $Flip
    )
    
    begin {
        [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    }
    
    process {
        $image = [System.Drawing.image]::FromFile($InFile)
    }
    
    end {
        
    }
}