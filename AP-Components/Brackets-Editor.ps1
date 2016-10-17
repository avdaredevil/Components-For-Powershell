param([Switch]$Silent)
$PyD = @((item C:\Program*\Brackets,C:\AP-Progs\Brackets).FullName)[-1]
if (!$PyD) {Throw "Brackets-Editor Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Brackets-Editor for AP-PShell Management Console!"}
rv PYD
