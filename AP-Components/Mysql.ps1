$PyD = @((item C:\Program*\My*Sql*\bin,C:\AP-Langs\My*Sql*\bin).FullName)[-1]
if (!$PyD) {Throw "Mysql (Workbench) Does not Exist on System!";exit}
A2Path $PyD
function Global:Kill-SQL() {mysqladmin -u root shutdown}
function Global:Connect-SQL($name="MyDB", $host="localhost", $User, $Psw) {mysql --host=$host --user=$User --password=$Psw $name}
if (!$Silent) {Write-AP "+Configured Mysql (Workbench) for AP-PShell Management Console!"}
rv PYD