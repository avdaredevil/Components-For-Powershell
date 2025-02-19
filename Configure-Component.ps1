<#
|==============================================================================>|
   Configure-Component by APoorv Verma [AP] on 10/23/2015 || Version: 1.0.11
|==============================================================================>|
      $) Polyfill Inspired Logic for Connecting Components
      $) Teardown mechanism added
      $) Auto Path Switching
      $) Component shared and dynamic args ability
      $) Alias based component resolution
      $) Self Updating functionality
      $) Robust binary detections
      $) Custom Components added
      $) Argument Completer added for the component selection parameter
|==============================================================================>|
#>
[CmdletBinding(DefaultParameterSetName="Normal")]
param(
    [Parameter(ParameterSetName='Normal', Position=0, ValueFromPipeline=$True)][ArgumentCompleter({
        param($a,$b,$WordToComplete)
        $Components = & $PSCommandPath -List -PassThru | % {
            return $_.custom + $_.internal
        }
        @("All-Langs")+$Components | ? {$_ -match "^$WordToComplete"}
    })]$Component = "All-Langs",
    [Parameter(ParameterSetName='Normal',Position=1)]$Preference,
    [Parameter(ParameterSetName='ListMode')][Switch]$List,
    [Parameter(Mandatory=$true, ParameterSetName='ResolveComponent')][string]$Resolve,
    [Parameter(ParameterSetName='Normal')][Switch]$Silent,
    [Parameter(ParameterSetName='Normal')][Switch]$ThrowErrors,
    [Parameter(ParameterSetName='Normal')][Switch]$InRecurse,
    [Parameter(ParameterSetName='Normal')][Alias("Teardown")][Switch]$Remove,
    [Parameter(ParameterSetName='Normal')][Parameter(ParameterSetName='ListMode')][Switch]$RawOutput,
    [Parameter(ParameterSetName='UpdateMode')][Switch]$Update,
    [Parameter(ParameterSetName='ListMode')][Switch]$PassThru
)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAew0KICAgICAgICAifn5DdHJsQ35+Ij02Nw0KICAgICAgICAifn5TcGFjZX5+Ij0zMg0KICAgICAgICAifn5FU0NBUEV+fiI9MjcNCiAgICAgICAgIn5+RW50ZXJ+fiI9MTMNCiAgICAgICAgIn5+U2hpZnR+fiI9MTYNCiAgICAgICAgIn5+Q29udHJvbH5+Ij0xNw0KICAgICAgICAifn5BbHR+fiI9MTgNCiAgICAgICAgIn5+QmFja1NwYWNlfn4iPTgNCiAgICAgICAgIn5+RGVsZXRlfn4iPTQ2DQogICAgICAgICJ+fmYxfn4iPTExMg0KICAgICAgICAifn5mMn5+Ij0xMTMNCiAgICAgICAgIn5+ZjN+fiI9MTE0DQogICAgICAgICJ+fmY0fn4iPTExNQ0KICAgICAgICAifn5mNX5+Ij0xMTYNCiAgICAgICAgIn5+ZjZ+fiI9MTE3DQogICAgICAgICJ+fmY3fn4iPTExOA0KICAgICAgICAifn5mOH5+Ij0xMTkNCiAgICAgICAgIn5+Zjl+fiI9MTIwDQogICAgICAgICJ+fmYxMH5+Ij0xMjENCiAgICAgICAgIn5+ZjExfn4iPTEyMg0KICAgICAgICAifn5mMTJ+fiI9MTIzDQogICAgICAgICJ+fk11dGV+fiI9MTczDQogICAgICAgICJ+fkluc2VydH5+Ij00NQ0KICAgICAgICAifn5QYWdlVXB+fiI9MzMNCiAgICAgICAgIn5+UGFnZURvd25+fiI9MzQNCiAgICAgICAgIn5+RU5Efn4iPTM1DQogICAgICAgICJ+fkhPTUV+fiI9MzYNCiAgICAgICAgIn5+dGFifn4iPTkNCiAgICAgICAgIn5+Q2Fwc0xvY2t+fiI9MjANCiAgICAgICAgIn5+TnVtTG9ja35+Ij0xNDQNCiAgICAgICAgIn5+U2Nyb2xsTG9ja35+Ij0xNDUNCiAgICAgICAgIn5+V2luZG93c35+Ij05MQ0KICAgICAgICAifn5MZWZ0fn4iPTM3DQogICAgICAgICJ+flVwfn4iPTM4DQogICAgICAgICJ+flJpZ2h0fn4iPTM5DQogICAgICAgICJ+fkRvd25+fiI9NDANCiAgICAgICAgIn5+S1Awfn4iPTk2DQogICAgICAgICJ+fktQMX5+Ij05Nw0KICAgICAgICAifn5LUDJ+fiI9OTgNCiAgICAgICAgIn5+S1Azfn4iPTk5DQogICAgICAgICJ+fktQNH5+Ij0xMDANCiAgICAgICAgIn5+S1A1fn4iPTEwMQ0KICAgICAgICAifn5LUDZ+fiI9MTAyDQogICAgICAgICJ+fktQN35+Ij0xMDMNCiAgICAgICAgIn5+S1A4fn4iPTEwNA0KICAgICAgICAifn5LUDl+fiI9MTA1DQogICAgfQ0KICAgIGlmIChbaW50XSRDb252ZXJ0ID0gJEhhc2hLZXkuJEtleSkge3JldHVybiAkQ29udmVydH0NCiAgICBUaHJvdyAiSW52YWxpZCBTcGVjaWFsIEtleSBDb252ZXJzaW9uIg0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBGbGF0dGVuIHtwYXJhbShbb2JqZWN0W11dJHgpDQoNCiAgICBpZiAoISgkWCAtaXMgW2FycmF5XSkpIHtyZXR1cm4gJHh9DQogICAgaWYgKCRYLmNvdW50IC1lcSAxKSB7DQogICAgICAgIHJldHVybiAkeCB8ICUgeyRffQ0KICAgIH0NCiAgICAkeCB8ICUge0ZsYXR0ZW4gJF99DQp9CgpmdW5jdGlvbiBBbGlnbi1UZXh0IHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRUZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdDZW50ZXInKQ0KDQogICAgaWYgKCRUZXh0LmNvdW50IC1ndCAxKSB7DQogICAgICAgICRhbnMgPSBAKCkNCiAgICAgICAgZm9yZWFjaCAoJGxuIGluICRUZXh0KSB7JEFucyArPSBBbGlnbi1UZXh0ICRsbiAkQWxpZ259DQogICAgICAgIHJldHVybiAoJGFucykNCiAgICB9IGVsc2Ugew0KICAgICAgICAkV2luU2l6ZSA9IFtjb25zb2xlXTo6QnVmZmVyV2lkdGgNCiAgICAgICAgJENsZWFuVGV4dFNpemUgPSAoU3RyaXAtQ29sb3JDb2RlcyAoIiIrJFRleHQpKS5MZW5ndGgNCiAgICAgICAgaWYgKCRDbGVhblRleHRTaXplIC1nZSAkV2luU2l6ZSkgew0KICAgICAgICAgICAgJEFwcGVuZGVyID0gQCgiIik7DQogICAgICAgICAgICAkaiA9IDANCiAgICAgICAgICAgIGZvcmVhY2ggKCRwIGluIDAuLigkQ2xlYW5UZXh0U2l6ZS0xKSl7DQogICAgICAgICAgICAgICAgaWYgKCgkcCsxKSUkd2luc2l6ZSAtZXEgMCkgeyRqKys7JEFwcGVuZGVyICs9ICIifQ0KICAgICAgICAgICAgICAgICMgIiIrJGorIiAtICIrJHANCiAgICAgICAgICAgICAgICAkQXBwZW5kZXJbJGpdICs9ICRUZXh0LmNoYXJzKCRwKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgcmV0dXJuIChBbGlnbi1UZXh0ICRBcHBlbmRlciAkQWxpZ24pDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBpZiAoJEFsaWduIC1lcSAiQ2VudGVyIikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKlttYXRoXTo6dHJ1bmNhdGUoKCRXaW5TaXplLSRDbGVhblRleHRTaXplKS8yKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZWlmICgkQWxpZ24gLWVxICJSaWdodCIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIiooJFdpblNpemUtJENsZWFuVGV4dFNpemUtMSkrJFRleHQpDQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIHJldHVybiAoJFRleHQpDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KCmZ1bmN0aW9uIExvYWQtTGludXhBbGlhc2VzIHtwYXJhbShbU3dpdGNoXSRGb3JjZSkNCg0KICAgIGlmICghJEZvcmNlIC1hbmQgJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1uZSAiVW5peCIpIHtyZXR1cm59ICMgT25seSBsb2FkIG9uIGxpbnV4DQogICAgIyBSZWZlcmVuY2U6IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9Qb3dlclNoZWxsL1Bvd2VyU2hlbGwvOThjZjQ0Y2RlY2Q3MmZmYzMyOGMzYjdjYTIxNmZhZTIwYTA4ZjFlNC9zcmMvU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi9lbmdpbmUvSW5pdGlhbFNlc3Npb25TdGF0ZS5jcw0KICAgICMgJHRvZz0wOyhpcm0gImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9Qb3dlclNoZWxsL1Bvd2VyU2hlbGwvOThjZjQ0Y2RlY2Q3MmZmYzMyOGMzYjdjYTIxNmZhZTIwYTA4ZjFlNC9zcmMvU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi9lbmdpbmUvSW5pdGlhbFNlc3Npb25TdGF0ZS5jcyIpIC1zcGxpdCAiYHI/YG4iIHwgJSB7aWYgKCEkdG9nKSB7JHRvZyA9ICRfIC1tYXRjaCAiXCF1bml4In0gZWxzZWlmICgkXyAtbWF0Y2ggImVuZGlmIikgeyR0b2cgPSAkZmFsc2V9OyRffSB8ID8geyR0b2cgLWFuZCAkXyAtbWF0Y2ggIlNlc3Npb25TdGF0ZUFsaWFzRW50cnkifSB8ICUgeyRwID0gJF8gLXNwbGl0ICJcIiIiOyRhbCwkY21kID0gJHBbMSwzXTsiU2V0LUFsaWFzIC1zYyBHbG9iYWwgJGFsICRjbWQifQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGFjIEFkZC1Db250ZW50DQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgY29tcGFyZSBDb21wYXJlLU9iamVjdA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNwcCBDb3B5LUl0ZW1Qcm9wZXJ0eQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGRpZmYgQ29tcGFyZS1PYmplY3QNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBnc3YgR2V0LVNlcnZpY2UNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBzbGVlcCBTdGFydC1TbGVlcA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHNvcnQgU29ydC1PYmplY3QNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBzdGFydCBTdGFydC1Qcm9jZXNzDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgc2FzdiBTdGFydC1TZXJ2aWNlDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgc3BzdiBTdG9wLVNlcnZpY2UNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCB0ZWUgVGVlLU9iamVjdA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHdyaXRlIFdyaXRlLU91dHB1dA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNhdCBHZXQtQ29udGVudA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNwIENvcHktSXRlbQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGxzIEdldC1DaGlsZEl0ZW0NCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBtYW4gaGVscA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIG1vdW50IE5ldy1QU0RyaXZlDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgbXYgTW92ZS1JdGVtDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgcHMgR2V0LVByb2Nlc3MNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBybSBSZW1vdmUtSXRlbQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHJtZGlyIFJlbW92ZS1JdGVtDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgY25zbiBDb25uZWN0LVBTU2Vzc2lvbg0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGRuc24gRGlzY29ubmVjdC1QU1Nlc3Npb24NCiAgICAjPUVYVFJBUz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PXwNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBraWxsIFN0b3AtUHJvY2Vzcw0KfQoKZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbU3RyaW5nXSRQcm9tcHQgPSAiRW50ZXIgVGV4dCA6ICIpDQoNCiAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgJFByb21wdA0KICAgICRSZVJlZ1ggPSAnW15ceDAxLVx4MDhceDEwLVx4ODBdKycjJ1teXHdcLl0nIFvQkC3Rj9CB0ZFdDQogICAgJFRyU3RyaW5nID0gIiINCiAgICAkaVBvc3ggPSBbQ29uc29sZV06OkN1cnNvckxlZnQNCiAgICAkaVBvc3kgPSBbQ29uc29sZV06OkN1cnNvclRvcA0KICAgIHRyeSB7DQogICAgICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRGYWxzZQ0KICAgIH0gY2F0Y2ggeyRDdmlzID0gJFRydWV9DQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDUwMCkgeyRTbGVlcCA9IDEwMH0NCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlEb3duLE5vRWNobyIpOyRDb3VudD0wOyRTbGVlcD0wfSBlbHNlIHskQ291bnQrKztTdGFydC1TbGVlcCAtbSAkU2xlZXA7Y29udGludWV9DQogICAgICAgIGlmIChLZXlQcmVzc2VkICJ+fkJhY2tTcGFjZX5+IiAkU3RvcmUpIHtpZiAoJHN0b3JlLkNvbnRyb2xLZXlTdGF0ZSAtbWF0Y2ggImN0cmwiKSB7JFRyU3RyaW5nPSIifSBlbHNlIHskVHJTdHJpbmcgPSA/OiAoJFRyU3RyaW5nLkxlbmd0aCAtZXEgMCl7IiJ9eyRUclN0cmluZy5zdWJzdHJpbmcoMCwkVHJTdHJpbmcuTGVuZ3RoLTEpfX19DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5TcGFjZX5+IiAkU3RvcmUpIHskVHJTdHJpbmcgKz0gIiAifQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RXNjYXBlfn4iICRTdG9yZSkgeyRUclN0cmluZz0iIjticmVha30NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVOVEVSfn4iICRTdG9yZSkge1dyaXRlLUhvc3QgIiI7YnJlYWt9IGVsc2UgDQogICAgICAgIHskVHJTdHJpbmcgKz0gJFN0b3JlLkNoYXJhY3RlciAtcmVwbGFjZSAoJFJlUmVnWCwnJyl9DQogICAgICAgICR3dCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGggLSAkaVBvc3ggLSAxDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRpUG9zeA0KICAgICAgICBbQ29uc29sZV06OkN1cnNvclRvcCA9ICRpUG9zeQ0KICAgICAgICBpZiAoJHd0LSRUclN0cmluZy5MZW5ndGggLWx0IDApIHsNCiAgICAgICAgICAgICR0Yj0iIg0KICAgICAgICAgICAgJHR0PSIuLi4iKyRUclN0cmluZy5zdWJzdHJpbmcoJFRyU3RyaW5nLkxlbmd0aC0kd3QrMykNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICR0Yj0iICIqKCR3dC0kVHJTdHJpbmcuTGVuZ3RoKQ0KICAgICAgICAgICAgJHR0PSRUclN0cmluZw0KICAgICAgICB9DQogICAgICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkdHQkVGINCiAgICB9DQogICAgdHJ5IHtbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpc30gY2F0Y2gge30NCiAgICByZXR1cm4gJFRSU3RyaW5nDQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHsNCiAgICBpZiAoIShBUC1SZXF1aXJlICJhYmlsaXR5OmVzY2FwZV9jb2RlcyIpKSB7dGhyb3cgIltHZXQtUkJHXSBZb3VyIGNvbnNvbGUgZG9lcyBub3Qgc3VwcG9ydCBBTlNJIGVzY2FwZSBjb2RlcyJ9DQogICAgcmV0dXJuIFtDaGFyXTB4MWIgIyBgZQ0KfQoKZnVuY3Rpb24gR2V0LUNvbG9yIHsNCiAgICA8IyAgLkRlc2NyaXB0aW9uDQogICAgICAgIEZldGNoZXMgYmFzaWMgY29sb3JzIHVzaW5nIHRoZSBVbmljb2RlIEVzY2FwZSBzZXF1ZW5jZXMNCiAgICAjPg0KICAgIHBhcmFtICgNCiAgICAgICAgW1ZhbGlkYXRlU2V0KA0KICAgICAgICAgICAgJ3InLCdyZXNldCcsJ3JTJywncmVzZXRTdHlsZXMnLCdkJywnZGltJywncycsJ3N0cmlrZScsJ3UnLCd1bmRlcmxpbmUnLCdiJywnYm9sZCcsJ2knLCdpdGFsaWMnLCdibCcsJ2JsaW5rJywncmV2ZXJzZScsJ2gnLCdoaWRkZW4nLA0KICAgICAgICAgICAgJ0JsYWNrJywnRGFya0JsdWUnLCdEYXJrR3JlZW4nLCdEYXJrQ3lhbicsJ0RhcmtSZWQnLCdEYXJrTWFnZW50YScsJ0RhcmtZZWxsb3cnLCdHcmF5JywnRGFya0dyYXknLCdCbHVlJywnR3JlZW4nLCdDeWFuJywnUmVkJywnTWFnZW50YScsJ1llbGxvdycsJ1doaXRlJywNCiAgICAgICAgICAgICdiZy5CbGFjaycsJ2JnLkRhcmtCbHVlJywnYmcuRGFya0dyZWVuJywnYmcuRGFya0N5YW4nLCdiZy5EYXJrUmVkJywnYmcuRGFya01hZ2VudGEnLCdiZy5EYXJrWWVsbG93JywnYmcuR3JheScsJ2JnLkRhcmtHcmF5JywnYmcuQmx1ZScsJ2JnLkdyZWVuJywnYmcuQ3lhbicsJ2JnLlJlZCcsJ2JnLk1hZ2VudGEnLCdiZy5ZZWxsb3cnLCdiZy5XaGl0ZScNCiAgICAgICAgKV1bU3RyaW5nW11dJENvZGUsDQogICAgICAgIFtBbGlhcygnYmcnKV1bU3dpdGNoXSRCYWNrZ3JvdW5kLA0KICAgICAgICBbU3dpdGNoXSRDb2RlU3RyaW5nDQogICAgKQ0KICAgICRBbGlhc1RhYmxlID0gQHt1ID0gJ3VuZGVybGluZSc7YiA9ICdib2xkJztpID0gJ2l0YWxpYyc7ciA9ICdyZXNldCc7clMgPSAncmVzZXRTdHlsZXMnO3MgPSAnc3RyaWtlJztkID0gJ2RpbSc7YmwgPSAnYmxpbmsnO2ggPSAnaGlkZGVuJ30NCiAgICBpZiAoISRHbG9iYWw6QVBfQ09MT1JfVEFCTEUpIHsNCiAgICAgICAgJFRCTCA9ICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUgPSBAe3Jlc2V0ID0gMDtib2xkID0gMTtkaW0gPSAyO2l0YWxpYyA9IDM7dW5kZXJsaW5lID0gNDtibGluayA9IDU7cmV2ZXJzZSA9IDc7aGlkZGVuID0gODtzdHJpa2UgPSA5O3Jlc2V0U3R5bGVzID0gJzIyOzIzOzI0OzI1OzI3OzI4OzI5J30NCiAgICAgICAgMCwxIHwgJSB7DQogICAgICAgICAgICAkQmdJbmRleCA9ICRfDQogICAgICAgICAgICAwLDEgfCAlIHsNCiAgICAgICAgICAgICAgICAkU3BjSW5kZXggPSAkXw0KICAgICAgICAgICAgICAgICRpID0gMA0KICAgICAgICAgICAgICAgICdCbGFjay5UfFJlZHxHcmVlbnxZZWxsb3d8Qmx1ZXxNYWdlbnRhfEN5YW58V2hpdGUnLnNwbGl0KCd8JykgfCAlIHsNCiAgICAgICAgICAgICAgICAgICAgJEluY3IgPSAkQmdJbmRleCAqIDEwDQogICAgICAgICAgICAgICAgICAgICRDb2xOYW1lID0gKCgnJywnYmcuJylbJEJnSW5kZXhdKSsoKCdEYXJrJywnJylbJFNwY0luZGV4XSkrJF8NCiAgICAgICAgICAgICAgICAgICAgJENvbFNwYWNlID0gKDMwLCA5MClbJFNwY0luZGV4XSArICRJbmNyDQogICAgICAgICAgICAgICAgICAgICRUQkwuJENvbE5hbWUgPSAkQ29sU3BhY2UrKCRpKyspDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIEB7RGFya0dyYXkgPSAnQmxhY2suVCc7QmxhY2sgPSAnRGFya0JsYWNrLlQnO0dyYXkgPSAnRGFya1doaXRlJ30uR2V0RW51bWVyYXRvcigpIHwgJSB7DQogICAgICAgICAgICAkVEJMLigkXy5LZXkpID0gJFRCTC4oJF8uVmFsdWUpDQogICAgICAgICAgICAkVEJMLignYmcuJyskXy5LZXkpID0gJFRCTC4oJ2JnLicrJF8uVmFsdWUpDQogICAgICAgICAgICAkVEJMLnJlbW92ZSgkXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwucmVtb3ZlKCdiZy4nKyRfLlZhbHVlKQ0KICAgICAgICB9DQogICAgfQ0KICAgICRDb2RlcyA9ICgkQ29kZSskQXJncyB8ICUgew0KICAgICAgICAkR2xvYmFsOkFQX0NPTE9SX1RBQkxFLihKUy1PUiAkQWxpYXNUYWJsZS4kXyAkXykNCiAgICB9KSAtam9pbiAnOycNCiAgICBpZiAoJENvZGVTdHJpbmcpIHtyZXR1cm4gJENvZGVzfQ0KICAgIHJldHVybiAiJChHZXQtRXNjYXBlKVske0NvZGVzfW0iDQp9CgpmdW5jdGlvbiBJcy1BZmZpcm1hdGl2ZSB7cGFyYW0oJFRleHQpDQoNCiAgICAkZWFoID0gIltldWFdKltwaHNdKiINCiAgICAkc3VyZSA9ICIoc3UrcitlezAsOX18c2h7MSw1fVtvdV0raCopIg0KICAgICRJQW1QaHJhc2VzID0gIihJKCc/bXwgYW0pPyggKHZlcnl8cXVpdGUpKT8gKGRvKyh3bik/fGFncmVlfGNvbmZpZGVudHxwb3NpdGl2ZXxnYW1lfGlufCRzdXJlfGFmZmlybVx3ezAsOH18cG9zdGl2ZVx3ezAsNH0pKSINCiAgICAkUmFuZG9tWWVzID0gIih5fG8qayt8b3VpfHNpfGRhfGphfHNpbXxpZ2VufGhhYW4oamkpP3wxMC00fGNvcHkgdGhhdHwocm9nZXIgPyl7MSwzfSl8eWVzK1tpdV1yKyINCiAgICAkSGVsbEZ1Y2sgPSAiKGhlKGxsK3xjK2srKSt8ZnI/LihbY2tdK3xkZ2UrKSkiDQogICAgJEZvciA9ICIocGh8ZilbMG91XStbcmhdKiINCiAgICByZXR1cm4gJFRleHQgLW1hdGNoICJeKD8hPW5vK3QgKikoKD8hPW4ke2VhaH0pKCRIZWxsRnVjayA/KT9hKnkrJHtlYWh9fCgkZm9yID8pPyRzdXJlfGluZHViaXRhYmx5fGFmZmlybVx3ezAsOH18dG90KGVzK3xhbGx5Kyl8cG9zaXRpdmVcd3swLDR9fGFncmVlW2RdfG9mZj8gY291cnNlK3wkSUFtUGhyYXNlcylcYi4qPyg/PCFubyt0KykkfF4kUmFuZG9tWWVzJCINCn0KCmZ1bmN0aW9uIFJlbW92ZS1Gcm9tUGF0aCB7cGFyYW0oW1N0cmluZ10kRm9sZGVyID0gIiIsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICBpZiAoISRGb2xkZXIpIHtyZXR1cm59DQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgICRGb2xkZXJTZXAgPSAkKGlmICgkSXNVbml4KSB7Ii8ifSBlbHNlIHsiXCJ9KQ0KICAgICRGb2xkZXIgPSAkRm9sZGVyWzBdICsgJEZvbGRlci5TdWJzdHJpbmcoMSkuVHJpbUVuZCgkRm9sZGVyU2VwKQ0KICAgICRQdGggPSAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIgfCA/IHskXyAtbmUgJEZvbGRlciAtYW5kICRfIC1uZSAiJEZvbGRlciRGb2xkZXJTZXAifSB8ID8geyRffSkgLWpvaW4oJFBhdGhTZXApDQogICAgW3ZvaWRdW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCn0KCmZ1bmN0aW9uIFN0cmlwLUNvbG9yQ29kZXMge3BhcmFtKCRTdHIpDQoNCiAgICAkU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9DQp9CgpmdW5jdGlvbiBJbXBvcnQtQmF0Y2hGaWxlIHtwYXJhbSgkRmlsZSwgW1N3aXRjaF0kVmVyYm9zZSwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJEZpbGUgLW5vdG1hdGNoICIuKGJhdHxjbWQpJCIpIHskT3V0ID0gSlMtT1IgKEltcG9ydC1CYXRjaEZpbGUgIiRGaWxlLmJhdCIgLVZlcmJvc2U6JFZlcmJvc2UgLVBhc3NUaHJ1KSB7SW1wb3J0LUJhdGNoRmlsZSAiJEZpbGUuY21kIiAtVmVyYm9zZTokVmVyYm9zZSAtUGFzc1RocnV9O2lmICgkUGFzc1RocnUpIHtSZXR1cm4gJE91dH07cmV0dXJuICEhJE91dH0NCiAgICAkb2YgPSAkRmlsZTskU0MgPSAiU2lsZW50bHlDb250aW51ZSINCiAgICAkRmlsZSA9IEpTLU9SIChSZXNvbHZlLVBhdGggJEZpbGUgLWVhICRTQykge0dldC1XaGVyZSAkRmlsZX0NCiAgICBpZiAoISRGaWxlKSB7V3JpdGUtQVBMICIhWyIsIiNBUC1FbmdpbmUiLCIqOjoiLCIrSW1wb3J0LURvcyIsIiFdICIsIi1Db3VsZCBub3QgcmVzb2x2ZSBbJG9mXSB0byBhIHZhbGlkIHNjcmlwdCBmaWxlIjtyZXR1cm4gJGZhbHNlfQ0KICAgIHB1c2hkIChTcGxpdC1QYXRoICRGaWxlKQ0KICAgIGlmICgkVmVyYm9zZSkge1dyaXRlLUFQTCAiKkltcG9ydGluZyBGaWxlICIsIiEkRmlsZSJ9DQogICAgJFZhcnMgPSBAKCk7DQogICAgZm9yZWFjaCAoJGwgaW4gKGNtZCAvYyAiJChTcGxpdC1QYXRoIC1sZWFmICRGaWxlKT5udWwgMj5udWwmc2V0IiB8ID8geyRfIC1tYXRjaCAiPSJ9KSkgew0KICAgICAgICAkaywkdiA9ICRsLnNwbGl0KCI9IikNCiAgICAgICAgaWYgKCEkayAtb3IgKFtlbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoIiRrIikgLWVxICR2KSkge2NvbnRpbnVlfQ0KICAgICAgICAkVmFycyArPSAsIiRrIg0KICAgICAgICBzZXQtaXRlbSAtZm9yY2UgLXBhdGggIkVOVjpcJGsiIC12YWx1ZSAiJHYiDQogICAgICAgIGlmICgkVmVyYm9zZSkge1dyaXRlLUFQTCAiPitBZGRlZCAiLCIjRW52IiwiKzoiLCIhJGsifQ0KICAgIH0NCiAgICBwb3BkDQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiBbUFNDdXN0b21PYmplY3RdQHtmaWxlPSRGaWxlO3ZhcnM9JFZhcnN9fQ0KICAgIHJldHVybiAkVHJ1ZQ0KfQoKZnVuY3Rpb24gSlMtT1Ige2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7aWYgKCEkYSkge2NvbnRpbnVlfTtpZiAoJGEuR2V0VHlwZSgpLk5hbWUgLWVxICJTY3JpcHRCbG9jayIpIHskYSA9ICRhLmludm9rZSgpO2lmICghJGEpe2NvbnRpbnVlfX07cmV0dXJuICRhfX0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPltcK1wtXCFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgIGlmIChBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiAtcGEpIHsNCiAgICAgICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIH0NCiAgICAgICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgICAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICREYXRhfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEFkZC1Ub1BhdGgge3BhcmFtKFtWYWxpZGF0ZVBhdHRlcm4oIi4rIildW1N0cmluZ10kRm9sZGVyID0gJFBXRCwgW0FsaWFzKCJwIiwicHJlIiwiYmFjayIpXVtzd2l0Y2hdJFByZXBlbmQsIFtTd2l0Y2hdJFRyeSwgW1N3aXRjaF0kRm9yY2UsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICB0cnkgew0KICAgICAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAgICAgaWYgKCEkRm9yY2UpIHt0cnkgeyRGb2xkZXIgPSBSZXNvbHZlLVBhdGggJEZvbGRlciAtRXJyb3JBY3Rpb24gU3RvcH0gY2F0Y2gge1Rocm93ICJbQVAtUGF0aDpBZGRdIEZvbGRlciBbJEZvbGRlcl0gRG9lcyBub3QgRXhpc3QifX0NCiAgICAgICAgaWYgKCEkRm9yY2UgLWFuZCAoVGVzdC1QYXRoICRmb2xkZXIgLXR5cGUgbGVhZikpIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBJbnB1dCBbJEZvbGRlcl0gbXVzdCBiZSBhIGZvbGRlciEifQ0KICAgICAgICBpZiAoJEZvbGRlciAtaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkge3JldHVybn0NCiAgICAgICAgJFB0aCA9IEdldC1Db250ZW50IGVudjpcJFBhdGhWYXINCiAgICAgICAgJEZvbGRlclNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiLyJ9IGVsc2UgeyJcIn0pDQogICAgICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICAgICAgJEZvbGRlciA9ICRGb2xkZXJbMF0gKyAkRm9sZGVyLlN1YnN0cmluZygxKS5UcmltRW5kKCRGb2xkZXJTZXApDQogICAgICAgIGlmICghJFByZXBlbmQpIHskUHRoICs9ICIkUGF0aFNlcCRGb2xkZXIifSBlbHNlIHskUHRoID0gIiRGb2xkZXIkUGF0aFNlcCQoJFB0aCkifQ0KICAgICAgICBbRW52aXJvbm1lbnRdOjpTZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyLCAkUHRoKQ0KICAgIH0gY2F0Y2ggew0KICAgICAgICBpZiAoJFRyeSkge3JldHVybn0NCiAgICAgICAgVGhyb3cgJF8NCiAgICB9DQp9CgpmdW5jdGlvbiBTZXQtUGF0aCB7DQogICAgW2NtZGxldGJpbmRpbmcoKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnkgPSAkdHJ1ZSwgVmFsdWVGcm9tUGlwZWxpbmUgPSAkdHJ1ZSldW3N0cmluZ1tdXSRQYXRoLA0KICAgICAgICBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgIGJlZ2luIHsNCiAgICAgICAgW3N0cmluZ1tdXSRGaW5hbFBhdGgNCiAgICB9DQogICAgcHJvY2VzcyB7DQogICAgICAgICRQYXRoIHwgJSB7DQogICAgICAgICAgICAkRmluYWxQYXRoICs9ICRfDQogICAgICAgIH0NCiAgICB9DQogICAgZW5kIHsNCiAgICAgICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICAgICAgJFB0aCA9ICRGaW5hbFBhdGggLWpvaW4gJFBhdGhTZXANCiAgICAgICAgJFB0aCA9ICgkUHRoIC1yZXBsYWNlKCIkUGF0aFNlcCsiLCAkUGF0aFNlcCkgLXJlcGxhY2UoIlxcJFBhdGhTZXB8XFwkIiwgJFBhdGhTZXApKS50cmltKCRQYXRoU2VwKQ0KICAgICAgICAkUHRoID0gKCgkUHRoKS5zcGxpdCgkUGF0aFNlcCkgfCBzZWxlY3QgLXVuaXF1ZSkgLWpvaW4gJFBhdGhTZXANCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCiAgICB9DQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oJGRlY2lkZXIsICRpZnRydWUsICRpZmZhbHNlID0ge30pDQoNCiAgICAkSW52b2tlT3JSZXR1cm4gPSB7DQogICAgICAgIHBhcmFtKCRDbWQpDQogICAgICAgIGlmICgkQ21kIC1pcyBbU2NyaXB0QmxvY2tdKSB7JiAkQ21kfSBlbHNlIHskQ21kfQ0KICAgIH0NCiAgICBpZiAoJGRlY2lkZXIpIHsgJiAkSW52b2tlT3JSZXR1cm4gJGlmdHJ1ZSB9IGVsc2UgeyAmICRJbnZva2VPclJldHVybiAkaWZmYWxzZSB9DQp9CgpmdW5jdGlvbiBLZXlQcmVzc2VkIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRLZXksICRTdG9yZSA9ICJeXl4iKQ0KDQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIgLWFuZCAkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9IGVsc2Uge2lmICgkU3RvcmUgLWVxICJeXl4iKSB7cmV0dXJuICRGYWxzZX19DQogICAgJEFucyA9ICRGYWxzZQ0KICAgICRLZXkgfCAlIHsNCiAgICAgICAgJFNPVVJDRSA9ICRfDQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkQW5zID0gJEFucyAtb3IgKEtleVByZXNzZWRDb2RlICRTT1VSQ0UgJFN0b3JlKQ0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgIEZvcmVhY2ggKCRLIGluICRTT1VSQ0UpIHsNCiAgICAgICAgICAgICAgICBbU3RyaW5nXSRLID0gJEsNCiAgICAgICAgICAgICAgICBpZiAoJEsubGVuZ3RoIC1ndCA0IC1hbmQgKCRLWzAsMSwtMSwtMl0gLWpvaW4oIiIpKSAtZXEgIn5+fn4iKSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoS2V5UHJlc3NlZENvZGUgKEtleVRyYW5zbGF0ZSgkSykpICRTdG9yZSkNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKCRLLmNoYXJzKDApIC1pbiAkU3RvcmUuQ2hhcmFjdGVyKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCiAgICByZXR1cm4gJEFucw0KfQoKZnVuY3Rpb24gUHJpbnQtTGlzdCB7cGFyYW0oJHgsIFtTd2l0Y2hdJEluUmVjdXJzZSkNCg0KICAgIGlmICgkeC5jb3VudCAtbGUgMSkge3JldHVybiA/OigkSW5SZWN1cnNlKXskeH17IlskeF0ifX0gZWxzZSB7DQogICAgICAgIHJldHVybiAiWyQoKCR4IHwgJSB7UHJpbnQtTGlzdCAkXyAtSW5SZWN1cnNlfSkgLWpvaW4gJywgJyldIg0KICAgIH0NCn0KCmZ1bmN0aW9uIEFQLUNvbnZlcnRQYXRoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kUGF0aCkNCg0KICAgICRQYXRoU2VwID0gW0lPLlBhdGhdOjpEaXJlY3RvcnlTZXBhcmF0b3JDaGFyDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPiR7UGF0aFNlcH1EZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT4ke1BhdGhTZXB9QVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPiR7UGF0aFNlcH1BUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIFdyaXRlLUFQTCB7DQogICAgW0NtZGxldEJpbmRpbmcoKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCwNCiAgICAgICAgW0FsaWFzKCdOUycpXVtTd2l0Y2hdJE5vU2lnbiwNCiAgICAgICAgW0FsaWFzKCdOTkwnLCdOTCcpXVtTd2l0Y2hdJE5vTmV3TGluZSwNCiAgICAgICAgW1N3aXRjaF0kUGFzc1RocnUNCiAgICApDQogICAgYmVnaW4geyRUVCA9IEAoKX0NCiAgICBwcm9jZXNzIHskVGV4dCB8ICUgeyRUVCArPSAsJF99fQ0KICAgIGVuZCB7DQogICAgICAgIGZvciAoJGk9MDskaSAtbHQgJFRULmNvdW50OyRpKyspIHsNCiAgICAgICAgICAgIFtzdHJpbmddJENodW5rID0gJFRUWyRpXQ0KICAgICAgICAgICAgJFNpZ25SZ3ggPSAiW1wrXC1cIVwqXCNcQF9cPl0iDQogICAgICAgICAgICAkQ2h1bmsgPSAkQ2h1bmsgLXJlcGxhY2UgIl5uP3g/bj8oJFNpZ25SZ3gpIiwnJDEnDQogICAgICAgICAgICBpZiAoJENodW5rIC1ub3RtYXRjaCAiXiRTaWduUmd4LioiKSB7JENodW5rID0gIl8kQ2h1bmsifSAjIFVzZSBkZWZhdWx0IGFzIHdoaXRlDQogICAgICAgICAgICAkUHJlZml4Q29kZSA9ID86ICgkaSAtZXEgMCkgeyJ4JCg/OiAkTm9TaWduIHsnbid9IHsnJ30pIn0gez86ICgkaSAtbmUgKCRUVC5Db3VudCAtIDEpKSB7Im54In0gIm4kKD86ICROb05ld0xpbmUgeyd4J30geycnfSkifQ0KICAgICAgICAgICAgaWYgKCRUVC5Db3VudCAtZXEgMSkgeyRQcmVmaXhDb2RlID0gIiQoPzogJE5vU2lnbiB7J24nfSB7Jyd9KSQoPzogJE5vTmV3TGluZSB7J3gnfSB7Jyd9KSJ9DQogICAgICAgICAgICBXcml0ZS1BUCAiJFByZWZpeENvZGUkQ2h1bmsiIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW0FyZ3VtZW50Q29tcGxldGVyKHsNCiAgICBbT3V0cHV0VHlwZShbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XSldDQogICAgcGFyYW0oDQogICAgICAgIFtzdHJpbmddICRDb21tYW5kTmFtZSwNCiAgICAgICAgW3N0cmluZ10gJFBhcmFtZXRlck5hbWUsDQogICAgICAgIFtzdHJpbmddICRXb3JkVG9Db21wbGV0ZSwNCiAgICAgICAgW1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uTGFuZ3VhZ2UuQ29tbWFuZEFzdF0gJENvbW1hbmRBc3QsDQogICAgICAgIFtTeXN0ZW0uQ29sbGVjdGlvbnMuSURpY3Rpb25hcnldICRGYWtlQm91bmRQYXJhbWV0ZXJzDQogICAgKQ0KICAgICRDb21wbGV0aW9uUmVzdWx0cyA9IFtTeXN0ZW0uQ29sbGVjdGlvbnMuR2VuZXJpYy5MaXN0W1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uQ29tcGxldGlvblJlc3VsdF1dOjpuZXcoKQ0KICAgICRMaWIgPSBAKCJJbnRlcm5ldCIsIm9zOndpbmRvd3MiLCJvczpsaW51eCIsIm9zOnVuaXgiLCJhZG1pbmlzdHJhdG9yIiwicm9vdCIsImxpYjoiLCJsaWJfdGVzdDoiLCJmdW5jdGlvbjoiLCJzdHJpY3RfZnVuY3Rpb246IiwiYWJpbGl0eTplc2NhcGVfY29kZXMiLCJhYmlsaXR5OmVtb2ppcyIpDQogICAgSlMtT1IgeyRMaWIgfCA/IHskXyAtbGlrZSAiJFdvcmRUb0NvbXBsZXRlKiJ9fSB7JExpYiB8ID8geyRfIC1saWtlICIqJFdvcmRUb0NvbXBsZXRlKiJ9fSB8ICUgew0KICAgICAgICAkQ29tcGxldGlvblJlc3VsdHMuQWRkKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdOjpuZXcoJF8sICRfLCAnUGFyYW1ldGVyVmFsdWUnLCAkXykpDQogICAgfQ0KICAgIHJldHVybiAkQ29tcGxldGlvblJlc3VsdHMNCn0pXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWwsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgJExvYWRNb2R1bGUgPSB7DQogICAgICAgIHBhcmFtKCRGaWxlLFtib29sXSRJbXBvcnQpDQogICAgICAgIHRyeSB7SW1wb3J0LU1vZHVsZSAkRmlsZSAtZWEgc3RvcDtyZXR1cm4gMX0gY2F0Y2gge30NCiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIg0KICAgICAgICBbc3RyaW5nXSRmID0gaWYodGVzdC1wYXRoIC10IGxlYWYgJExGKXskTEZ9ZWxzZWlmKHRlc3QtcGF0aCAtdCBsZWFmICIkTEYuZGxsIil7IiRMRi5kbGwifQ0KICAgICAgICBpZiAoJGYgLWFuZCAkSW1wb3J0KSB7SW1wb3J0LU1vZHVsZSAkZn0NCiAgICAgICAgcmV0dXJuICRmDQogICAgfQ0KICAgICRJbnZva2VPclJldHVybiA9IHsNCiAgICAgICAgcGFyYW0oJENtZCkNCiAgICAgICAgaWYgKCRDbWQgLWlzIFtTY3JpcHRCbG9ja10pIHsmICRDbWR9IGVsc2UgeyRDbWR9DQogICAgfQ0KICAgIGlmICghJE9uRmFpbCkgeyRQYXNzVGhydSA9ICR0cnVlfQ0KICAgICRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0JCIgICAgICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5vczood2luKGRvd3MpP3xsaW51eHx1bml4KSQiIHskSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCI7aWYgKCRNYXRjaGVzWzFdIC1tYXRjaCAiXndpbiIpIHshJElzVW5peH0gZWxzZSB7JElzVW5peH19DQogICAgICAgICJeYWRtaW4oaXN0cmF0b3IpPyR8XnJvb3QkIiAgICB7VGVzdC1BZG1pbmlzdHJhdG9yfQ0KICAgICAgICAiXmRlcDooLiopJCIgICAgICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSQiICAgICAgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0sICR0cnVlKX0NCiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopJCIgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikkIiAgICAgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSQiICAgICAgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgICAgICJeYWJpbGl0eTooZXNjYXBlX2NvZGVzfGVtb2ppcykkIiAgICAgeyYgJEludm9rZU9yUmV0dXJuIChAew0KICAgICAgICAgICAgZXNjYXBlX2NvZGVzID0gJEhvc3QuVUkuU3VwcG9ydHNWaXJ0dWFsVGVybWluYWwNCiAgICAgICAgICAgIGVtb2ppcyA9ICRlbnY6V1RfU0VTU0lPTiAtb3IgJGVudjpXVF9QUk9GSUxFX0lEDQogICAgICAgIH1bJE1hdGNoZXNbMV1dKX0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCAtYW5kICRPbkZhaWwpIHsmICRPbkZhaWx9DQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9DQp9CgpmdW5jdGlvbiBUZXN0LUFkbWluaXN0cmF0b3Igew0KICAgIGlmICgkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Iikgew0KICAgICAgICBpZiAoJCh3aG9hbWkpIC1lcSAicm9vdCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkdHJ1ZQ0KICAgICAgICB9DQogICAgICAgIGVsc2Ugew0KICAgICAgICAgICAgcmV0dXJuICRmYWxzZQ0KICAgICAgICB9DQogICAgfQ0KICAgICMgV2luZG93cw0KICAgIChOZXctT2JqZWN0IFNlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzUHJpbmNpcGFsIChbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NJZGVudGl0eV06OkdldEN1cnJlbnQoKSkpLklzSW5Sb2xlKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0J1aWx0aW5Sb2xlXTo6QWRtaW5pc3RyYXRvcikNCn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KClNldC1BbGlhcyBjb2wgR2V0LUNvbG9yClNldC1BbGlhcyBSRlAgUmVtb3ZlLUZyb21QYXRoClNldC1BbGlhcyBBMlBhdGggQWRkLVRvUGF0aApTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")
# ========================================END=OF=COMPILER===========================================================|
AP-Require "function:Get-Path" {Write-AP "!Get-Path needs to be available from AP-Console to use this command";exit}
function Recurse-Me($arr) {$arr | % {
        $Common = @{Silent=$Silent;ThrowErrors=$ThrowErrors;Debug=$Debug;RawOutput=$RawOutput;InRecurse=$true}
        if ($List) {& $PSCommandPath -List:$List -PassThru:$PassThru @Common}
        else {& $PSCommandPath $_ $Preference @Common}
    }
}
function Process-Throw($s,$l=1) {if(!$s.Exception.WasThrownFromThrowStatement){JS-OR $s.Exception.InnerException.Message $s.Exception.message}else{$s=$s.Exception;if ($l -eq 2) {$s = $s.message};$s}}
function Process-Invoke($c,$s,$l=1) {if(!$ThrowErrors){Write-AP "x!Could not attach component ","nx+$c","xn! [","xn#$(Process-Throw $s $l)","n!]"}else{Throw $S}}
function Component-Alias($al) {JS-OR $Script:AliasDB.$al $al}
function Component-Version($v) {if ($v) {"[$v]"}}
function Get-CC-TearDown {
    return @{
        removeFuncs={param($RGX);ls Function:|? Name -Match $RGX | Remove-Item}
    }
}
function Get-Prefs($Pref,$Me) {if (!$Pref) {return};if ($Pref.GetType().name -eq "Hashtable") {JS-OR $Pref.$Me $Pref."$($AliasDBRev.$Me)"} else {$Pref}}
function Negate-Path($Namespace,$Filter) {Get-Path $Namespace | ? {$_ -match [Regex]::escape($Filter)} | % {RFP $_}}
function Script:Write-AP-Wrapper ([Switch]$Force) {
    if (!$RawOutput -or $Force) {Write-AP @args;return}
    @($args | ? {$_ -notmatch "^\-no"})[0]
}
function Check-ScriptVersions {
    if (!(AP-Require "internet" -PassThru)) {return}
    $REMOTE_HEAD = "https://raw.githubusercontent.com/avdaredevil/Components-For-Powershell/master/Configure-Component.ps1"
    $Script:API_DATA = irm $REMOTE_HEAD -ea SilentlyContinue
    if (!$Script:API_DATA) {Write-AP "n>![Configure-Components::CRITICAL] Could not access REPO [Check: $REMOTE_HEAD]";exit}
    $GetVer = {$a = ($args -match "Apoorv" -split "\|+")[1];try {return [version](JS-OR ("$a".trim() -replace "[^\d\.]") "0.0.0")}catch{return [version]"0.0.0"}}
    $o = @{}
    $o.local = $GetVer.invoke([IO.File]::ReadAllLines($PSCommandPath))[0]
    $o.remote = $GetVer.invoke($Script:API_DATA.split("`n"))[0]
    return [PSCustomObject]$o
}
function Do-FullUpdate {
    $Script:API_DATA | out-file -en utf8 $PSCommandPath
    Write-AP "x>>+Updated ","nx!$(Split-Path -Leaf $PSCommandPath)","n+..."
    # foreach loop over "" and "Python-Components" to update both
    @("","/Python-Components") | % {
        $Comp = $_
        $Files = irm https://api.github.com/repos/avdaredevil/Components-For-Powershell/contents/AP-Components$Comp -Headers @{"Accept"="application/vnd.github.v3+json"} -ea SilentlyContinue
        if (!$Files) {Write-AP "!Could not access REPO [Check: https://api.github.com/repos/avdaredevil/Components-For-Powershell/contents/AP-Components/$Comp]";exit 1}
        $Files | % {
            $File = $_.download_url
            if (!$File) {return} # Skip if download_url is not available, probably a folder
            $Name = $_.name
            $Path = AP-ConvertPath "<Comp>$Comp/$Name"
            $Data = irm $File -ea SilentlyContinue
            if (!$Data) {Write-AP "!Could not download $Name [Check: $File]";exit 1}
            $Data | out-file -en utf8 $Path
            Write-AP "x>>+Updated ","nx!AP-Components$Comp/$Name","n+..."
        }
    }
}
function List-Components ($Components, [Switch]$Pass) {
    $r = @{custom=@()}
    if ($Pass) {$r.internal = @($Components.keys)} else {
        Write-AP-Wrapper "*Listing All Packages:"
        Write-AP-Wrapper ">+Languages: $(Print-List ($Components.keys) -I)"
        Write-AP-Wrapper ">+Custom Components:"
    }
    Get-ChildItem (AP-ConvertPath "<Comp>\*.ps1") | % {$_.Name.replace(".ps1","")} | % {if ($Pass) {$r.custom += ,$_} else {Write-AP-Wrapper ">>!$_"}}
    if ($Pass) {[PSCustomObject]$r}
}
if ($Update) {
    if ($Host.Version.Major -lt 3) {Write-Host -f yellow "[!] PowerShell versions under 3 not supported. Please update to windows 10";exit}
    Write-AP "*Checking for Updates for Configure-Component..."
    $Vers = Check-ScriptVersions
    if (!$Vers) {Write-AP "!Internet connection is required to update Configure-Component";exit}
    if ($Vers.Remote -le $Vers.local) {Write-AP ">*No updates required";exit}
    Write-AP "x>+Update found [","nx#v$($vers.local)","nx+ ~ ","nx!v$($vers.remote)","n+]"
    $Script:API_DATA | out-file -en utf8 $PSCommandPath
    Do-FullUpdate
    Write-AP "x>+Command updated to ","nx!v$($vers.remote)","n+, re-run this command to use the new version!"
    exit
}
if (!$InRecurse -and !((Get-Random -max 50)%5)) {
    $Vers = Check-ScriptVersions
    if ($Vers -and $Vers.Remote -gt $Vers.local) {Write-AP "nx![","nx#Configure-Component","nx!] Update available [","nx+v$($vers.remote)","nx!], use ","nx#-update","n! to update"," "}
}
$Script:AliasDB = @{
    "DrRacket"="Racket"
    "RB"="Ruby"
    "PY"="Python"
    "PSQ"="PostgreSQL"
    "Postgres"="PostgreSQL"
    "Mongo"="MongoDB"
    "Linux"="WinOnLinux"
}
<#AP-COMPILER: ?:,Flatten#>
$Script:AliasDBRev = @{};@($AliasDB.Keys) | % {$Script:AliasDBRev.($AliasDB.$_) = $_}
$Components = @{
    WinOnLinux = {
        if ($PSVersionTable.Platform -ne "Unix") {
            Write-AP "!This command is only available on Unix based systems";exit
        }
        Write-AP "x*","n_Reconfiguring Linux Environment..."
        Write-AP "x>*","n_Loading Aliases for Linux Commands, so no syntax difference when using aliases"
        Load-LinuxAliases
        Write-AP "x>*","n_Creating proxy functions for Windows binaries in your path:"
        Write-AP "nx>>!:: "
        $Added = 0;$Encountered = 0
        $EvalCode = ""
        Get-Path | % {ls -Filter *.exe $_ -ea SilentlyContinue} | % {
            $Bin = $_.name -replace ".exe$"
            $Encountered++
            if (gcm $bin) {
                # This is already available as a linux binary or alias
                Write-AP "nx-$(Get-Color red,dim)$(if ($Encountered -gt 1) {", "})$Bin$(col reset)"
                return
            }
            $Added++
            # Create a proxy function to run the binary via wine
            Write-AP "nx+$(if ($Encountered -gt 1) {", "})$Bin"
            $EvalCode += "function global:$bin {Run-WinBinaryOnLinux $Bin @args}"
        }
        if ($EvalCode) {Invoke-Expression $EvalCode}
        if (!$Encountered) {Write-AP "n_$(Get-Color i,dim,gray)None Found$(Get-Color reset)"}
        else {
            Write-Host
            Write-AP "x>+","nx!$Added ","n_proxy functions created for Windows binaries in your PATH"
        }
        Write-AP "x>*","n_Adding some common windows aliases for linux: (explorer, taskmgr)"
        function global:explorer {
            if (AP-Require "dep:open" -pa) {open @args}
            elseif (AP-Require "dep:nautilus" -pa) {nautilus @args}
            elseif (AP-Require "dep:thunar" -pa) {thunar @args}
            elseif (AP-Require "dep:pcmanfm" -pa) {pcmanfm @args}
            else {Write-AP "!No File Manager found to open explorer";return}
        }
        function global:taskmgr {
            if (AP-Require "dep:gnome-system-monitor" -pa) {gnome-system-monitor @args}
            elseif (AP-Require "dep:xfce4-taskmanager" -pa) {xfce4-taskmanager @args}
            elseif (AP-Require "dep:lxsession" -pa) {lxsession @args}
            elseif (AP-Require "dep:open" -pa) {open -a "Activity Monitor" @args}
            else {Write-AP "!No Task Manager found to open taskmgr";return}
        }
    }
    C = {
        param($NoPrepend)
        $NoPrepend = !!$NoPrepend
        $PyD = @(item (
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "Cygwin*"
            })+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Cygwin*"
            })) -ea SilentlyContinue | % FullName)[-1]
        if (!$PyD) {Throw "*:\Cygwin,AP-Langs\CYGWIN Does not Exist on System!";exit}
        A2Path "$Pyd\bin" -Prepend:(!$NoPrepend)
        AP-Require "dep:gcc" {Write-AP-Wrapper "!Seems like your cygwin/path directory does not have GCC please fetch.";exit}
        $Env:TERM="cygwin";$Env:ANSICON="true";$Env:CYGWIN = "nodosfilewarning notitle glob"
        $Env:CygFolder = $PyD
        if (!$Silent) {Write-AP-Wrapper "+Configured C for AP-PShell Management Console!"}
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
                    return "$tt$Sign$Ret" -replace "G?[??]","'"
                }
                if ($Compile.Errors) {Write-AP ">!Errors:";$Compile.Errors | % {Write-AP (">>{0}" -f (FormatError $_))}}
                rv Foliate -scope Global -ea SilentlyContinue;del "Function:\FormatError"
            }
        }rv PYD}
    Racket = {
        $PyD = @((item C:\Program*\Racket,C:\AP-Langs\Racket-Scheme).FullName)[-1]
        if (!$PyD) {Throw "Dr. Racket Does not Exist on System!";exit}
        A2Path $PyD
        if (!$Silent) {Write-AP-Wrapper "+Configured Dr. Racket for AP-PShell Management Console!"}
        rv PYD}
    Git = {
        if (!(AP-Require "dep:git" -PassThru)) {
            $PyD = "$Home\AppData\Local\GitHub\shell.ps1"
            if (test-path $Pyd) {& $PyD}
            else {
              $PyD = item ((,"C:\Git\bin*")+
                  (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                      Join-Path "$_" "AP-Langs\Git\bin"
                      Join-Path "$_" "Program*\Git\usr\bin"
                      Join-Path "$_" "Program*\Git\mingw64\bin"
                  } | % {$_})) -ea SilentlyContinue | % FullName | Select -f 1
              if (!(test-path $Pyd)) {Throw "Git Does not Exist on System!";exit}
              A2Path $PyD
            } else {Throw "Git Does not Exist on System!";exit}
        }
        function Global:Git-RebaseDll ([Switch]$Silent) {
            pushd (cmd /c where msys-1.0.dll)
            $addr = "0x$(3..7 | Get-Random)0000000"
            rebase.exe -b $addr msys-1.0.dll
            if (!$Silent) {Write-AP "+Rebased DLL to address [$addr]"}
            popd
        }
        function Global:branches{git branch | % {$_.substring(2)}}
        function Global:Git-Rebase([Alias("Num")][int32]$Commits){
            if ($Commits -lt 1) {Write-AP "!Commit param has to be greater than 0";return}
            if (!(git rev-parse --git-dir 2>$null)) {Write-AP "!Current Directory is not a git repo...";return}
            $Commit = Git-Commits -MaxResults $Commits | select -index ($Commits-1) | % Commit
            if (!$Commit) {Write-AP "!Could find commit HEAD~$Commits";return}
            git rebase -i "$Commit^"
        }
        function Global:Git-Commits([Alias("Num")][int32]$MaxResults = 100){
            if (!(git rev-parse --git-dir 2>$null)) {Write-AP "!Current Directory is not a git repo...";return}
            $a=git log -n $MaxResults |?{"$_".trim()};$f=@()
            $idx = 0..($a.length-1) | % {if ($a[$_].substring(0,4) -eq "comm"){$_}else{-1}} | ? {$_ -gt 1}
            $idx = @($idx) + $a.length
            $prev = 0;$idx | % {$i=$_
                $tmp = $a[$prev..($i-1)];$o=@{};$id=0
                $o.commit = $tmp[$id++].split(" ")[1]
                #if (!$o.commit) {Write-AP "!$(($prev+1)..$i)","+$tmp";continue}
                if ($tmp[$id].substring(0,5) -eq "Merge") {
                    $f,$t = $tmp[$id++].substring(7).trim().split(" ")
                    $o.merge = [PSCustomObject]@{from=$f;to=$t}
                }
                $o.author = $tmp[$id++].substring("Author: ".Length)
                $o.date = $tmp[$id++].substring("Date:".length).split("-")[0].trim()
                do {
                    if ($o.message) {$o.message+="`n"}
                    $o.message += "$($tmp[$id++])".trim()
                } while ($id -lt $tmp.count -and $tmp[$id] -match "^    ")
                $prev = $i;[PSCustomObject]$o
            } | select commit,author,date,message,merge
        }
        sal commits Git-Commits -scope Global
        function Global:master{branches | ? {$_ -eq "master" -or $_ -eq "main"} | % {git checkout $_}}
        sal main master -scope Global
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
        if (!$Silent) {Write-AP-Wrapper "+Configured Git Console for AP-PShell Management Console!"}
    }
    Go = {
        $PyDs = @(item ((,"C:\Go*")+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Go*"
            })) -ea SilentlyContinue | % FullName)
        $PyD = $PyDs[-1]
        if (!$PyD) {Throw "Go-Lang Does not Exist on System!";exit}
        A2Path $PyD\bin
        if (!$Silent) {Write-AP-Wrapper "+Configured Go-Lang for AP-PShell Management Console!"}
        $env:GOPATH = ($env:GOROOT = $PyD)+"\bin"
        rv PYD}
    Redis = {
        $PyD = @((item "C:\Program Files\Redis","C:\Program Files\Redis").FullName)[-1]
        if (!$PyD) {Throw "PostgreSQL Does not Exist on System!";exit}
        A2Path $PyD
        if (!$Silent) {Write-AP-Wrapper "+Configured Redis for AP-PShell Management Console!"}
        rv PYD}
    PostgreSQL = {
        $PyD = @((item "C:\Program Files\PostgreSQL","C:\AP-Langs\PostgreSQL").FullName)[-1]
        if (!$PyD) {Throw "PostgreSQL Does not Exist on System!";exit}
        $Version = ls $PyD -Directory | ? name -match "^\d+\.\d+$" | % name
        if ($Version) {$PyD = "$PyD\$Version"}
        A2Path "$PyD\bin"
        if (!$Silent) {Write-AP-Wrapper "+Configured PostgreSQL$(if($Version){"[$Version]"}) for AP-PShell Management Console!"}
        rv PYD}
    Java = {
        $PyD = @(item (@(
            "C:\Program Files\Java",
            "C:\Program Files (x86)\Java",
            "C:\Program Files (x86)\Common Files\Oracle\Java")+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Java"
                Join-Path "$_" "AP-Progs\Java"
                Join-Path "$_" "AP-Langs\Java-*"
                Join-Path "$_" "AP-Progs\Java-*"
            })) -ea SilentlyContinue | % FullName)[-1]
        if (Test-Path "$PyD\bin\java.exe") {
            $JavaD = $PyD
        } else {
            $JavaD = @((item "$PyD\jdk*","$PyD\jre*").FullName)[0]
        }
        if (!$JavaD) {Throw "Java Does not Exist on System!";exit}
        $Version = (Split-Path -leaf $JavaD).substring(3).trim("-")
        $AndroidSDK = @((item "$Env:AppData\..\Local\Android\sdk","$PF\Android\android-sdk",C:\AP-Langs\Android*SDK -ea SilentlyContinue).FullName)[-1]
        if ($AndroidSDK) {
            $SubMsg = "x>*Extra Plugin [","nsx+AndroidSDK","ns*] connected."
            $env:ANDROID_HOME = $AndroidSDK
            "","platform-" | % {A2Path "$AndroidSDK\${_}tools"}
        }
        if ($Version -match "[^\d\.]") {
            # Common Files install
            $Version = ""
            A2Path $JavaD
        } else {A2Path "$JavaD\bin"}
        if (!$Silent) {Write-AP-Wrapper "+Configured Java [$(if($Version){"$Version "})$(if($x86){'32'}else{'64'})-bit] for AP-PShell Management Console!",$SubMsg}
        rv JavaD}
    MongoDB = {
        $PyD = @((item C:\Mongo*,C:\AP-Langs\MongoDB*,C:\AP-Progs\MongoDB*,C:\Program*File*\Mongo*).FullName)[-1]
        if (!$PyD) {Throw "MongoDB Does not Exist on System!";exit}
        pushd $PyD;$t = @(ls -r mongod.exe)[0];if (!$t) {$t="/"};$PyD = split-path $t -ea SilentlyContinue;popd
        if (!$PyD) {throw "MongoDB has a folder, but no installation??";exit}
        A2Path "$PyD"
        if (!$Silent) {Write-AP-Wrapper "+Configured MongoDB[$((mongod -version)[0].split(" ")[-1])] for AP-PShell Management Console!"}
        rv PYD}
    PHP = {
        $PyDs = @(item ((,"C:\AP-Langs\PHP-*")+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\PHP-*"
                Join-Path "$_" "AP-Langs\Wampstack-*"
            })) -ea SilentlyContinue | % FullName)
        $PyD = $PyDs[-1]
        if (!$PyD) {Throw "PHP Does not Exist on System [Must be in <Drive>:\AP-Langs\PHP-*]!";exit}
        A2Path "$PyD"
        $App,$Vers=($PyD -replace "^.*(PHP|Wampstack)\-(\d+(\.\d+){2}).*$",'$1|$2').split("|")
        if (!$Silent) {Write-AP-Wrapper "+Configured $App-$vers for AP-PShell Management Console!"}
        if ($app -eq "wampstack") {
            "apache2\bin","common\bin","mysql\bin","php" | % {A2Path "$PyD\$_"}
            $PyD += "\php"
        }
        if (!(Test-Path -type leaf "$PyD\composer.phar")) {
            Write-AP-Wrapper "!Composer missing, installing..."
            pushd $PyD
            php -r "readfile('http://getcomposer.org/installer');" | php -- --disable-tls
            popd
            if ($?) {Write-AP-Wrapper "+Installed..."}
        }
        function Global:Composer {php "$PyD\composer.phar"}
        rv PYD}
    Python = {param([string]$Version=2)
        $SomePythonAlready = AP-Require "dep:python" -pa
        $PyDs = @(item ((,"C:\Python*")+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Python*"
            })+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Anaconda*"
            })) -ea SilentlyContinue | % FullName)
        $PyD = JS-OR {@($PyDs -match "Anaconda")[0]} {($PyDs -match "(Python|Anaconda)-?$Version")[0]} $PyDs[-1]
        Negate-Path python @($PyDs | ? {$_ -ne $PyD})
        if (!$PyD) {
            if (!$SomePythonAlready) {Throw "Python Does not Exist on System!";exit}
            Write-AP-Wrapper "!I see you already have Python installed, but I could not find the version you requested. Let's work with what you have."
            $PyD = Split-Path $SomePythonAlready
        } else {
            $SomePythonAlready = ""
        }
        try {A2Path (Split-Path (Resolve-Path "~\AppData\Local\Programs\Common\Microsoft\Visual C++ for Python\*\VC\bin\*\vcbuild.exe"))} catch {Write-AP-Wrapper ">!This happened when binding VC++ for Python: [$_]"}
        $isAnaconda = $PyD -match "Anaconda"
        if ($isAnaconda) {
            $null = Import-BatchFile -File "$PyD\Scripts\activate.bat"
            # "","Scripts","Library\mingw-w64\bin","Library\usr\bin","Library\bin" | % {A2Path $PyD\$_ -Force}
        }
        "","Scripts" | % {A2Path $PyD\$_ -Try}
        "" | % {A2Path (AP-ConvertPath "<Components>\Python-Components\$_")}
        A2Path -PathVar PATHEXT .py -Force
        $env:PYTHON = "$PyD\python.exe"
        iex "Function Global:Idle {& '$PyD\Lib\idlelib\idle.pyw' @Args}"
        function global:py-server([Int16]$Port=8000,[Switch]$NewShell) {
            $pyVer = (python -V) -replace "^.+? ([23])\.\d+\.\d+$",'$1'
            $module = $(if ($pyVer -eq 3) {"http.server"}else{"SimpleHTTPServer"})
            if ($NewShell) {$p = start python "-m $module $Port" -PassThru;return $p}
            python -m $module $Port
        }
        $PY = python --version
        sal -sc Global py python
        if (!$Silent) {Write-AP-Wrapper "+Configured $PY for AP-PShell Management Console!"}
        rv PYD,Pyds,PY}
    R = {param([ValidateSet(32,64)]$bit=32)
        $x64 = $Bit -eq 64
        $PyD = Resolve-Path "C:\AP-Langs\R-*\bin" -ea SilentlyContinue
        if (!$PyD -or !(test-path $Pyd)) {Throw "R-Lang Does not Exist on System [Must be in C:\AP-Langs\R-*]!";exit}
        $BitF = 'x64','i386';if (!$x64) {[Array]::Reverse($BitF)}
        $Fo,$Fn = $BitF
        RFP "$PyD\$Fn"
        A2Path "$PyD\$Fo"
        if (!$Silent) {Write-AP-Wrapper "+Configured R-Lang[$Fo] for AP-PShell Management Console!"}
        rv PYD}
    Ruby = {param([string]$Version=2)
        $PyDs = @((item C:\Ruby*,C:\AP-Langs\Ruby* -ea stop).Fullname)
        $V = $Version -replace "\D"
        if (!($PyD = ($PyDs -match $V)[0])) {$PyD = $PyDs[-1]}
        else {Negate-Path Ruby @($PyDs -notmatch $Version)[0]}
        if (!$PyD) {Throw "Ruby Does not Exist on System!";exit}
        A2Path $PyD\bin;$N = Split-Path -leaf $PyD
        if (!$Silent) {Write-AP-Wrapper "+Configured Ruby$(Component-Version ($N -replace '\D' -replace '\d(?=.)','$0.')) for AP-PShell Management Console!"}
        rv PYD}
    Bower = {
        function Global:cc_bower_teardown.private {
            if (!$cc_TearDown_Resources) {Write-AP-Wrapper "!This function can only be executed from within the Configure-Component context";return $False}
            $cc_TearDown_Resources.removeFuncs.invoke("^Polymer-[ARP].{2,5}");return $True
        }
        Write-AP-Wrapper "x*Added Bower Friendly functions ["
        function Global:Polymer-Add($e) {bower i --save PolymerElements/$e}
        function Global:Polymer-Remove($e) {bower uninstall --save PolymerElements/$e}
        function Global:Polymer-Paper($e) {Polymer-Add "paper-$e"}
        $Funcs = ls Function:\Polymer-* | % Name
        $Funcs[0..($funcs.Length-2)] | % {Write-AP-Wrapper "nx!$_","nx*, "}
        Write-AP-Wrapper "nx!$($Funcs[-1])","n*]"
    }
    Nvm = {
        function Global:cc_nvm_teardown.private {
            if (!$cc_TearDown_Resources) {Write-AP-Wrapper "!This function can only be executed from within the Configure-Component context";return $False}
            path | ? {$_ -match [regex]::escape($env:NVM_HOME)} | % {RFP $_}
            rm env:\NVM_*
            return $True
        }
        $NVM = AP-ConvertPath "<dep>\nvm-windows"
        if (!(Test-Path $NVM)) {
            Write-AP "!NVM-Windows is missing from [$NVM], please download from: https://github.com/coreybutler/nvm-windows"
            exit
        }
        $env:NVM_HOME = $NVM
        $env:NVM_SYMLINK = Join-Path $NVM nodejs
        $env:NVM_HOME,$env:NVM_SYMLINK | % {A2Path $_ -Force}
        $Arch = $(if(test-path "$env:SYSTEMDRIVE\Program Files (x86)"){64}else{32})
        
        $LN = "root: {0}|path: {1}|arch: {2}|proxy: none" -f $NVM,$env:NVM_SYMLINK,$Arch
        $LN.replace("|","`r`n") | Out-File "$NVM\settings.txt" -en utf8
        Write-AP-Wrapper "+NVM configure for AP-PShell Management Console"
    }
    SSH = {
        if (!(AP-Require -PassThru "dep:ssh")) {Write-AP-Wrapper "!You need to have ssh in your path to use these functions";exit}
        function Global:SSH-BaseFolder {
            # Deprioritize Cygwin
            # return $(if ((Get-Path cygwin) -and (AP-Require -PassThru "dep:cygpath")) {cygpath -w "/home/$env:USERNAME/.ssh"} else {"~/.ssh"})
            return Resolve-Path "~/.ssh"
        }
        function Global:SSH-Config {
            $edit = "notepad"
            if (AP-Require "function:e" -PassThru) {$edit = 'e'}
            & $edit (Join-Path (SSH-BaseFolder) "config")
        }
        function Global:SSH-KeyFile {
            return Join-Path (SSH-BaseFolder) "id_rsa.pub"
        }
        function Global:SSH-LinkUser($HostName, $User, [Switch]$ReplaceKeys) {
            $Key = cat (SSH-KeyFile) -ea SilentlyContinue
            if (!$Key) {Write-AP "!Run ssh-keygen first (press enter on all things)";return}
            if ($User) {$HostName = "$User@$HostName"}
            # ssh.exe $HostName "mkdir -p ~/.ssh && echo '$Key' >$(if(!$ReplaceKeys){'>'}) ~/.ssh/authorized_keys && chmod go-w ~"
            ssh.exe $HostName "mkdir -p ~/.ssh; echo '$Key' >$(if(!$ReplaceKeys){'>'}) ~/.ssh/authorized_keys && chmod go-w ~/.ssh ~/.ssh/authorized_keys"
            if (!$?) {return Write-AP "!Something went wrong, or you interrupted the command"}
            Write-AP "+Linked your computer to SSH Host [$HostName]"
        }
        # Corrects Windows to Linux pathswap
        if ($isWindows) {
            function Global:scp {
                $argsNew = $args
                if ((Get-Path cygwin) -and (AP-Require "dep:cygpath" -PassThru)) {
                    $argsNew = $args | % {if (Test-Path $_) {cygpath $_} else {$_}}
                }
                return scp.exe @argsNew
            }
        }
        function global:SCP-File {
            param(
                [Parameter(Mandatory=$True,Position=0)][ArgumentCompleter({
                    param($fnName,$argName,$WordToComplete)
                    return @("localhost") + @(cat (Join-Path (SSH-BaseFolder) "config") | ? {$_ -Match "Host (.+)$"} | % {$Matches.1}) | ? {$_ -like "$WordToComplete*"}
                })][string]$SourceServer,
                [Parameter(Mandatory=$True,Position=1)][ArgumentCompleter({
                    param($fnName,$argName,$WordToComplete,$ast,$BoundParams)
                    $SrcHost = $BoundParams.SourceServer
                    # $ClosestFolder = JS-OR ($WordToComplete -replace "^(.+)\/.+$",'$1') '*'
                    if ($SrcHost -eq 'localhost') {return (ls $WordToComplete* -ea SilentlyContinue)}
                    ssh $SrcHost "ls -d $WordToComplete*"
                })][string]$SourceFile,
                [Parameter(Position=2)][ArgumentCompleter({
                    param($fnName,$argName,$WordToComplete)
                    return @("localhost") + @(cat (Join-Path (SSH-BaseFolder) "config") | ? {$_ -Match "Host (.+)$"} | % {$Matches.1}) | ? {$_ -like "$WordToComplete*"}
                })][string]$DestServer = 'localhost',
                [Parameter(Position=3)][ArgumentCompleter({
                    param($fnName,$argName,$WordToComplete,$ast,$BoundParams)
                    $DstHost = $BoundParams.DestServer
                    if ($DstHost -eq 'localhost') {return (ls $WordToComplete* -ea SilentlyContinue)}
                    # $ClosestFolder = JS-OR ($WordToComplete -replace "^(.+)\/.+$",'$1') '*'
                    ssh $DstHost "ls -d $WordToComplete*"
                })][string]$DestFile = '.',
                [Parameter(Position=4, ValueFromRemainingArguments = $true)][string[]]$scpArgs
            )
            $SrcString = $(if($SourceServer -eq 'localhost') {$SourceFile} else {"${SourceServer}:$SourceFile"})
            $DstString = $(if($DestServer -eq 'localhost') {$DestFile} else {"${DestServer}:$DestFile"})
            # The replace is needed since SCP doesn't like spaces in paths (https://stackoverflow.com/questions/19858176/how-do-i-escape-spaces-in-path-for-scp-copy-in-linux)
            scp @scpArgs "$SrcString".replace(' ','*') "$DstString".replace(' ','*')
        }
        if (!$Silent) {Write-AP-Wrapper "+Configured SSH Helpers and Commands for AP-PShell Management Console!"}
    }
}
if ($Resolve) {
    $Resolve = JS-OR $Script:AliasDB.$Resolve $Resolve
    $Comps = List-Components $Components -Pass
    foreach ($Comp in $Comps.custom) {
        if ($Comp -ne $Resolve) {continue}
        AP-ConvertPath "<Comp>/$Comp.ps1"
        exit
    }
    foreach ($Comp in $Comps.internal) {
        if ($Comp -ne $Resolve) {continue}
        $PSCommandPath
        exit
    }
    exit
}
if ($List) {
    List-Components $Components -Pass:$PassThru
    exit
}
if ($Remove) {
    $Comp = Component-Alias $Component;$Func = item "Function:\cc_${comp}_teardown.private" -ea SilentlyContinue
    if (!$Func) {Write-AP-Wrapper "!No Teardown method found for [$Comp]";exit}
    $cc_TearDown_Resources = Get-CC-TearDown
    $o = iex $Func
    if (!$o) {Write-AP-Wrapper "!Failed to remove component [$Comp]";exit}
    $Func | Remove-Item
    Write-AP-Wrapper "x+Removed component [","nx!$Comp","n+]"
    exit
}
#if (!$InRecurse -and $Preference.GetType().name -eq "Hashtable") {$Primed = @{};@($Preference.Keys) | % {$Primed.(Component-Alias $_) = $Preference.$_};$Preference=$Primed}
if ($Debug) {Write-AP-Wrapper "!$Component Args: $(Get-Prefs $Preference $Component)"}
if ($Component.Count -gt 1) {Recurse-Me $Component}
elseif ($Component -eq "All-Langs") {Recurse-Me @($Components.keys)}
elseif ($Components.($Comp = Component-Alias $Component)) {try{$Components.$Comp.invoke((Get-Prefs $Preference $Component))}catch{Process-Invoke $comp $_}}
elseif (Test-Path (AP-ConvertPath "<Comp>\$Component.ps1")) {try{& (AP-ConvertPath "<Comp>\$Component.ps1") (Get-Prefs $Preference $Component)}catch{Process-Invoke $comp $_ 2}}
else {Write-AP-Wrapper "!Component [$Component] not found."}
