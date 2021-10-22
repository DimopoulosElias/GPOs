#A lot of copy paste from here:
#https://social.technet.microsoft.com/Forums/en-US/fbc13862-9946-4333-a195-deb863ce078e/programmatically-powershell-adding-startupshutdown-scripts-to-a-group-policy?forum=winserverGP

#Run this script in the AD Powershell as DA. Don't forget to link the newly created GPO in order to take effect https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/link-the-gpo-to-the-domain

$gpo = New-GPO -Name Disable_LLMNR_mDNS_NBTNS -Comment "Disable LLMNR, mDNS, NBT-NS"
Start-Sleep -s 5
$guid = $gpo.id.ToString().ToUpper()
Write-Host "Group Policy Created: $guid"
$domain = Get-ADDomain
$forest = $domain.forest

md "C:\Windows\SYSVOL\sysvol\$forest\Policies\{$guid}\Machine\Scripts\Startup"
Copy-Item .\disableNetbios.ps1 "C:\Windows\SYSVOL\sysvol\$forest\Policies\{$guid}\Machine\Scripts\Startup"

$pshellscript = @"

[Startup]
0CmdLine=disableNetbios.ps1
0Parameters=
"@

$psfilename = "C:\Windows\SYSVOL\sysvol\$forest\Policies\{$guid}\Machine\Scripts\psscripts.ini"
$pshellscript | Out-File $psfilename -Encoding unicode
$psfile = Get-Item $psfilename -force
$psfile.attributes="Hidden"

$gptini = @"
[General]
Version=65537
displayName=New Group Policy Object
"@

$gptinifilename = "C:\Windows\SYSVOL\sysvol\$forest\Policies\{$guid}\GPT.ini"
$gptini | Out-File $gptinifilename -Encoding utf8

$gPCMachineExtensionNames = "[{42B5FAAE-6536-11D2-AE5A-0000F87571E3}{40B6664F-4972-11D1-A7CA-0000F87571E3}]"


$adgpo = ([adsisearcher]"(&(objectCategory=groupPolicyContainer)(name={$guid}))").FindAll().Item(0)
$gpoentry = $adgpo.GetDirectoryEntry()
$gpoentry.Properties["gPCMachineExtensionNames"].Value = $gPCMachineExtensionNames
$gpoentry.Properties["versionNumber"].Value = "2"
$gpoentry.CommitChanges()

Set-GPRegistryValue -Name Disable_LLMNR_mDNS_NBTNS -Key "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" -ValueName EnableMulticast -Type DWord -Value 0
