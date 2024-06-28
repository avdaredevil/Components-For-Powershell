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
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gU3RyaXAtQ29sb3JDb2RlcyB7cGFyYW0oJFN0cikNCg0KICAgICRTdHIgfCAlIHskXyAtcmVwbGFjZSAiJChbcmVnZXhdOjplc2NhcGUoIiQoR2V0LUVzY2FwZSlbIikpXGQrKFw7XGQrKSptIiwiIn0NCn0KCmZ1bmN0aW9uIEltcG9ydC1CYXRjaEZpbGUge3BhcmFtKCRGaWxlLCBbU3dpdGNoXSRWZXJib3NlLCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIGlmICgkRmlsZSAtbm90bWF0Y2ggIi4oYmF0fGNtZCkkIikgeyRPdXQgPSBKUy1PUiAoSW1wb3J0LUJhdGNoRmlsZSAiJEZpbGUuYmF0IiAtVmVyYm9zZTokVmVyYm9zZSAtUGFzc1RocnUpIHtJbXBvcnQtQmF0Y2hGaWxlICIkRmlsZS5jbWQiIC1WZXJib3NlOiRWZXJib3NlIC1QYXNzVGhydX07aWYgKCRQYXNzVGhydSkge1JldHVybiAkT3V0fTtyZXR1cm4gISEkT3V0fQ0KICAgICRvZiA9ICRGaWxlOyRTQyA9ICJTaWxlbnRseUNvbnRpbnVlIg0KICAgICRGaWxlID0gSlMtT1IgKFJlc29sdmUtUGF0aCAkRmlsZSAtZWEgJFNDKSB7R2V0LVdoZXJlICRGaWxlfQ0KICAgIGlmICghJEZpbGUpIHtXcml0ZS1BUCAibnghWyIsIm54I0FQLUVuZ2luZSIsIm54Kjo6IiwibngrSW1wb3J0LURvcyIsIm54IV0gIiwibiFDb3VsZCBub3QgcmVzb2x2ZSBbJG9mXSB0byBhIHZhbGlkIHNjcmlwdCBmaWxlIjtyZXR1cm4gJGZhbHNlfQ0KICAgIHB1c2hkIChTcGxpdC1QYXRoICRGaWxlKQ0KICAgIGlmICgkVmVyYm9zZSkge1dyaXRlLUFQICJ4KkltcG9ydGluZyBGaWxlICIsIm4hJEZpbGUifQ0KICAgICRWYXJzID0gQCgpOw0KICAgIGZvcmVhY2ggKCRsIGluIChjbWQgL2MgIiQoU3BsaXQtUGF0aCAtbGVhZiAkRmlsZSk+bnVsIDI+bnVsJnNldCIgfCA/IHskXyAtbWF0Y2ggIj0ifSkpIHsNCiAgICAgICAgJGssJHYgPSAkbC5zcGxpdCgiPSIpDQogICAgICAgIGlmICghJGsgLW9yIChbZW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCIkayIpIC1lcSAkdikpIHtjb250aW51ZX0NCiAgICAgICAgJFZhcnMgKz0gLCIkayINCiAgICAgICAgc2V0LWl0ZW0gLWZvcmNlIC1wYXRoICJFTlY6XCRrIiAtdmFsdWUgIiR2Ig0KICAgICAgICBpZiAoJFZlcmJvc2UpIHtXcml0ZS1BUCAieD4rQWRkZWQgIiwibngjRW52IiwibngrOiIsIm4hJGsifQ0KICAgIH0NCiAgICBwb3BkDQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiBbUFNDdXN0b21PYmplY3RdQHtmaWxlPSRGaWxlO3ZhcnM9JFZhcnN9fQ0KICAgIHJldHVybiAkVHJ1ZQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmU9Il5eXiIpDQoNCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIiAtYW5kICRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0gZWxzZSB7aWYgKCRTdG9yZSAtZXEgIl5eXiIpIHtyZXR1cm4gJEZhbHNlfX0NCiAgICAkQW5zID0gJEZhbHNlDQogICAgJEtleSB8ICUgew0KICAgICAgICAkU09VUkNFID0gJF8NCiAgICAgICAgdHJ5IHsNCiAgICAgICAgICAgICRBbnMgPSAkQW5zIC1vciAoS2V5UHJlc3NlZENvZGUgJFNPVVJDRSAkU3RvcmUpDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgRm9yZWFjaCAoJEsgaW4gJFNPVVJDRSkgew0KICAgICAgICAgICAgICAgIFtTdHJpbmddJEsgPSAkSw0KICAgICAgICAgICAgICAgIGlmICgkSy5sZW5ndGggLWd0IDQgLWFuZCAoJEtbMCwxLC0xLC0yXSAtam9pbigiIikpIC1lcSAifn5+fiIpIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yIChLZXlQcmVzc2VkQ29kZSAoS2V5VHJhbnNsYXRlKCRLKSkgJFN0b3JlKQ0KICAgICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoJEsuY2hhcnMoMCkgLWluICRTdG9yZS5DaGFyYWN0ZXIpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHJldHVybiAkQW5zDQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHtbQ2hhcl0weDFifQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBBUC1SZXF1aXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWwsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgJExvYWRNb2R1bGUgPSB7DQogICAgICAgIHBhcmFtKCRGaWxlLFtib29sXSRJbXBvcnQpDQogICAgICAgIHRyeSB7SW1wb3J0LU1vZHVsZSAkRmlsZSAtZWEgc3RvcDtyZXR1cm4gMX0gY2F0Y2gge30NCiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIg0KICAgICAgICBbc3RyaW5nXSRmID0gaWYodGVzdC1wYXRoIC10IGxlYWYgJExGKXskTEZ9ZWxzZWlmKHRlc3QtcGF0aCAtdCBsZWFmICIkTEYuZGxsIil7IiRMRi5kbGwifQ0KICAgICAgICBpZiAoJGYgLWFuZCAkSW1wb3J0KSB7SW1wb3J0LU1vZHVsZSAkZn0NCiAgICAgICAgcmV0dXJuICRmDQogICAgfQ0KICAgICRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAgICAgICAgICAgICAgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSIgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSIgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9DQp9CgpmdW5jdGlvbiBJcy1BZmZpcm1hdGl2ZSB7cGFyYW0oJFRleHQpDQokZWFoID0gIltldWFdKltwaHNdKiI7cmV0dXJuICRUZXh0IC1tYXRjaCAiXig/IT1ubyt0ICopKCg/IT1uJHtlYWh9KWEqeSske2VhaH18KHBofGYpWzBvXSsgc3UrcitlezAsM318YWZmaXJ8cG9zaXRpdmV8b2ZmPyBjb3Vyc2UpIn0KCmZ1bmN0aW9uIEdldC1Db2xvciB7DQogICAgPCMgIC5EZXNjcmlwdGlvbg0KICAgICAgICBGZXRjaGVzIGJhc2ljIGNvbG9ycyB1c2luZyB0aGUgVW5pY29kZSBFc2NhcGUgc2VxdWVuY2VzDQogICAgIz4NCiAgICBwYXJhbSAoDQogICAgICAgIFtWYWxpZGF0ZVNldCgNCiAgICAgICAgICAgICdyJywncmVzZXQnLCdkJywnZGltJywncycsJ3N0cmlrZScsJ3UnLCd1bmRlcmxpbmUnLCdiJywnYm9sZCcsJ2knLCdpdGFsaWMnLA0KICAgICAgICAgICAgJ0JsYWNrJywnRGFya0JsdWUnLCdEYXJrR3JlZW4nLCdEYXJrQ3lhbicsJ0RhcmtSZWQnLCdEYXJrTWFnZW50YScsJ0RhcmtZZWxsb3cnLCdHcmF5JywnRGFya0dyYXknLCdCbHVlJywnR3JlZW4nLCdDeWFuJywnUmVkJywnTWFnZW50YScsJ1llbGxvdycsJ1doaXRlJywNCiAgICAgICAgICAgICdiZy5CbGFjaycsJ2JnLkRhcmtCbHVlJywnYmcuRGFya0dyZWVuJywnYmcuRGFya0N5YW4nLCdiZy5EYXJrUmVkJywnYmcuRGFya01hZ2VudGEnLCdiZy5EYXJrWWVsbG93JywnYmcuR3JheScsJ2JnLkRhcmtHcmF5JywnYmcuQmx1ZScsJ2JnLkdyZWVuJywnYmcuQ3lhbicsJ2JnLlJlZCcsJ2JnLk1hZ2VudGEnLCdiZy5ZZWxsb3cnLCdiZy5XaGl0ZScNCiAgICAgICAgKV1bU3RyaW5nW11dJENvZGUsDQogICAgICAgIFtBbGlhcygnYmcnKV1bU3dpdGNoXSRCYWNrZ3JvdW5kLA0KICAgICAgICBbU3dpdGNoXSRDb2RlU3RyaW5nDQogICAgKQ0KICAgICRBbGlhc1RhYmxlID0gQHt1ID0gJ3VuZGVybGluZSc7YiA9ICdib2xkJztpID0gJ2l0YWxpYyc7ciA9ICdyZXNldCc7cyA9ICdzdHJpa2UnO2QgPSAnZGltJ30NCiAgICBpZiAoISRHbG9iYWw6QVBfQ09MT1JfVEFCTEUpIHsNCiAgICAgICAgJFRCTCA9ICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUgPSBAe3Jlc2V0ID0gMDtib2xkID0gMTtkaW0gPSAyO2l0YWxpYyA9IDM7dW5kZXJsaW5lID0gNDtzdHJpa2UgPSA5fQ0KICAgICAgICAwLDEgfCAlIHsNCiAgICAgICAgICAgICRCZ0luZGV4ID0gJF8NCiAgICAgICAgICAgIDAsMSB8ICUgew0KICAgICAgICAgICAgICAgICRTcGNJbmRleCA9ICRfDQogICAgICAgICAgICAgICAgJGkgPSAwDQogICAgICAgICAgICAgICAgJ0JsYWNrLlR8UmVkfEdyZWVufFllbGxvd3xCbHVlfE1hZ2VudGF8Q3lhbnxXaGl0ZScuc3BsaXQoJ3wnKSB8ICUgew0KICAgICAgICAgICAgICAgICAgICAkSW5jciA9ICRCZ0luZGV4ICogMTANCiAgICAgICAgICAgICAgICAgICAgJENvbE5hbWUgPSAoKCcnLCdiZy4nKVskQmdJbmRleF0pKygoJ0RhcmsnLCcnKVskU3BjSW5kZXhdKSskXw0KICAgICAgICAgICAgICAgICAgICAkQ29sU3BhY2UgPSAoMzAsIDkwKVskU3BjSW5kZXhdICsgJEluY3INCiAgICAgICAgICAgICAgICAgICAgJFRCTC4kQ29sTmFtZSA9ICRDb2xTcGFjZSsoJGkrKykNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgQHtEYXJrR3JheSA9ICdCbGFjay5UJztCbGFjayA9ICdEYXJrQmxhY2suVCc7R3JheSA9ICdEYXJrV2hpdGUnfS5HZXRFbnVtZXJhdG9yKCkgfCAlIHsNCiAgICAgICAgICAgICRUQkwuKCRfLktleSkgPSAkVEJMLigkXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwuKCdiZy4nKyRfLktleSkgPSAkVEJMLignYmcuJyskXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwucmVtb3ZlKCRfLlZhbHVlKQ0KICAgICAgICAgICAgJFRCTC5yZW1vdmUoJ2JnLicrJF8uVmFsdWUpDQogICAgICAgIH0NCiAgICB9DQogICAgJENvZGVzID0gKCRDb2RlKyRBcmdzIHwgJSB7DQogICAgICAgICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUuKEpTLU9SICRBbGlhc1RhYmxlLiRfICRfKQ0KICAgIH0pIC1qb2luICc7Jw0KICAgIGlmICgkQ29kZVN0cmluZykge3JldHVybiAkQ29kZXN9DQogICAgcmV0dXJuICIkKEdldC1Fc2NhcGUpWyR7Q29kZXN9bSINCn0KCmZ1bmN0aW9uIEFkZC1Ub1BhdGgge3BhcmFtKFtWYWxpZGF0ZVBhdHRlcm4oIi4rIildW1N0cmluZ10kRm9sZGVyID0gJFBXRCwgW0FsaWFzKCJwIiwicHJlIiwiYmFjayIpXVtzd2l0Y2hdJFByZXBlbmQsIFtTd2l0Y2hdJFRyeSwgW1N3aXRjaF0kRm9yY2UsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICB0cnkgew0KICAgICAgICBpZiAoISRGb3JjZSkge3RyeSB7JEZvbGRlciA9IFJlc29sdmUtUGF0aCAkRm9sZGVyIC1FcnJvckFjdGlvbiBTdG9wfSBjYXRjaCB7VGhyb3cgIltBUC1QYXRoOkFkZF0gRm9sZGVyIFskRm9sZGVyXSBEb2VzIG5vdCBFeGlzdCJ9fQ0KICAgICAgICBpZiAoISRGb3JjZSAtYW5kIChUZXN0LVBhdGggJGZvbGRlciAtdHlwZSBsZWFmKSkge1Rocm93ICJbQVAtUGF0aDpBZGRdIElucHV0IFskRm9sZGVyXSBtdXN0IGJlIGEgZm9sZGVyISJ9DQogICAgICAgIGlmICgkRm9sZGVyIC1pbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7cmV0dXJufQ0KICAgICAgICAkUHRoID0gR2V0LUNvbnRlbnQgZW52OlwkUGF0aFZhcg0KICAgICAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAgICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgICAgICBpZiAoISRQcmVwZW5kKSB7JFB0aCArPSAiJFBhdGhTZXAkRm9sZGVyIn0gZWxzZSB7JFB0aCA9ICIkRm9sZGVyJFBhdGhTZXAkKCRQdGgpIn0NCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKCRUcnkpIHtyZXR1cm59DQogICAgICAgIFRocm93ICRfDQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gUHJpbnQtTGlzdCB7cGFyYW0oJHgsIFtTd2l0Y2hdJEluUmVjdXJzZSkNCg0KICAgIGlmICgkeC5jb3VudCAtbGUgMSkge3JldHVybiA/OigkSW5SZWN1cnNlKXskeH17IlskeF0ifX0gZWxzZSB7DQogICAgICAgIHJldHVybiAiWyQoKCR4IHwgJSB7UHJpbnQtTGlzdCAkXyAtSW5SZWN1cnNlfSkgLWpvaW4gJywgJyldIg0KICAgIH0NCn0KCmZ1bmN0aW9uIExvYWQtTGludXhBbGlhc2VzIHsNCiAgICAjIFJlZmVyZW5jZTogaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1Bvd2VyU2hlbGwvUG93ZXJTaGVsbC85OGNmNDRjZGVjZDcyZmZjMzI4YzNiN2NhMjE2ZmFlMjBhMDhmMWU0L3NyYy9TeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uL2VuZ2luZS9Jbml0aWFsU2Vzc2lvblN0YXRlLmNzDQogICAgIyAkdG9nPTA7JGEgLXNwbGl0ICJgcj9gbiIgfCAlIHtpZiAoISR0b2cpIHskdG9nID0gJF8gLW1hdGNoICJcIXVuaXgifSBlbHNlaWYgKCRfIC1tYXRjaCAiZW5kaWYiKSB7JHRvZyA9ICRmYWxzZX07JF99IHwgPyB7JHRvZyAtYW5kICRfIC1tYXRjaCAiU2Vzc2lvblN0YXRlQWxpYXNFbnRyeSJ9IHwgJSB7JHAgPSAkXyAtc3BsaXQgIlwiIiI7JGFsLCRjbWQgPSAkcFsxLDNdOyJTZXQtQWxpYXMgJGFsICRjbWQifQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGFjIEFkZC1Db250ZW50DQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgY29tcGFyZSBDb21wYXJlLU9iamVjdA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNwcCBDb3B5LUl0ZW1Qcm9wZXJ0eQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGRpZmYgQ29tcGFyZS1PYmplY3QNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBnc3YgR2V0LVNlcnZpY2UNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBzbGVlcCBTdGFydC1TbGVlcA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHNvcnQgU29ydC1PYmplY3QNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBzdGFydCBTdGFydC1Qcm9jZXNzDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgc2FzdiBTdGFydC1TZXJ2aWNlDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgc3BzdiBTdG9wLVNlcnZpY2UNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCB0ZWUgVGVlLU9iamVjdA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHdyaXRlIFdyaXRlLU91dHB1dA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNhdCBHZXQtQ29udGVudA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGNwIENvcHktSXRlbQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGxzIEdldC1DaGlsZEl0ZW0NCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBtYW4gaGVscA0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIG1vdW50IE5ldy1QU0RyaXZlDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgbXYgTW92ZS1JdGVtDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgcHMgR2V0LVByb2Nlc3MNCiAgICBTZXQtQWxpYXMgLXNjIEdsb2JhbCBybSBSZW1vdmUtSXRlbQ0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIHJtZGlyIFJlbW92ZS1JdGVtDQogICAgU2V0LUFsaWFzIC1zYyBHbG9iYWwgY25zbiBDb25uZWN0LVBTU2Vzc2lvbg0KICAgIFNldC1BbGlhcyAtc2MgR2xvYmFsIGRuc24gRGlzY29ubmVjdC1QU1Nlc3Npb24NCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gW2NvbnNvbGVdOjpCdWZmZXJXaWR0aA0KICAgICAgICAkQ2xlYW5UZXh0U2l6ZSA9IChTdHJpcC1Db2xvckNvZGVzICgiIiskVGV4dCkpLkxlbmd0aA0KICAgICAgICBpZiAoJENsZWFuVGV4dFNpemUgLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCRDbGVhblRleHRTaXplLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQogICAgICAgICAgICAgICAgIyAiIiskaisiIC0gIiskcA0KICAgICAgICAgICAgICAgICRBcHBlbmRlclskal0gKz0gJFRleHQuY2hhcnMoJHApDQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gKEFsaWduLVRleHQgJEFwcGVuZGVyICRBbGlnbikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGlmICgkQWxpZ24gLWVxICJDZW50ZXIiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRBbGlnbiAtZXEgIlJpZ2h0Iikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKigkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZS0xKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgkVGV4dCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEZsYXR0ZW4ge3BhcmFtKFtvYmplY3RbXV0keCkNCg0KICAgIGlmICghKCRYIC1pcyBbYXJyYXldKSkge3JldHVybiAkeH0NCiAgICBpZiAoJFguY291bnQgLWVxIDEpIHsNCiAgICAgICAgcmV0dXJuICR4IHwgJSB7JF99DQogICAgfQ0KICAgICR4IHwgJSB7RmxhdHRlbiAkX30NCn0KCmZ1bmN0aW9uIEtleVRyYW5zbGF0ZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJEtleSkNCg0KICAgICRIYXNoS2V5ID0gQHsNCiAgICAgICAgIn5+Q3RybEN+fiI9NjcNCiAgICAgICAgIn5+U3BhY2V+fiI9MzINCiAgICAgICAgIn5+RVNDQVBFfn4iPTI3DQogICAgICAgICJ+fkVudGVyfn4iPTEzDQogICAgICAgICJ+flNoaWZ0fn4iPTE2DQogICAgICAgICJ+fkNvbnRyb2x+fiI9MTcNCiAgICAgICAgIn5+QWx0fn4iPTE4DQogICAgICAgICJ+fkJhY2tTcGFjZX5+Ij04DQogICAgICAgICJ+fkRlbGV0ZX5+Ij00Ng0KICAgICAgICAifn5mMX5+Ij0xMTINCiAgICAgICAgIn5+ZjJ+fiI9MTEzDQogICAgICAgICJ+fmYzfn4iPTExNA0KICAgICAgICAifn5mNH5+Ij0xMTUNCiAgICAgICAgIn5+ZjV+fiI9MTE2DQogICAgICAgICJ+fmY2fn4iPTExNw0KICAgICAgICAifn5mN35+Ij0xMTgNCiAgICAgICAgIn5+Zjh+fiI9MTE5DQogICAgICAgICJ+fmY5fn4iPTEyMA0KICAgICAgICAifn5mMTB+fiI9MTIxDQogICAgICAgICJ+fmYxMX5+Ij0xMjINCiAgICAgICAgIn5+ZjEyfn4iPTEyMw0KICAgICAgICAifn5NdXRlfn4iPTE3Mw0KICAgICAgICAifn5JbnNlcnR+fiI9NDUNCiAgICAgICAgIn5+UGFnZVVwfn4iPTMzDQogICAgICAgICJ+flBhZ2VEb3dufn4iPTM0DQogICAgICAgICJ+fkVORH5+Ij0zNQ0KICAgICAgICAifn5IT01Ffn4iPTM2DQogICAgICAgICJ+fnRhYn5+Ij05DQogICAgICAgICJ+fkNhcHNMb2Nrfn4iPTIwDQogICAgICAgICJ+fk51bUxvY2t+fiI9MTQ0DQogICAgICAgICJ+flNjcm9sbExvY2t+fiI9MTQ1DQogICAgICAgICJ+fldpbmRvd3N+fiI9OTENCiAgICAgICAgIn5+TGVmdH5+Ij0zNw0KICAgICAgICAifn5VcH5+Ij0zOA0KICAgICAgICAifn5SaWdodH5+Ij0zOQ0KICAgICAgICAifn5Eb3dufn4iPTQwDQogICAgICAgICJ+fktQMH5+Ij05Ng0KICAgICAgICAifn5LUDF+fiI9OTcNCiAgICAgICAgIn5+S1Ayfn4iPTk4DQogICAgICAgICJ+fktQM35+Ij05OQ0KICAgICAgICAifn5LUDR+fiI9MTAwDQogICAgICAgICJ+fktQNX5+Ij0xMDENCiAgICAgICAgIn5+S1A2fn4iPTEwMg0KICAgICAgICAifn5LUDd+fiI9MTAzDQogICAgICAgICJ+fktQOH5+Ij0xMDQNCiAgICAgICAgIn5+S1A5fn4iPTEwNQ0KICAgIH0NCiAgICBpZiAoW2ludF0kQ29udmVydCA9ICRIYXNoS2V5LiRLZXkpIHtyZXR1cm4gJENvbnZlcnR9DQogICAgVGhyb3cgIkludmFsaWQgU3BlY2lhbCBLZXkgQ29udmVyc2lvbiINCn0KCmZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykge2lmICghJGEpIHtjb250aW51ZX07aWYgKCRhLkdldFR5cGUoKS5OYW1lIC1lcSAiU2NyaXB0QmxvY2siKSB7JGEgPSAkYS5pbnZva2UoKTtpZiAoISRhKXtjb250aW51ZX19O3JldHVybiAkYX19CgpmdW5jdGlvbiBLZXlQcmVzc2VkQ29kZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtJbnRdJEtleSwgJFN0b3JlPSJeXl4iKQ0KDQogICAgaWYgKCEkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUgLWFuZCAkU3RvcmUgLWVxICJeXl4iKSB7UmV0dXJuICRGYWxzZX0NCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIikgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0NCiAgICByZXR1cm4gKCRLZXkgLWluICRTdG9yZS5WaXJ0dWFsS2V5Q29kZSkNCn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgNTAwKSB7JFNsZWVwID0gMTAwfQ0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskVHJTdHJpbmc9IiJ9IGVsc2UgeyRUclN0cmluZyA9ID86ICgkVHJTdHJpbmcuTGVuZ3RoIC1lcSAwKXsiIn17JFRyU3RyaW5nLnN1YnN0cmluZygwLCRUclN0cmluZy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRUclN0cmluZyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JFRyU3RyaW5nPSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjticmVha30gZWxzZSANCiAgICAgICAgeyRUclN0cmluZyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJGlQb3N4DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yVG9wID0gJGlQb3N5DQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFJlbW92ZS1Gcm9tUGF0aCB7cGFyYW0oW1N0cmluZ10kRm9sZGVyID0gIiIsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICBpZiAoISRGb2xkZXIpIHtyZXR1cm59DQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KSAgICANCiAgICAkUHRoID0gKEdldC1QYXRoIHwgPyB7JF8gLWluZSAkRm9sZGVyfSkgLWpvaW4oJFBhdGhTZXApDQogICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCn0KClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQpTZXQtQWxpYXMgY29sIEdldC1Db2xvcgpTZXQtQWxpYXMgQTJQYXRoIEFkZC1Ub1BhdGgKU2V0LUFsaWFzIFJGUCBSZW1vdmUtRnJvbVBhdGg=")
# ========================================END=OF=COMPILER===========================================================|

