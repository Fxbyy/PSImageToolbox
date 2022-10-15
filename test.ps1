$Params = @{ 
    "Path"                 = 'D:\02_Coding\PowerShell\PSImageToolbox\PSImageToolbox\PSImageToolbox.psd1' 
    "Author"               = 'Fxbyy' 
    "RootModule"           = 'PSImageToolbox.psm1' 
    "CompatiblePSEditions" = @('Desktop', 'Core') 
    "FunctionsToExport"    = @('Convert-ColorHexToRGB', 'Convert-ColorToImage', 'Convert-ImageToAscii', 'Resize-Image') 
    "CmdletsToExport"      = @() 
    "VariablesToExport"    = '' 
    "AliasesToExport"      = @() 
    "Description"          = 'A few PowerShell Cmdlets to work (or play) with images, colors etc.' 
} 
New-ModuleManifest @Params