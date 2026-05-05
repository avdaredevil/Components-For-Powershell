# =======================================START=OF=COMPILER================================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.3) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ========================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
if($AP_CONSOLE.mode -ne 'main' -or $AP_CONSOLE.customFlags.runAsCompiled) {
    $Script:AP_CONSOLE = [PsCustomObject]@{version=[version]'1.3'; mode = 'shim'; customFlags = @{}}
    function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
    # This syntax is to prevent AV's from misclassifying this as anything but innocuous
    & (Get-Alias iex) (B64 "")
} elseif($AP_CONSOLE.warnOnCompileRun) {& $AP_CONSOLE.warnOnCompileRun}
# ========================================END=OF=COMPILER=================================================================|
if (!$Global:_Fac_Table) {$Global:_Fac_Table = @{-1=0;0=1;1=1}}
function Global:f([int32]$x){$x=[Math]::Max($x,-1);if($Global:_Fac_Table[$x]){return $Global:_Fac_Table[$x]};$s = $x*(f ($x-1));return $Global:_Fac_Table[$x]=$s}
function Global:p($n,$r){$s=1;$n..($n-$r+1)|%{$s*=$_};$s}
function Global:co($n,$r){(p $n $r)/(f $r)}
function Global:pw($n,$p){[Math]::Pow($n,$p)}
Write-AP-Wrapper "x+Now Have: ["
"Factorial|f","Combination|co","Permutations|p","Power|pw" | % {Write-AP-Wrapper -noSign ("x!{0}({1})" -f $_.split("|"));if ($_[-1]-ne"w"){Write-AP-Wrapper -nosign "x*, "}else{Write-AP-Wrapper -nosign "*]"}}

