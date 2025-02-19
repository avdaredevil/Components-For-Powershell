<#@=|AP-Component by AP for SSH Link opening flushed every $n = 1 seconds|=@#>
param($Refresh)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "")
# ========================================END=OF=COMPILER===========================================================|
if (![int32]::TryParse($Refresh,[ref]$null)) {$Refresh = 1}
function Global:cc_ssh-link-opener_teardown.private {
    if (!$cc_TearDown_Resources) {Write-AP-Wrapper "!This function can only be executed from within the Configure-Component context";return $False}
    kill ${Global:cc_component_data.ssh_links};return $true
}
if (${Global:cc_component_data.ssh_links}) {kill ${Global:cc_component_data.ssh_links}}
${Global:cc_component_data.ssh_links} = start -PassThru -NoNewWindow powershell ('-noprofile 
    $refresh = '+$Refresh+'
    $b=$Host.UI.RawUI;$c=[Console]
    $rec = [System.Management.Automation.Host.Rectangle]
    function c($x) {New-Object Management.Automation.Host.Coordinates $x} 
    function plc($t,$y=-1){
        if ($y -lt 0) {$y = [Console]::CursorTop}
        $d = $b.NewBufferCellArray(@($t),''Black'',''Blue'')
        $x = [Console]::BufferWidth-1-$t.length
        $b.SetBufferContents((c $x,$y),$d)}
    function get-last($n=0){
        $arr = @()
        $n..0 | % {
            $ll = $rec::new(0, ([Console]::CursorTop-$_), ([Console]::BufferWidth-1), ([Console]::CursorTop-$_))
            $arr += ,(($host.UI.RawUI.GetBufferContents($ll) | % character) -join '''').trim()
        }
        $arr
    }
    $lastTime = [Console]::CursorTop
    while ($true) {
        sleep $Refresh
        if ($lastTime -eq [Console]::CursorTop) {continue}
        $lines = get-last 2
        $i=$lines.length
        $lines | ? {$i--;($_ -notmatch ''AP-Console'') -and ($_ -match ''(?<url>https?://[\w\.]+(/\S+)?)'')} | % {
            explorer $Matches.url.trim(''.'')
            (plc ''<AP-Console> Opened Link!'' ([Console]::CursorTop-$i))
            # Write-Host -f yellow (''!''+$Matches.url.trim())
        }
    }
')

Write-AP-Wrapper "+Attached SSH-Link Agent Thread to AP-PShell"

