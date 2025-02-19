<#@=|AP-Component by AP for Clock display flushed every $n = 1 seconds|=@#>
param($Refresh)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gR2V0LVBvd2VyU2hlbGxQcm9jZXNzUGF0aCB7DQogICAgaWYgKCRQU0NvbW1hbmRQYXRoKSB7DQogICAgICAgICMgSWYgcnVubmluZyBpbiBhIHNjcmlwdA0KICAgICAgICBpZiAoJFBTRWRpdGlvbiAtZXEgJ0NvcmUnKSB7DQogICAgICAgICAgICBHZXQtQ29tbWFuZCBwd3NoIHwgU2VsZWN0LU9iamVjdCAtRXhwYW5kUHJvcGVydHkgU291cmNlDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBHZXQtQ29tbWFuZCBwb3dlcnNoZWxsIHwgU2VsZWN0LU9iamVjdCAtRXhwYW5kUHJvcGVydHkgU291cmNlDQogICAgICAgIH0NCiAgICB9IGVsc2VpZiAoJGhvc3QuVmVyc2lvbi5NYWpvciAtZ2UgNikgew0KICAgICAgICAjIFBvd2VyU2hlbGwgNisgKENvcmUpDQogICAgICAgICRQU0hvbWUgKyAnL3B3c2gnICsgKCcuZXhlJywgJycpWyRJc0xpbnV4IC1vciAkSXNNYWNPU10NCiAgICB9IGVsc2Ugew0KICAgICAgICAjIFdpbmRvd3MgUG93ZXJTaGVsbA0KICAgICAgICAiJFBTSG9tZVxwb3dlcnNoZWxsLmV4ZSINCiAgICB9DQp9Cg==")
# ========================================END=OF=COMPILER===========================================================|
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

