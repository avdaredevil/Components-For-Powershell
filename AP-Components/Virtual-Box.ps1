param([Switch]$Silent)
$PyD = @((item C:\Program*\Oracle\VirtualBox,C:\AP-Progs\Virtua*Box).FullName)[-1]
if (!$PyD) {Throw "VirtualBox Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Virtual-Box [$(vbox-img.exe -v)] for AP-PShell Management Console!"}
rv PYD
