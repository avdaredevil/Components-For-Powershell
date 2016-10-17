<#@=|AP-Component by AP for IP-Address display flushed every $n = 5 seconds|=@#>
param($Refresh)
if (![int32]::TryParse($Refresh,[ref]$null)) {$Refresh = 5}
start -NoNewWindow powershell ('
    $b=$Host.UI.RawUI;$c=[Console]
    function c($x) {New-Object Management.Automation.Host.Coordinates $x} 
    function plc($t){
        $d = $b.NewBufferCellArray(@($t),''Yellow'',$c::BackgroundColor)
        $b.SetBufferContents((c ($c::WindowWidth-$t.length-1),0),$d)}
    while ($true) {
        $IP = Get-WmiObject Win32_NetworkAdapterConfiguration -Namespace ''root\CIMV2'' | ? IPEnabled
        if ($IP) {plc (''IP: ''+@($IP)[0].IPAddress[0])} else {plc ''Offline''}
        sleep '+$Refresh+'
    }
')

Write-AP-Wrapper "+Attached IP-Address Thread to AP-PShell"
