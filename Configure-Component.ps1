<#
|==============================================================================>|
   Configure-Component by APoorv Verma [AP] on 10/23/2015
|==============================================================================>|
      $) Polyfill Inspired Logic for Connecting Components
      $) Teardown mechanism added
      $) Auto Path Switching
      $) Component shared and dynamic args ability
      $) Alias based component resolution
      $) Custom Components added
|==============================================================================>|
#>
param($Component="All-Langs",$Preference,[Switch]$List,[Switch]$Silent,[Switch]$ThrowErrors,[Switch]$InRecurse,[Switch]$Debug,[Alias("Teardown")][Switch]$Remove)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.1] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("QzpcVXNlcnNcQXBvb3J2XERlc2t0b3BcUFNIZWxsPUM6XFVzZXJzXEFwb29ydlxEZXNrdG9wXFBTSGVsbDtmdW5jdGlvbiBJbnB1dC1Qcm9tcHQge3BhcmFtKFtWYWxpZGF0ZU5vdE51bGxvckVtcHR5KCldW1N0cmluZ10kUHJvbXB0ID0gIkVudGVyIFRleHQgOiAiKQ0KDQogICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lICRQcm9tcHQNCiAgICAkUmVSZWdYID0gJ1teXHgwMS1ceDA4XHgxMC1ceDgwXSsnIydbXlx3XC5dJyBb0JAt0Y/QgdGRXQ0KICAgICRUclN0cmluZyA9ICIiDQogICAgJGlQb3N4ID0gW0NvbnNvbGVdOjpDdXJzb3JMZWZ0DQogICAgJGlQb3N5ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3ANCiAgICAkQ3ZpcyA9IFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRGYWxzZQ0KICAgICRDb3VudCA9IDE7JFNsZWVwID0gMA0KICAgIFdoaWxlICgkVHJ1ZSkgew0KICAgICAgICBpZiAoJGNvdW50IC1ndCA1MDApIHskU2xlZXAgPSAxMDB9DQogICAgICAgIGlmICgkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5RG93bixOb0VjaG8iKTskQ291bnQ9MDskU2xlZXA9MH0gZWxzZSB7JENvdW50Kys7U3RhcnQtU2xlZXAgLW0gJFNsZWVwO2NvbnRpbnVlfQ0KICAgICAgICBpZiAoS2V5UHJlc3NlZCAifn5CYWNrU3BhY2V+fiIgJFN0b3JlKSB7aWYgKCRzdG9yZS5Db250cm9sS2V5U3RhdGUgLW1hdGNoICJjdHJsIikgeyRUclN0cmluZz0iIn0gZWxzZSB7JFRyU3RyaW5nID0gPzogKCRUclN0cmluZy5MZW5ndGggLWVxIDApeyIifXskVHJTdHJpbmcuc3Vic3RyaW5nKDAsJFRyU3RyaW5nLkxlbmd0aC0xKX19fQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+U3BhY2V+fiIgJFN0b3JlKSB7JFRyU3RyaW5nICs9ICIgIn0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVzY2FwZX5+IiAkU3RvcmUpIHskVHJTdHJpbmc9IiI7YnJlYWt9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5FTlRFUn5+IiAkU3RvcmUpIHtXcml0ZS1Ib3N0ICIiO2JyZWFrfSBlbHNlIA0KICAgICAgICB7JFRyU3RyaW5nICs9ICRTdG9yZS5DaGFyYWN0ZXIgLXJlcGxhY2UgKCRSZVJlZ1gsJycpfQ0KICAgICAgICAkd3QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoIC0gJFByb21wdC5sZW5ndGggLSAxDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRpUG9zeA0KICAgICAgICBbQ29uc29sZV06OkN1cnNvclRvcCA9ICRpUG9zeQ0KICAgICAgICBpZiAoJHd0LSRUclN0cmluZy5MZW5ndGggLWx0IDApIHsNCiAgICAgICAgICAgICR0Yj0iIg0KICAgICAgICAgICAgJHR0PSIuLi4iKyRUclN0cmluZy5zdWJzdHJpbmcoJFRyU3RyaW5nLkxlbmd0aC0kd3QrMykNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICR0Yj0iICIqKCR3dC0kVHJTdHJpbmcuTGVuZ3RoKQ0KICAgICAgICAgICAgJHR0PSRUclN0cmluZw0KICAgICAgICB9DQogICAgICAgICRmY29sID0gW2NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3INCiAgICAgICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lIC1mICRmQ29sICR0dCRUYg0KICAgIH0NCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpcw0KICAgIHJldHVybiAkVFJTdHJpbmcNCn0KIGZ1bmN0aW9uIFByb2Nlc3MtVHJhbnNwYXJlbmN5IHtwYXJhbShbQWxpYXMoIlRyYW5zcGFyZW5jeSIsIkludmlzaWJpbGl0eSIsImkiLCJ0IildW1ZhbGlkYXRlUmFuZ2UoMCwxMDApXVtpbnRdJFRyYW5zPTAsIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV0kUHJvY2VzcykNCg0KICAgIGlmICgkUHJvY2VzcyAtbWF0Y2ggIlwuZXhlJCIpIHskUHJvY2VzcyA9ICRQcm9jZXNzLnJlcGxhY2UoIi5leGUiLCIiKX0NCiAgICBUcnkgew0KICAgICAgICBpZiAoJFByb2Nlc3MubmFtZSkgeyRQcm9jID0gJFByb2Nlc3MubmFtZX0gZWxzZSB7JFByb2MgPSAoR2V0LVByb2Nlc3MgJFByb2Nlc3MgLUVycm9yQWN0aW9uIFN0b3ApWzBdLm5hbWV9DQogICAgfSBjYXRjaCB7DQogICAgICAgIGlmIChbSW50XTo6VHJ5UGFyc2UoJFByb2Nlc3MsIFtyZWZdMykpIHskUHJvYyA9ICgoR2V0LVByb2Nlc3MgfCA/IHskXy5JRCAtZXEgJFByb2Nlc3N9KVswXSkubmFtZX0NCiAgICB9DQogICAgaWYgKCRQcm9jIC1ub3RNYXRjaCAiXC5leGUkIikgeyRQcm9jID0gIiRQcm9jLmV4ZSJ9DQogICAgbmlyY21kIHdpbiB0cmFucyBwcm9jZXNzICIkUHJvYyIgKCgxMDAtJFRyYW5zKSoyNTUvMTAwKSB8IE91dC1OdWxsDQp9CiBmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpDQoNCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+XERlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPlxBUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+XEFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQogZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCkNCg0KICAgIGlmICghJEVudjpQYXRoKSB7cmV0dXJuIEAoKX0NCiAgICAkRW52OlBhdGggPSAoJEVudjpQYXRoIC1yZXBsYWNlKCI7KyIsIjsiKSAtcmVwbGFjZSgiXFw7fFxcJCIsIjsiKSkudHJpbSgiOyIpDQogICAgJEVudjpQYXRoID0gKCgkRW52OlBhdGgpLnNwbGl0KCI7IikgfCBzZWxlY3QgLXVuaXF1ZSkgLWpvaW4oIjsiKQ0KICAgICRkID0gKCRFbnY6UGF0aCkuc3BsaXQoIjsiKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KIGZ1bmN0aW9uIElzLUFmZmlybWF0aXZlIHtwYXJhbSgkVGV4dCkNCiRlYWggPSAiW2V1YV0qW3Boc10qIjtyZXR1cm4gJFRleHQgLW1hdGNoICJeKD8hPW5vK3QgKikoKD8hPW4ke2VhaH0pYSp5KyR7ZWFofXxhZmZpcnxwb3NpdGl2ZXxvZmY/IGNvdXJzZSkifQogZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KIGZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbD17fSwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBbYm9vbF0kU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICB7aWYgKCRNYXRjaGVzWzFdIC1uZSAid2hlcmUiKXtBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHskTU9ERT0yfX1lbHNleyRNT0RFPTJ9O2lmICgkTU9ERS0yKXtHZXQtV2hlcmUgJE1hdGNoZXNbMV19ZWxzZXt0cnl7JiAkTWF0Y2hlc1sxXSAiL2ZqZmRqZmRzIC0tZHNqYWhkaHMgLWRzamFkaiIgMj4kbnVsbDsic3VjYyJ9Y2F0Y2h7fX19DQogICAgICAgICJebGliOiguKikiICB7JEZpbGU9JE1hdGNoZXNbMV07JExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZSIpIC1vciAodGVzdC1wYXRoIC10IGxlYWYgIiRMaWJcJEZpbGUuZGxsIil9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkU3RhdH0NCn0KIGZ1bmN0aW9uIFdyaXRlLUFQIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsIFtTd2l0Y2hdJE5vU2lnbiwgW1N3aXRjaF0kUGxhaW5UZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JywgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7cmV0dXJuICRUZXh0IHw/eyIkXyJ9fCAlIHtXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ259fQ0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXSkoPzx3Pi4qKSIpIHtXcml0ZS1BUCAkVGV4dDskVGV4dH0NCiAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoOw0KICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSczJzsnIyc9J0RhcmtHcmF5J31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgIGlmICgkUGFzc1RocnUpIHskRGF0YX0NCn0KIGZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykge2lmICghJGEpIHtjb250aW51ZX07aWYgKCRhLkdldFR5cGUoKS5OYW1lIC1lcSAiU2NyaXB0QmxvY2siKSB7JGEgPSAkYS5pbnZva2UoKTtpZiAoISRhKXtjb250aW51ZX19O3JldHVybiAkYX19CiBmdW5jdGlvbiBSZW1vdmUtRnJvbVBhdGgge3BhcmFtKFtTdHJpbmddJEZvbGRlcj0iIikNCg0KICAgIGlmICghJEZvbGRlcikge3JldHVybn0NCiAgICAkRW52OlBhdGggPSAoR2V0LVBhdGggfCA/IHskXyAtaW5lICRGb2xkZXJ9KSAtam9pbigiOyIpDQp9CiBmdW5jdGlvbiBQcmludC1MaXN0IHtwYXJhbSgkeCwgW1N3aXRjaF0kSW5SZWN1cnNlKQ0KDQogICAgaWYgKCR4LmNvdW50IC1sZSAxKSB7cmV0dXJuID86KCRJblJlY3Vyc2UpeyR4fXsiWyR4XSJ9fSBlbHNlIHsNCiAgICAgICAgcmV0dXJuICJbJCgoJHggfCAlIHtQcmludC1MaXN0ICRfIC1JblJlY3Vyc2V9KSAtam9pbiAnLCAnKV0iDQogICAgfQ0KfQogZnVuY3Rpb24gQWRkLVRvUGF0aCB7cGFyYW0oW1ZhbGlkYXRlUGF0dGVybigiLi4qIildW1N0cmluZ10kRm9sZGVyID0gJFBXRCwgW0FsaWFzKCJwIiwicHJlIiwiYmFjayIpXVtzd2l0Y2hdJFByZXBlbmQpDQoNCiAgICB0cnkgeyRGb2xkZXIgPSBSZXNvbHZlLVBhdGggJEZvbGRlciAtRXJyb3JBY3Rpb24gU3RvcH0gY2F0Y2gge1Rocm93ICJbQVAtUGF0aDpBZGRdIEZvbGRlciBbJEZvbGRlcl0gRG9lcyBub3QgRXhpc3QifQ0KICAgIGlmIChUZXN0LVBhdGggJGZvbGRlciAtdHlwZSBsZWFmKSB7VGhyb3cgIltBUC1QYXRoOkFkZF0gSW5wdXQgWyRGb2xkZXJdIG11c3QgYmUgYSBmb2xkZXIhIn0NCiAgICBpZiAoJEZvbGRlciAtaW4gKEdldC1QYXRoKSkge3JldHVybn0NCiAgICBpZiAoISRQcmVwZW5kKSB7JEVudjpQYXRoICs9ICI7JEZvbGRlciJ9IGVsc2UgeyRFbnY6UGF0aCA9ICIkRm9sZGVyOyQoJEVudjpQYXRoKSJ9DQp9CiBmdW5jdGlvbiBHZXQtV2hlcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlKV1bc3RyaW5nXSRGaWxlLCBbU3dpdGNoXSRBbGwpDQoNCiAgICBBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHt0aHJvdyAiTmVlZCBTeXMzMlx3aGVyZSB0byB3b3JrISI7cmV0dXJufQ0KICAgICRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbA0KICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgIHJldHVybiBAKCRPdXQpWzBdDQp9CiBTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnkgU2V0LUFsaWFzIGludiBQcm9jZXNzLVRyYW5zcGFyZW5jeSBTZXQtQWxpYXMgQTJQYXRoIEFkZC1Ub1BhdGggU2V0LUFsaWFzIFJGUCBSZW1vdmUtRnJvbVBhdGg=")))
# ========================================END=OF=COMPILER===========================================================|

