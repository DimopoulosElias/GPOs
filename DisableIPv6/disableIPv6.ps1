$regkey = "HKLM:SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
Set-ItemProperty -Path "$regkey" -Name DisabledComponents -Value 255 -Verbose