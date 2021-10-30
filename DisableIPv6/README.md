# DisableIPv6GPO GPO

Video which presents how to do it on your own:

[![IMAGE ALT TEXT](http://img.youtube.com/vi/3BGEjiN13bo/0.jpg)](http://www.youtube.com/watch?v=3BGEjiN13bo "Disable IPv6")

A detailed explanation of the video can be found in my corresponding post :

https://www.linkedin.com/pulse/how-making-pentesters-life-difficult-part-1-elias-dimopoulos/

## DisableIPv6GPO.htm

This file describes the properties and the policy settings for the specified Group Policy Object (GPO).

If you want to manually create the GPO you can use this file.

## DisableIPv6GPO.ps1

Run this PS Script in an AD Powershell, with a user who can ceate a GPO (e.g Domain Admin), and it will create the GPO for you. 

In order to use the GPO, you have to manually link it:

To link the GPO to the domain container in Active Directory

1. Open the Group Policy Management console.

2. In the navigation pane, expand Forest: YourForestName, expand Domains, and then expand YourDomainName.

3. Right-click YourDomainName, and then click Link an Existing GPO.

4. In the Select GPO dialog box, select the GPO that you want to deploy, and then click OK.

5. The GPO appears in the Linked Group Policy Objects tab in the details pane and as a linked item under the domain container in the navigation pane.

6. You can adjust the order of the linked GPOs to ensure that the higher priority GPOs are processed last. Select a GPO and click the up or down arrows to move it. The GPOs are processed by the client device from the highest link order number to the lowest.

Ref: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/link-the-gpo-to-the-domain

## disableIPv6.ps1

This script will be executed in every machine which has received the GPO, in the next reboot.

It contains the command which will disable the IPv6.


# Important Note

Ensure that you are not going to break something, because you blindly followed these articles or executed these PS files.

Ref: https://docs.microsoft.com/en-US/troubleshoot/windows-server/networking/configure-ipv6-in-windows