AP-Require "function:Get-Path" {Write-AP "!Get-Path needs to be configured to use this command";exit}
function Recurse-Me($arr) {$arr | % {& $PSCommandPath $_ $Preference -List:$List -Silent:$Silent -ThrowErrors:$ThrowErrors -Debug:$Debug -InRecurse}}
function Process-Throw($s,$l=1) {if(!$s.Exception.WasThrownFromThrowStatement){JS-OR $s.Exception.InnerException.Message $s.Exception.message}else{$s=$s.Exception;if ($l -eq 2) {$s = $s.message};$s}}
function Process-Invoke($c,$s,$l=1) {if(!$ThrowErrors){Write-AP "x!Could not attach component ","nx+$c","xn! [","xn#$(Process-Throw $s $l)","n!]"}else{Throw (Process-Throw $S)}}
function Component-Alias($al) {JS-OR $Script:AliasDB.$al $al}
function Component-Version($v) {if ($v) {"[$v]"}}
function Get-CC-TearDown {
    return @{
        removeFuncs={param($RGX);ls FUnction:|? Name -Match $RGX | Remove-Item}
    }
}
function Get-Prefs($Pref,$Me) {if (!$Pref) {return};if ($Pref.GetType().name -eq "Hashtable") {JS-OR $Pref.$Me $Pref."$($AliasDBRev.$Me)"} else {$Pref}}
function Negate-Path($Namespace,$Filter) {Get-Path $Namespace | ? {$_ -match [Regex]::escape($Filter)} | % {RFP $_}}
$Script:AliasDB = @{
    "DrRacket"="Racket"
    "RB"="Ruby"
    "PY"="Python"
    "Mongo"="MongoDB"
}
<#@AP-COMPILER: extra-deps(?:)@#>
$Script:AliasDBRev = @{};@($AliasDB.Keys) | % {$Script:AliasDBRev.($AliasDB.$_) = $_}
$Components = @{
    C = {
        param($NoPrepend)
        $NoPrepend = !!$NoPrepend
        $PyD = "C:\AP-Langs\Cygwin\bin"
        if (!(test-path $Pyd)) {Throw "AP-Langs\CYGWIN Does not Exist on System!";exit}
        A2Path $Pyd -Prepend:(!$NoPrepend)
        AP-Require "dep:gcc" {Write-AP "!Seems like your cygwin/path directory does not have GCC please fetch.";exit}
        $Env:TERM="cygwin";$Env:ANSICON="true";$Env:CYGWIN = "nodosfilewarning notitle glob"
        $Env:CygFolder = Split-Path "$PyD"
        if (!$Silent) {Write-AP "+Configured C for AP-PShell Management Console!"}
        function Global:Compile-C ($Programs, $As) {
            if (!$Programs) {
                $t = @(ls *.c | Select Name,Length,LastWriteTime)
                $Programs = $(if ($t.length -eq 1) {
                    $t.name
                    Write-AP "*Found only 1 C File, will compile!"
                } else {
                    Write-AP "!Please Select programs to Compile"
                    ($t | Out-GridView -PassThru -Title "Select Program to Compile").Name
                })
            }
            if (!$Programs) {Write-AP "!None, Selected, Quit";return}
            foreach ($p in $Programs) {
                if ($p.substring($p.length-2) -ne ".c") {$p = "$p.c"}
                if (!(Test-Path $p)) {Write-AP "!Program [$p] Does Not Exist"}
                if (!$As) {$As = $p -replace ".c"}
                if ($As -notMatch "\.exe") {$As = "$As.exe"}
                $Compile = @{}
                Write-AP "*Compiling [$p]"
                $Compile.Output = gcc -Wall -g -I "$($Env:CygFolder)\usr\x86_64-w64-mingw32\sys-root\mingw\include" -o $As $P 2>&1 | ? {"$_" -and "$_".trim() -and $_ -notMatch "find_fast_cwd|public mailing"} | % {
                    if ($_ -is [System.Management.Automation.ErrorRecord]) {"$_".split("`n") | % {if ($_) {$_}} | % {$Compile.Errors += ,"$_"}} else {"$_".split("`n") | % {if ($_) {$_}}}
                }
                $global:c = $compile
                if ($Compile.Output) {Write-AP ">+Output:";$Compile.Output | % {Write-AP ">>*$_"}}
                function FormatError($msg) {
                    if ($Global:Foliate) {$tt = ">"} else {$tt = ""}
                    if ($msg -notmatch "[^\:]\.c+\:((?<Ln>\d+)\:(?<Char>\d+)\:)?( ?)+((?<type>(error|warning|note))\: ?)?(?<msg>.+)( ?)+$") {return}
                    if ($Matches.ln) {$Ret = "On Ln {0} Chr {1} | {2}" -f $Matches["Ln","Char","msg"]}
                    else {$Ret = $Matches["msg"]}
                    $Sign = "-"
                    if ($Matches["msg"] -like "In function*") {$Sign = "*";$tt = "";$Global:Foliate = $true}
                    if ($Matches.type -eq "warning") {$Sign = "!"}
                    if ($Matches.type -eq "note") {$Sign = "*"}
                    return "$tt$Sign$Ret" -replace "G�[��]","'"
                }
                if ($Compile.Errors) {Write-AP ">!Errors:";$Compile.Errors | % {Write-AP (">>{0}" -f (FormatError $_))}}
                rv Foliate -scope Global -ea SilentlyContinue;del "Function:\FormatError"
            }
        }rv PYD}
    Racket = {
        $PyD = @((item C:\Program*\Racket,C:\AP-Langs\Racket-Scheme).FullName)[-1]
        if (!$PyD) {Throw "Dr. Racket Does not Exist on System!";exit}
        A2Path $PyD
        if (!$Silent) {Write-AP "+Configured Dr. Racket for AP-PShell Management Console!"}
        rv PYD}
    Git = {
        $PyD = "$Home\AppData\Local\GitHub\shell.ps1"
        if (!(test-path $Pyd)) {Throw "Git Does not Exist on System!";exit}
        & $PyD
        function Global:Git-Rebase ([Switch]$Silent) {
            pushd (cmd /c where msys-1.0.dll)
            $addr = "0x$(3..7 | Get-Random)0000000"
            rebase.exe -b $addr msys-1.0.dll
            if (!$Silent) {Write-AP "+Rebased DLL to address [$addr]"}
            popd
        }
        function Global:branches{git branch | % {$_.substring(2)}}
        function Global:master{branches | ? {$_ -eq "master"} | % {git checkout $_}}
        function Global:gh-pages{branches | ? {$_ -eq "gh-pages"} | % {git checkout $_}}
        function Global:Git-NextVersion([Parameter(Mandatory=$True)]$Message) {
            $Version = "v0.0.1"
            if (@(git tag)[-1] -match "^(?<pre>\w+)(?<Major>\d)+\.(?<Minor>\d)+\.(?<Version>\d)+") {
                if ([int32]$Matches.Version -lt 9) {$Matches.Version=[int32]$Matches.Version+1}
                elseif ([int32]$Matches.Minor -lt 9) {$Matches.Minor=[int32]$Matches.Minor+1;$Matches.Version=0}
                else {$Matches.Major=[int32]$Matches.Major+1;$Matches.Minor=$Matches.Version=0}
                $Version = "{0}{1}.{2}.{3}" -f $Matches["pre","Major","Minor","Version"]
            }
            Write-AP -n "x!Confirm Upgrade to Version [";Write-AP -n "x*$Version";Write-AP -n "!]:"
            if (Is-Affirmative (Input-Prompt "[y/N]:: ")) {Git-SetTag $Version $Message}
        }
        function Global:Git-SetTag([Parameter(Mandatory=$True)]$Version,[Parameter(Mandatory=$True)]$Message,[switch]$Force) {
            if ($Version -in (git tag)) {
                if(!$Force) {Write-AP "!Tag [$version] already created, user -force to re-version.";return}
                git tag -d $Version;git push origin :refs/tags/$Version
            }
            git tag -a $Version -m $Message;git push --tags
        }
        if (!$Silent) {Write-AP "+Configured Git Console for AP-PShell Management Console!"}
        rv PYD}
    Go = {
        $PyD = @((item C:\Go*,C:\AP-Langs\Go*).FullName)[-1]
        if (!$PyD) {Throw "Go-Lang Does not Exist on System!";exit}
        A2Path $PyD\bin
        if (!$Silent) {Write-AP "+Configured Go-Lang for AP-PShell Management Console!"}
        $env:GOPATH = ($env:GOROOT = $PyD)+"\bin"
        rv PYD}
    Java = {
        $x86 = Test-Path "C:\Program Files (x86)"
        $PF = "C:\Program Files$(if ($x86) {' (x86)'})"
        $JavaD = @((item "$PF\Java\jre*").Name)[-1]
        if (!$JavaD) {Throw "Java Does not Exist on System!";exit}
        $AndroidSDK = @((item "$Env:AppData\..\Local\Android\sdk","$PF\Android\android-sdk",C:\AP-Langs\Android*SDK -ea SilentlyContinue).FullName)[-1]
        if ($AndroidSDK) {
            $SubMsg = "x>*Extra Plugin [","nsx+AndroidSDK","ns*] connected."
            $env:ANDROID_HOME = $AndroidSDK
            "","platform-" | % {A2Path "$AndroidSDK\${_}tools"}
        }
        A2Path "$PF\Java\$JavaD\bin"
        if (!$Silent) {Write-AP "+Configured Java [$($JavaD.substring(3)) $(if($x86){'32'}else{'64'})-bit] for AP-PShell Management Console!",$SubMsg}
        rv JavaD}
    MongoDB = {
        $PyD = @((item C:\Mongo*,C:\AP-Langs\MongoDB*).FullName)[-1]
        if (!$PyD) {Throw "MongoDB Does not Exist on System!";exit}
        A2Path "$PyD\bin"
        if ($a = (Split-Path -leaf $PyD).substring(7)) {$a="[$a]"}
        if (!$Silent) {Write-AP "+Configured MongoDB$a for AP-PShell Management Console!"}
        rv PYD}
    PHP = {param([ValidateSet("5.4","5.6")]$Version="5.6")
        $PyD = Resolve-Path "C:\AP-Langs\PHP-$Version.*" -ea SilentlyContinue
        if (!$PyD -or !(test-path $Pyd)) {Throw "PHP Does not Exist on System [Must be in C:\AP-Langs\PHP-*]!";exit}
        function PHP-Not($ver) {if ([int]$ver -gt 5.5) {return "5.4"} else {return "5.6"}}
        Get-Path "PHP.+$(PHP-Not $Version)" | % {RFP $_}
        A2Path "$PyD";$Vers=""
        if ($PyD -match "PHP-(?<vers>5\..+)\\?$") {$Vers = " [$($Matches.vers)]"}
        if (!$Silent) {Write-AP "+Configured PHP$vers for AP-PShell Management Console!"}
        if (!(Test-Path -type leaf "$PyD\composer.phar")) {
            Write-AP "!Composer missing, installing..."
            pushd $PyD
            php -r "readfile('http://getcomposer.org/installer');" | php -- --disable-tls
            popd
            if ($?) {Write-AP "+Installed..."}
        }
        function Global:Composer {php "$PyD\composer.phar"}
        rv PYD}
    Python = {param([string]$Version=2)
        $PyDs = @((item C:\Python*,C:\AP-Langs\Python*).FullName)
        if (!($PyD = ($PyDs -match $Version)[0])) {$PyD = $PyDs[-1]}
        else {Negate-Path python @($PyDs -notmatch $Version)[0]}
        if (!$PyD) {Throw "Python Does not Exist on System!";exit}
        try {A2Path (Split-Path (Resolve-Path "~\AppData\Local\Programs\Common\Microsoft\Visual C++ for Python\*\VC\bin\*\vcbuild.exe"))} catch {Write-AP "!This happened: [$_]"}
        "","Scripts" | % {A2Path $PyD\$_}
        "" | % {A2Path (AP-ConvertPath "<Components>\Python-Components\$_")}
        $env:PYTHON = "$PyD\python.exe"
        iex "Function Global:Idle {& '$PyD\Lib\idlelib\idle.pyw' @Args}"
        if (!$Silent) {Write-AP "+Configured Python$(Component-Version (Split-Path -leaf $PyD).substring(6)) for AP-PShell Management Console!"}
        rv PYD}
    R = {param([ValidateSet(32,64)]$bit=32)
        $x64 = $Bit -eq 64
        $PyD = Resolve-Path "C:\AP-Langs\R-*\bin" -ea SilentlyContinue
        if (!$PyD -or !(test-path $Pyd)) {Throw "R-Lang Does not Exist on System [Must be in C:\AP-Langs\R-*]!";exit}
        $BitF = 'x64','i386';if (!$x64) {[Array]::Reverse($BitF)}
        $Fo,$Fn = $BitF
        RFP "$PyD\$Fn"
        A2Path "$PyD\$Fo"
        if (!$Silent) {Write-AP "+Configured R-Lang[$Fo] for AP-PShell Management Console!"}
        rv PYD}
    Ruby = {param([string]$Version=2)
        $PyDs = @((item C:\Ruby*,C:\AP-Langs\Ruby* -ea stop).Fullname)
        $V = $Version -replace "\D"
        if (!($PyD = ($PyDs -match $V)[0])) {$PyD = $PyDs[-1]}
        else {Negate-Path Ruby @($PyDs -notmatch $Version)[0]}
        if (!$PyD) {Throw "Ruby Does not Exist on System!";exit}
        A2Path $PyD\bin;$N = Split-Path -leaf $PyD
        if (!$Silent) {Write-AP "+Configured Ruby$(Component-Version ($N -replace '\D' -replace '\d(?=.)','$0.')) for AP-PShell Management Console!"}
        rv PYD}
    Bower = {
        function Global:cc_bower_teardown.private {
            if (!$cc_TearDown_Resources) {Write-AP "!This function can only be executed from within the Configure-Component context";return $False}
            $cc_TearDown_Resources.removeFuncs.invoke("^Polymer-[ARP].{2,5}");return $True
        }
        Write-AP "x*Added Bower Friendly functions ["
        function Global:Polymer-Add($e) {bower i --save PolymerElements/$e}
        function Global:Polymer-Remove($e) {bower uninstall --save PolymerElements/$e}
        function Global:Polymer-Paper($e) {Polymer-Add "paper-$e"}
        $Funcs = ls Function:\Polymer-* | % Name
        $Funcs[0..($funcs.Length-2)] | % {Write-AP -NoSign "x!$_";Write-AP -noSign "x+, "}
        Write-AP -NoSign "x!$($Funcs[-1])";Write-AP -noSign "+]"
    }
}
if ($List) {
    Write-AP "*Listing All Packages:"
    Write-AP ">+Languages: $(Print-List ($Components.keys) -I)"
    Write-AP ">+Custom Components:"
    ls (AP-ConvertPath "<Comp>\*.ps1") | % {$_.Name.replace(".ps1","")} | % {Write-AP ">>!$_"}
    exit
}
if ($Remove) {
    $Comp = Component-Alias $Component;$Func = item "Function:\cc_${comp}_teardown.private" -ea SilentlyContinue
    if (!$Func) {Write-AP "!No Teardown method found for [$Comp]";exit}
    $cc_TearDown_Resources = Get-CC-TearDown
    $o = iex $Func
    if (!$o) {Write-AP "!Failed to remove component [$Comp]";exit}
    $Func | Remove-Item
    Write-AP "x+Removed component [","nx!$Comp","n+]"
    exit
}
#if (!$InRecurse -and $Preference.GetType().name -eq "Hashtable") {$Primed = @{};@($Preference.Keys) | % {$Primed.(Component-Alias $_) = $Preference.$_};$Preference=$Primed}
if ($Debug) {Write-AP "!$Component Args: $(Get-Prefs $Preference $Component)"}
if ($Component.Count -gt 1) {Recurse-Me $Component}
elseif ($Component -eq "All-Langs") {Recurse-Me @($Components.keys)}
elseif ($Components.($Comp = Component-Alias $Component)) {try{$Components.$Comp.invoke((Get-Prefs $Preference $Component))}catch{Process-Invoke $comp $_};exit}
elseif (Test-Path (AP-ConvertPath "<Comp>\$Component.ps1")) {try{& (AP-ConvertPath "<Comp>\$Component.ps1") (Get-Prefs $Preference $Component)}catch{Process-Invoke $comp $_ 2};exit}
else {Write-AP "!Component [$Component] not found.";exit}
