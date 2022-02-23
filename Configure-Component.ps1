<#
|==============================================================================>|
   Configure-Component by APoorv Verma [AP] on 10/23/2015 || Version: 1.0.8
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
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW5wdXQtUHJvbXB0IHtwYXJhbShbVmFsaWRhdGVOb3ROdWxsb3JFbXB0eSgpXVtTdHJpbmddJFByb21wdCA9ICJFbnRlciBUZXh0IDogIikNCg0KICAgIFdyaXRlLWhvc3QgLW5vbmV3bGluZSAkUHJvbXB0DQogICAgJFJlUmVnWCA9ICdbXlx4MDEtXHgwOFx4MTAtXHg4MF0rJyMnW15cd1wuXScgW9CQLdGP0IHRkV0NCiAgICAkVHJTdHJpbmcgPSAiIg0KICAgICRpUG9zeCA9IFtDb25zb2xlXTo6Q3Vyc29yTGVmdA0KICAgICRpUG9zeSA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wDQogICAgJEN2aXMgPSBbQ29uc29sZV06OkN1cnNvclZpc2libGUNCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2UNCiAgICAkQ291bnQgPSAxOyRTbGVlcCA9IDANCiAgICBXaGlsZSAoJFRydWUpIHsNCiAgICAgICAgaWYgKCRjb3VudCAtZ3QgNTAwKSB7JFNsZWVwID0gMTAwfQ0KICAgICAgICBpZiAoJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleURvd24sTm9FY2hvIik7JENvdW50PTA7JFNsZWVwPTB9IGVsc2UgeyRDb3VudCsrO1N0YXJ0LVNsZWVwIC1tICRTbGVlcDtjb250aW51ZX0NCiAgICAgICAgaWYgKEtleVByZXNzZWQgIn5+QmFja1NwYWNlfn4iICRTdG9yZSkge2lmICgkc3RvcmUuQ29udHJvbEtleVN0YXRlIC1tYXRjaCAiY3RybCIpIHskVHJTdHJpbmc9IiJ9IGVsc2UgeyRUclN0cmluZyA9ID86ICgkVHJTdHJpbmcuTGVuZ3RoIC1lcSAwKXsiIn17JFRyU3RyaW5nLnN1YnN0cmluZygwLCRUclN0cmluZy5MZW5ndGgtMSl9fX0NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+flNwYWNlfn4iICRTdG9yZSkgeyRUclN0cmluZyArPSAiICJ9DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5Fc2NhcGV+fiIgJFN0b3JlKSB7JFRyU3RyaW5nPSIiO2JyZWFrfQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RU5URVJ+fiIgJFN0b3JlKSB7V3JpdGUtSG9zdCAiIjticmVha30gZWxzZSANCiAgICAgICAgeyRUclN0cmluZyArPSAkU3RvcmUuQ2hhcmFjdGVyIC1yZXBsYWNlICgkUmVSZWdYLCcnKX0NCiAgICAgICAgJHd0ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aCAtICRpUG9zeCAtIDENCiAgICAgICAgW0NvbnNvbGVdOjpDdXJzb3JsZWZ0ID0gJGlQb3N4DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yVG9wID0gJGlQb3N5DQogICAgICAgIGlmICgkd3QtJFRyU3RyaW5nLkxlbmd0aCAtbHQgMCkgew0KICAgICAgICAgICAgJHRiPSIiDQogICAgICAgICAgICAkdHQ9Ii4uLiIrJFRyU3RyaW5nLnN1YnN0cmluZygkVHJTdHJpbmcuTGVuZ3RoLSR3dCszKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgJHRiPSIgIiooJHd0LSRUclN0cmluZy5MZW5ndGgpDQogICAgICAgICAgICAkdHQ9JFRyU3RyaW5nDQogICAgICAgIH0NCiAgICAgICAgJGZjb2wgPSBbY29uc29sZV06OkZvcmVncm91bmRDb2xvcg0KICAgICAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgLWYgJGZDb2wgJHR0JFRiDQogICAgfQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRDdmlzDQogICAgcmV0dXJuICRUUlN0cmluZw0KfQoKZnVuY3Rpb24gUHJvY2Vzcy1UcmFuc3BhcmVuY3kge3BhcmFtKFtBbGlhcygiVHJhbnNwYXJlbmN5IiwiSW52aXNpYmlsaXR5IiwiaSIsInQiKV1bVmFsaWRhdGVSYW5nZSgwLDEwMCldW2ludF0kVHJhbnM9MCwgW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRQcm9jZXNzKQ0KDQogICAgaWYgKCRQcm9jZXNzIC1tYXRjaCAiXC5leGUkIikgeyRQcm9jZXNzID0gJFByb2Nlc3MucmVwbGFjZSgiLmV4ZSIsIiIpfQ0KICAgIFRyeSB7DQogICAgICAgIGlmICgkUHJvY2Vzcy5uYW1lKSB7JFByb2MgPSAkUHJvY2Vzcy5uYW1lfSBlbHNlIHskUHJvYyA9IChHZXQtUHJvY2VzcyAkUHJvY2VzcyAtRXJyb3JBY3Rpb24gU3RvcClbMF0ubmFtZX0NCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKFtJbnRdOjpUcnlQYXJzZSgkUHJvY2VzcywgW3JlZl0zKSkgeyRQcm9jID0gKChHZXQtUHJvY2VzcyB8ID8geyRfLklEIC1lcSAkUHJvY2Vzc30pWzBdKS5uYW1lfQ0KICAgIH0NCiAgICBpZiAoJFByb2MgLW5vdE1hdGNoICJcLmV4ZSQiKSB7JFByb2MgPSAiJFByb2MuZXhlIn0NCiAgICBuaXJjbWQgd2luIHRyYW5zIHByb2Nlc3MgIiRQcm9jIiAoKDEwMC0kVHJhbnMpKjI1NS8xMDApIHwgT3V0LU51bGwNCn0KCmZ1bmN0aW9uIEFQLUNvbnZlcnRQYXRoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kUGF0aCkNCg0KICAgIHJldHVybiAkUGF0aCAtcmVwbGFjZSANCiAgICAgICAgIjxEZXA+IiwiPExpYj5cRGVwZW5kZW5jaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxMaWI+IiwiPEhvbWU+XEFQLUxpYnJhcmllcyIgLXJlcGxhY2UgDQogICAgICAgICI8Q29tcChvbmVudHMpPz4iLCI8SG9tZT5cQVAtQ29tcG9uZW50cyIgLXJlcGxhY2UgDQogICAgICAgICI8SG9tZT4iLCRQU0hlbGx9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KCmZ1bmN0aW9uIFByaW50LUxpc3Qge3BhcmFtKCR4LCBbU3dpdGNoXSRJblJlY3Vyc2UpDQoNCiAgICBpZiAoJHguY291bnQgLWxlIDEpIHtyZXR1cm4gPzooJEluUmVjdXJzZSl7JHh9eyJbJHhdIn19IGVsc2Ugew0KICAgICAgICByZXR1cm4gIlskKCgkeCB8ICUge1ByaW50LUxpc3QgJF8gLUluUmVjdXJzZX0pIC1qb2luICcsICcpXSINCiAgICB9DQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oW2Jvb2xdJGRlY2lkZXIsIFtzY3JpcHRibG9ja10kaWZ0cnVlLCBbc2NyaXB0YmxvY2tdJGlmZmFsc2UpDQoNCiAgICBpZiAoJGRlY2lkZXIpIHsgJiRpZnRydWV9IGVsc2UgeyAmJGlmZmFsc2UgfQ0KfQoKZnVuY3Rpb24gSXMtQWZmaXJtYXRpdmUge3BhcmFtKCRUZXh0KQ0KJGVhaCA9ICJbZXVhXSpbcGhzXSoiO3JldHVybiAkVGV4dCAtbWF0Y2ggIl4oPyE9bm8rdCAqKSgoPyE9biR7ZWFofSlhKnkrJHtlYWh9fChwaHxmKVswb10rIHN1K3IrZXswLDN9fGFmZmlyfHBvc2l0aXZlfG9mZj8gY291cnNlKSJ9CgpmdW5jdGlvbiBBUC1SZXF1aXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWw9e30sIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgJExvYWRNb2R1bGUgPSB7DQogICAgICAgIHBhcmFtKCRGaWxlLFtib29sXSRJbXBvcnQpDQogICAgICAgIHRyeSB7SW1wb3J0LU1vZHVsZSAkRmlsZSAtZWEgc3RvcDtyZXR1cm4gMX0gY2F0Y2gge30NCiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIg0KICAgICAgICBbc3RyaW5nXSRmID0gaWYodGVzdC1wYXRoIC10IGxlYWYgJExGKXskTEZ9ZWxzZWlmKHRlc3QtcGF0aCAtdCBsZWFmICIkTEYuZGxsIil7IiRMRi5kbGwifQ0KICAgICAgICBpZiAoJGYgLWFuZCAkSW1wb3J0KSB7SW1wb3J0LU1vZHVsZSAkZn0NCiAgICAgICAgcmV0dXJuICRmDQogICAgfQ0KICAgICRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAgICAgICAgICAgICAgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSIgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSIgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gU2V0LVBhdGggew0KICAgIFtjbWRsZXRiaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5ID0gJHRydWUsIFZhbHVlRnJvbVBpcGVsaW5lID0gJHRydWUpXVtzdHJpbmdbXV0kUGF0aCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoDQogICAgfQ0KICAgIHByb2Nlc3Mgew0KICAgICAgICAkUGF0aCB8ICUgew0KICAgICAgICAgICAgJEZpbmFsUGF0aCArPSAkXw0KICAgICAgICB9DQogICAgfQ0KICAgIGVuZCB7DQogICAgICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgICRQdGggPSAkRmluYWxQYXRoIC1qb2luICRQYXRoU2VwDQogICAgICAgICRQdGggPSAoJFB0aCAtcmVwbGFjZSgiJFBhdGhTZXArIiwgJFBhdGhTZXApIC1yZXBsYWNlKCJcXCRQYXRoU2VwfFxcJCIsICRQYXRoU2VwKSkudHJpbSgkUGF0aFNlcCkNCiAgICAgICAgJFB0aCA9ICgoJFB0aCkuc3BsaXQoJFBhdGhTZXApIHwgc2VsZWN0IC11bmlxdWUpIC1qb2luICRQYXRoU2VwDQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBKUy1PUiB7Zm9yZWFjaCAoJGEgaW4gJGFyZ3MpIHtpZiAoISRhKSB7Y29udGludWV9O2lmICgkYS5HZXRUeXBlKCkuTmFtZSAtZXEgIlNjcmlwdEJsb2NrIikgeyRhID0gJGEuaW52b2tlKCk7aWYgKCEkYSl7Y29udGludWV9fTtyZXR1cm4gJGF9fQoKZnVuY3Rpb24gUmVtb3ZlLUZyb21QYXRoIHtwYXJhbShbU3RyaW5nXSRGb2xkZXIgPSAiIiwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgIGlmICghJEZvbGRlcikge3JldHVybn0NCiAgICAkUHRoID0gKEdldC1QYXRoIHwgPyB7JF8gLWluZSAkRm9sZGVyfSkgLWpvaW4oIjsiKQ0KICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHtbQ2hhcl0weDFifQoKZnVuY3Rpb24gSW1wb3J0LUJhdGNoRmlsZSB7cGFyYW0oJEZpbGUsIFtTd2l0Y2hdJFZlcmJvc2UsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgaWYgKCRGaWxlIC1ub3RtYXRjaCAiLihiYXR8Y21kKSQiKSB7JE91dCA9IEpTLU9SIChJbXBvcnQtQmF0Y2hGaWxlICIkRmlsZS5iYXQiIC1WZXJib3NlOiRWZXJib3NlIC1QYXNzVGhydSkge0ltcG9ydC1CYXRjaEZpbGUgIiRGaWxlLmNtZCIgLVZlcmJvc2U6JFZlcmJvc2UgLVBhc3NUaHJ1fTtpZiAoJFBhc3NUaHJ1KSB7UmV0dXJuICRPdXR9O3JldHVybiAhISRPdXR9DQogICAgJG9mID0gJEZpbGU7JFNDID0gIlNpbGVudGx5Q29udGludWUiDQogICAgJEZpbGUgPSBKUy1PUiAoUmVzb2x2ZS1QYXRoICRGaWxlIC1lYSAkU0MpIHtHZXQtV2hlcmUgJEZpbGV9DQogICAgaWYgKCEkRmlsZSkge1dyaXRlLUFQICJueCFbIiwibngjQVAtRW5naW5lIiwibngqOjoiLCJueCtJbXBvcnQtRG9zIiwibnghXSAiLCJuIUNvdWxkIG5vdCByZXNvbHZlIFskb2ZdIHRvIGEgdmFsaWQgc2NyaXB0IGZpbGUiO3JldHVybiAkZmFsc2V9DQogICAgcHVzaGQgKFNwbGl0LVBhdGggJEZpbGUpDQogICAgaWYgKCRWZXJib3NlKSB7V3JpdGUtQVAgIngqSW1wb3J0aW5nIEZpbGUgIiwibiEkRmlsZSJ9DQogICAgJFZhcnMgPSBAKCk7DQogICAgZm9yZWFjaCAoJGwgaW4gKGNtZCAvYyAiJChTcGxpdC1QYXRoIC1sZWFmICRGaWxlKT5udWwgMj5udWwmc2V0IiB8ID8geyRfIC1tYXRjaCAiPSJ9KSkgew0KICAgICAgICAkaywkdiA9ICRsLnNwbGl0KCI9IikNCiAgICAgICAgaWYgKCEkayAtb3IgKFtlbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoIiRrIikgLWVxICR2KSkge2NvbnRpbnVlfQ0KICAgICAgICAkVmFycyArPSAsIiRrIg0KICAgICAgICBzZXQtaXRlbSAtZm9yY2UgLXBhdGggIkVOVjpcJGsiIC12YWx1ZSAiJHYiDQogICAgICAgIGlmICgkVmVyYm9zZSkge1dyaXRlLUFQICJ4PitBZGRlZCAiLCJueCNFbnYiLCJueCs6IiwibiEkayJ9DQogICAgfQ0KICAgIHBvcGQNCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuIFtQU0N1c3RvbU9iamVjdF1Ae2ZpbGU9JEZpbGU7dmFycz0kVmFyc319DQogICAgcmV0dXJuICRUcnVlDQp9CgpmdW5jdGlvbiBGaXgtUGF0aCB7cGFyYW0oW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIiwgW1N3aXRjaF0kV2hhdElmKQ0KDQogICAgJFBhdGhWYXJzID0gTmV3LU9iamVjdCBTeXN0ZW0uQ29sbGVjdGlvbnMuR2VuZXJpYy5IYXNoU2V0W3N0cmluZ10NCiAgICAkRmluYWxQYXRoID0gR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIgfCA/IHsiJF8iLnRyaW0oKX0gfCAlIHsNCiAgICAgICAgJExvd2VyID0gIiRfIi5Ub0xvd2VyKCkNCiAgICAgICAgaWYgKCRQYXRoVmFycy5Db250YWlucygkTG93ZXIpIC1vciAhKFRlc3QtUGF0aCAkXykpIHsNCiAgICAgICAgICAgIGlmICgkV2hhdElmKSB7V3JpdGUtQVAgIngqV291bGQgUmVtb3ZlIFsiLCJueCEkXyIsIm4qXSBmcm9tIFBhdGgifQ0KICAgICAgICAgICAgcmV0dXJuDQogICAgICAgIH0NCiAgICAgICAgW1ZvaWRdJFBhdGhWYXJzLkFkZCgkTG93ZXIpDQogICAgICAgICRfDQogICAgfSB8ID8geyRffQ0KICAgIGlmICgkV2hhdElmKSB7cmV0dXJufQ0KICAgICRGaW5hbFBhdGggfCBTZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcg0KfQoKZnVuY3Rpb24gQWRkLVRvUGF0aCB7cGFyYW0oW1ZhbGlkYXRlUGF0dGVybigiLisiKV1bU3RyaW5nXSRGb2xkZXIgPSAkUFdELCBbQWxpYXMoInAiLCJwcmUiLCJiYWNrIildW3N3aXRjaF0kUHJlcGVuZCwgW1N3aXRjaF0kVHJ5LCBbU3dpdGNoXSRGb3JjZSwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgIHRyeSB7DQogICAgICAgIGlmICghJEZvcmNlKSB7dHJ5IHskRm9sZGVyID0gUmVzb2x2ZS1QYXRoICRGb2xkZXIgLUVycm9yQWN0aW9uIFN0b3B9IGNhdGNoIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBGb2xkZXIgWyRGb2xkZXJdIERvZXMgbm90IEV4aXN0In19DQogICAgICAgIGlmICghJEZvcmNlIC1hbmQgKFRlc3QtUGF0aCAkZm9sZGVyIC10eXBlIGxlYWYpKSB7VGhyb3cgIltBUC1QYXRoOkFkZF0gSW5wdXQgWyRGb2xkZXJdIG11c3QgYmUgYSBmb2xkZXIhIn0NCiAgICAgICAgaWYgKCRGb2xkZXIgLWluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHtyZXR1cm59DQogICAgICAgICRQdGggPSBjYXQgZW52OlwkUGF0aFZhcg0KICAgICAgICBpZiAoISRQcmVwZW5kKSB7JFB0aCArPSAiOyRGb2xkZXIifSBlbHNlIHskUHRoID0gIiRGb2xkZXI7JCgkUHRoKSJ9DQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfSBjYXRjaCB7DQogICAgICAgIGlmICgkVHJ5KSB7cmV0dXJufQ0KICAgICAgICBUaHJvdyAkXw0KICAgIH0NCn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEZsYXR0ZW4ge3BhcmFtKFtvYmplY3RbXV0keCkNCmlmICgkWC5jb3VudCAtZXEgMSkge3JldHVybiAkeCB8ICUgeyRffX0gZWxzZSB7JHggfCAlIHtGbGF0dGVuICRffX19CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnkKU2V0LUFsaWFzIEEyUGF0aCBBZGQtVG9QYXRoClNldC1BbGlhcyBSRlAgUmVtb3ZlLUZyb21QYXRoClNldC1BbGlhcyBpbnYgUHJvY2Vzcy1UcmFuc3BhcmVuY3kKU2V0LUFsaWFzIGVzYyBHZXQtRXNjYXBl")))
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
}
<#@AP-COMPILER: extra-deps(?:,Flatten)@#>
$Script:AliasDBRev = @{};@($AliasDB.Keys) | % {$Script:AliasDBRev.($AliasDB.$_) = $_}
$Components = @{
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
            $PyD = item ((,"C:\Git\bin*")+
                (Get-PSDrive | ? {$_.Provider.Name -eq "FileSystem"} | % Root | % {
                    Join-Path "$_" "AP-Langs\Git\bin"
                })) -ea SilentlyContinue | % FullName | Select -f 1
            if (!(test-path $Pyd)) {Throw "Git Does not Exist on System!";exit}
            A2Path $PyD
            rv PYD
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
            return $(if ((Get-Path cygwin) -and (AP-Require -PassThru "dep:cygpath")) {cygpath -w "/home/$env:USERNAME/.ssh"} else {"~/.ssh"})
        }
        function Global:SSH-Config {
            $edit = "notepad"
            if (AP-Require "function:e" -PassThru) {$edit = 'e'}
            & $edit (Join-Path (SSH-BaseFolder) "config")
        }
        function Global:SSH-KeyFile {
            return Join-Path (SSH-BaseFolder) "id_rsa.pub"
        }
        function Global:SSH-LinkUser($HostName, $User) {
            $Key = cat (SSH-KeyFile) -ea SilentlyContinue
            if (!$Key) {Write-AP "!Run ssh-keygen first (press enter on all things)";return}
            if ($User) {$HostName = "$User@$HostName"}
            ssh.exe $HostName "mkdir -p ~/.ssh && echo '$Key' >$(if(!$ReplaceKeys){'>'}) ~/.ssh/authorized_keys && chmod go-w ~"
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
    }
}
if ($Resolve) {
    $Resolve = JS-OR $Script:AliasDB.$Resolve $Resolve
    $Comps = List-Components $Components -Pass
    foreach ($Comp in $Comps.custom) {
        if ($Comp -ne $Resolve) {continue}
        AP-ConvertPath "<Comp>\$Comp.ps1"
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
