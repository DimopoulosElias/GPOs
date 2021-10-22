# Disable_LLMNR_mDNS_NBTNS Policy

## Disable_LLMNR_mDNS_NBTNS.htm

This files describes the properties and the policy settings for the specified Group Policy Object (GPO).

If you want to manually create the GPO you can use this file 

## Disable_LLMNR_mDNS_NBTNS.ps1

This run this powershell and it will create the GPO. 

In order to use the GPO, you habe to manually link it:

To link the GPO to the domain container in Active Directory

1. Open the Group Policy Management console.

2. In the navigation pane, expand Forest: YourForestName, expand Domains, and then expand YourDomainName.

3. Right-click YourDomainName, and then click Link an Existing GPO.

4. In the Select GPO dialog box, select the GPO that you want to deploy, and then click OK.

5. The GPO appears in the Linked Group Policy Objects tab in the details pane and as a linked item under the domain container in the navigation pane.

6. You can adjust the order of the linked GPOs to ensure that the higher priority GPOs are processed last. Select a GPO and click the up or down arrows to move it. The GPOs are processed by the client device from the highest link order number to the lowest.


Ref: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/link-the-gpo-to-the-domain

# Important Note

Before you turn off WINS/NetBT name resolution, verify that you don't need to use WINS or earlier NetBT-type applications for this network connection. For example, you can turn off WINS/NetBT name resolution if you communicate only with other that run a product in Windows Server 2003 (Microsoft Windows XP, or Microsoft Windows 2000) that use DNS and that register their names with DNS, or if you communicate with Internet computers using DNS-aware applications. Do not turn off WINS/NetBT name resolution if you communicate with computers that run a version of Windows that may use WINS or earlier NetBT-type applications (such as Microsoft Windows NT, Microsoft Windows Millennium Edition, Microsoft Windows 98, or Microsoft Windows 95).

Ref: https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/configure-tcpip-networking-netbios-turn-off
