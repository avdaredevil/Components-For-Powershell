<#@=|AP-Component by AP for Clock display flushed every $n = 1 seconds|=@#>
param($Refresh)
# =======================================START=OF=COMPILER================================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.3) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ========================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
if($AP_CONSOLE.mode -ne 'main' -or $AP_CONSOLE.customFlags.runAsCompiled) {
    $Script:AP_CONSOLE = [PsCustomObject]@{version=[version]'1.3'; mode = 'shim'; customFlags = @{}}
    function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
    # This syntax is to prevent AV's from misclassifying this as anything but innocuous
    & (Get-Alias iex) (B64 "ZnVuY3Rpb24gR2V0LVBvd2VyU2hlbGxQcm9jZXNzUGF0aCB7DQogICAgaWYgKCRQU0NvbW1hbmRQYXRoKSB7DQogICAgICAgICMgSWYgcnVubmluZyBpbiBhIHNjcmlwdA0KICAgICAgICBpZiAoJFBTRWRpdGlvbiAtZXEgJ0NvcmUnKSB7DQogICAgICAgICAgICBHZXQtQ29tbWFuZCBwd3NoIHwgc2VsZWN0IC1FeHBhbmRQcm9wZXJ0eSBTb3VyY2UNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIEdldC1Db21tYW5kIHBvd2Vyc2hlbGwgfCBzZWxlY3QgLUV4cGFuZFByb3BlcnR5IFNvdXJjZQ0KICAgICAgICB9DQogICAgfSBlbHNlaWYgKCRob3N0LlZlcnNpb24uTWFqb3IgLWdlIDYpIHsNCiAgICAgICAgIyBQb3dlclNoZWxsIDYrIChDb3JlKQ0KICAgICAgICAkUFNIb21lICsgJy9wd3NoJyArICgnLmV4ZScsICcnKVskSXNMaW51eCAtb3IgJElzTWFjT1NdDQogICAgfSBlbHNlIHsNCiAgICAgICAgIyBXaW5kb3dzIFBvd2VyU2hlbGwNCiAgICAgICAgIiRQU0hvbWVccG93ZXJzaGVsbC5leGUiDQogICAgfQ0KfQo=")
} elseif($AP_CONSOLE.warnOnCompileRun) {& $AP_CONSOLE.warnOnCompileRun}
# ========================================END=OF=COMPILER=================================================================|
if (![int32]::TryParse($Refresh,[ref]$null)) {$Refresh = 1}
function Global:cc_clock_teardown.private {
    if (!$cc_TearDown_Resources) {Write-AP-Wrapper "!This function can only be executed from within the Configure-Component context";return $False}
    kill ${Global:cc_component_data.clock_thread};return $true
}
if (${Global:cc_component_data.clock_thread}) {kill ${Global:cc_component_data.clock_thread}}
${Global:cc_component_data.clock_thread} = start -PassThru -NoNewWindow (Get-PowerShellProcessPath) ('-noprofile -c
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

