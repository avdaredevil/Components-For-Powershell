<#@=|AP-Component by AP for Clock display flushed every $n = 1 seconds|=@#>
param($Refresh)
if (![int32]::TryParse($Refresh,[ref]$null)) {$Refresh = 1}
function Global:cc_clock_teardown.private {
    if (!$cc_TearDown_Resources) {Write-AP-Wrapper "!This function can only be executed from within the Configure-Component context";return $False}
    kill ${Global:cc_component_data.clock_thread};return $true
}
if (${Global:cc_component_data.clock_thread}) {kill ${Global:cc_component_data.clock_thread}}
${Global:cc_component_data.clock_thread} = start -PassThru -NoNewWindow powershell ('-noprofile 
    $b=$Host.UI.RawUI;$c=[Console]
    function c($x) {New-Object Management.Automation.Host.Coordinates $x} 
    function plc($t){
        $d = $b.NewBufferCellArray(@($t),''Yellow'',$c::BackgroundColor)
        $b.SetBufferContents((c 0,0),$d)}
    while ($true) {
        $DATA = (Get-Date).ToString(''G'')
        if ($DATA) {plc ($DATA)} else {plc ''Cannot Fetch Time''}
        sleep '+$Refresh+'
    }
')

Write-AP-Wrapper "+Attached Clock Thread to AP-PShell"
