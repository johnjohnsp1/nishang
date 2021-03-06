<#
.SYNOPSIS
Nishang Payload to convert a PE file in hex format to executable

.DESCRIPTION
This payload converts a PE file in hex to executable.

.PARAMETER Filename
Name of the hex text file from which  executable will be created.

.PARAMETER EXE
Name of the created executable

.EXAMPLE
PS > .\TexttoExe.ps1 evil.text evil.exe

.LINK
http://www.exploit-monday.com/2011/09/dropping-executables-with-powershell.html
http://code.google.com/p/nishang
#>




Param ( [Parameter(Position = 0, Mandatory = $True)] [String] $Filename, [Parameter(Position = 1, Mandatory = $True)] [String]$EXE)
function TexttoEXE
{
[string]$hexdump = get-content -path "$Filename"
[Byte[]] $temp = $hexdump -split ' '
[System.IO.File]::WriteAllBytes("$EXE", $temp)
}
TexttoEXE