AP-Require "function:Get-Path" {Write-AP "!Get-Path needs to be available from AP-Console to use this command";exit}
function Recurse-Me($arr) {$arr | % {
        $Common = @{Silent=$Silent;ThrowErrors=$ThrowErrors;Debug=$Debug;RawOutput=$RawOutput;InRecurse=$true}
        if ($List) {& $PSCommandPath -List:$List -PassThru:$PassThru @Common}
        else {& $PSCommandPath $_ $Preference @Common}
    }
}
function Process-Throw($s,$l=1) {if(!$s.Exception.WasThrownFromThrowStatement){JS-OR $s.Exception.InnerException.Message $s.Exception.message}else{$s=$s.Exception;if ($l -eq 2) {$s = $s.message};$s}}
function Process-Invoke($c,$s,$l=1) {if(!$ThrowErrors){Write-AP "x!Could not attach component ","nx+$c","xn! [","xn#$(Process-Throw $s $l)","n!]"}else{Throw (Process-Throw $S)}}
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
function List-Components ($Components, [Switch]$Pass) {
    $r = @{custom=@()}
    if ($Pass) {$r.internal = @($Components.keys)} else {
        Write-AP-Wrapper "*Listing All Packages:"
        Write-AP-Wrapper ">+Languages: $(Print-List ($Components.keys) -I)"
        Write-AP-Wrapper ">+Custom Components:"
    }
    ls (AP-ConvertPath "<Comp>\*.ps1") | % {$_.Name.replace(".ps1","")} | % {if ($Pass) {$r.custom += ,$_} else {Write-AP-Wrapper ">>!$_"}}
    if ($Pass) {[PSCustomObject]$r}
}
if ($Update) {
    if ($Host.Version.Major -lt 3) {Write-Host -f yellow "[!] PowerShell versions under 3 not supported. Please update to windows 10";exit}
    Write-AP "*Checking for Updates for Configure-Component..."
    $Vers = Check-ScriptVersions
    if (!$Vers) {Write-AP "!Internet connection is required to update Configure-Component";exit}
    if ($Vers.Remote -le $Vers.local) {Write-AP ">*No updates required";exit}
    Write-AP "x>+Update found [","nx#v$($vers.local)","nx+ ~ ","nx!v$($vers.remote)","n+]"
    $Script:API_DATA | out-file -en ascii $PSCommandPath
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
        $PyDs = @(item ((,"C:\Python*")+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Python*"
            })+
            (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                Join-Path "$_" "AP-Langs\Anaconda*"
            })) -ea SilentlyContinue | % FullName)
        $PyD = JS-OR {@($PyDs -match "Anaconda")[0]} {($PyDs -match "(Python|Anaconda)-?$Version")[0]} $PyDs[-1]
        Negate-Path python @($PyDs | ? {$_ -ne $PyD})
        if (!$PyD) {Throw "Python Does not Exist on System!";exit}
        try {A2Path (Split-Path (Resolve-Path "~\AppData\Local\Programs\Common\Microsoft\Visual C++ for Python\*\VC\bin\*\vcbuild.exe"))} catch {Write-AP-Wrapper ">!This happened when binding VC++ for Python: [$_]"}
        $isAnaconda = $PyD -match "Anaconda"
        if ($isAnaconda) {
            $null = Import-BatchFile -File "$PyD\Scripts\activate.bat"
            # "","Scripts","Library\mingw-w64\bin","Library\usr\bin","Library\bin" | % {A2Path $PyD\$_ -Force}
        }
        "","Scripts" | % {A2Path $PyD\$_}
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
        $PY = Split-Path -leaf $PyD
        sal -sc Global py python
        if (!$Silent) {Write-AP-Wrapper "+Configured $($PY -replace '\-?\d+$')$(Component-Version ($PY -replace 'python|anaconda')) for AP-PShell Management Console!"}
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
        $LN.replace("|","`r`n") | Out-File "$NVM\settings.txt" -en ascii
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
        function Global:scp {
            $argsNew = $args
            if ((Get-Path cygwin) -and (AP-Require "dep:cygpath" -PassThru)) {
                $argsNew = $args | % {if (Test-Path $_) {cygpath $_} else {$_}}
            }
            return scp.exe @argsNew
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
                })][string]$DestFile = '.'
            )
            $SrcString = $(if($SourceServer -eq 'localhost') {$SourceFile} else {"${SourceServer}:$SourceFile"})
            $DstString = $(if($DestServer -eq 'localhost') {$DestFile} else {"${DestServer}:$DestFile"})
            # The replace is needed since SCP doesn't like spaces in paths (https://stackoverflow.com/questions/19858176/how-do-i-escape-spaces-in-path-for-scp-copy-in-linux)
            scp "$SrcString".replace(' ','*') "$DstString".replace(' ','*')
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
