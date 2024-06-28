
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIEFQLUNvbnZlcnRQYXRoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kUGF0aCkNCg0KICAgICRQYXRoU2VwID0gW0lPLlBhdGhdOjpEaXJlY3RvcnlTZXBhcmF0b3JDaGFyDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPiR7UGF0aFNlcH1EZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT4ke1BhdGhTZXB9QVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPiR7UGF0aFNlcH1BUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gW2NvbnNvbGVdOjpCdWZmZXJXaWR0aA0KICAgICAgICAkQ2xlYW5UZXh0U2l6ZSA9IChTdHJpcC1Db2xvckNvZGVzICgiIiskVGV4dCkpLkxlbmd0aA0KICAgICAgICBpZiAoJENsZWFuVGV4dFNpemUgLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCRDbGVhblRleHRTaXplLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQogICAgICAgICAgICAgICAgIyAiIiskaisiIC0gIiskcA0KICAgICAgICAgICAgICAgICRBcHBlbmRlclskal0gKz0gJFRleHQuY2hhcnMoJHApDQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gKEFsaWduLVRleHQgJEFwcGVuZGVyICRBbGlnbikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGlmICgkQWxpZ24gLWVxICJDZW50ZXIiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRBbGlnbiAtZXEgIlJpZ2h0Iikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKigkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZS0xKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgkVGV4dCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHtwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkNCg0KICAgIGlmICgkZGVjaWRlcikgeyAmJGlmdHJ1ZX0gZWxzZSB7ICYkaWZmYWxzZSB9DQp9CgpmdW5jdGlvbiBXcml0ZS1BUCB7DQogICAgW0NtZGxldEJpbmRpbmcoKV0NCiAgICBwYXJhbShbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPSR0cnVlLCBNYW5kYXRvcnk9JFRydWUpXSRUZXh0LFtTd2l0Y2hdJE5vU2lnbixbU3dpdGNoXSRQbGFpblRleHQsW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nTGVmdCcsW1N3aXRjaF0kUGFzc1RocnUpDQogICAgYmVnaW4geyRUVCA9IEAoKX0NCiAgICBQcm9jZXNzIHskVFQgKz0gLCRUZXh0fQ0KICAgIEVORCB7DQogICAgICAgICRCbHVlID0gJChpZiAoJFdSSVRFX0FQX0xFR0FDWV9DT0xPUlMpezN9ZWxzZXsnQmx1ZSd9KQ0KICAgICAgICBpZiAoJFRULmNvdW50IC1lcSAxKSB7JFRUID0gJFRUWzBdfTskVGV4dCA9ICRUVA0KICAgICAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7DQogICAgICAgICAgICByZXR1cm4gJFRleHQgfCA/IHsiJF8ifSB8ICUgew0KICAgICAgICAgICAgICAgIFdyaXRlLUFQICRfIC1Ob1NpZ246JE5vU2lnbiAtUGxhaW5UZXh0OiRQbGFpblRleHQgLUFsaWduICRBbGlnbiAtUGFzc1RocnU6JFBhc3NUaHJ1DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgaWYgKCEkdGV4dCAtb3IgJHRleHQgLW5vdG1hdGNoICJeKCg/PE5OTD54KXwoPzxOUz5ucz8pKXswLDJ9KD88dD5cPiopKD88cz5bK1wtIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAgICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aA0KICAgICAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0kQmx1ZTsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknOydfJz0nd2hpdGUnfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgICAgIEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIHtmdW5jdGlvbiBHbG9iYWw6QWxpZ24tVGV4dCgkYWxpZ24sJHRleHQpIHskdGV4dH19DQogICAgICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAgICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICAgICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgICAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICREYXRhfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFNpemUtQWRqIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW0RvdWJsZV0kQnl0ZXMsIFtTd2l0Y2hdJEJ5VGhvdXNhbmQpDQoNCiAgICAkQlQgPSA/OigkQnlUaG91c2FuZCl7MTAwMH17MTAyNH0NCiAgICAkU2l6ZXMgPSBAKCIiLCJLIiwiTSIsIkciLCJUIiwiUCIsIkUiLCJaIiwiWSIpDQogICAgJERlZyA9IFtNYXRoXTo6Rmxvb3IoW01hdGhdOjpMb2coJGJ5dGVzLCRCVCkpDQogICAgJERlZyA9ID86KCREZWcgLWdlICRTaXplcy5jb3VudCl7JFNpemVzLmNvdW50LTF9eyREZWd9DQogICAgJFJldCA9ICJ7MH0iIC1mIFtNYXRoXTo6Um91bmQoJEJ5dGVzLyhbTWF0aF06OlBvdygkQlQsJERlZykpLDIpDQogICAgaWYgKCRyZXQgLWVxICJOYU4iKSB7cmV0dXJuICRyZXR9DQogICAgUmV0dXJuICIkcmV0ICQoJFNpemVzWyREZWddKUIiDQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsLCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAgICAgICAgICAgICAgIHtHZXQtV2hlcmUgJE1hdGNoZXNbMV19DQogICAgICAgICJeKGxpYnxtb2R1bGUpOiguKikiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCAtYW5kICRPbkZhaWwpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc1RocnUgLW9yICEkT25GYWlsKSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")
# ========================================END=OF=COMPILER===========================================================|
$Global:AP_Games = [PSCustomObject]@{
    Minecraft = @{
        Launchers = @{
            Vanilla = 'D:\Games\Minecraft-Games\Minecraft-Launcher\MinecraftLauncher.exe'
            Tekkit = '~\Desktop\TechnicLauncher.exe'
        }
        Single = @{
            RLCraft = 'D:\Games\Minecraft-Games\Tekkit\modpacks\shivaxi-rlcraft\saves\AP'
            TekkitMain = 'D:\Games\Minecraft-Games\Tekkit\modpacks\tekkitmain\saves\AP-New'
            Vanilla = 'D:\Games\Minecraft-Games\Tekkit\modpacks\vanilla\saves\AP'
        }
        Servers = @{
            RLCraft = 'D:\Games\Minecraft-Games\RLCraft-Server-1.12.2-v2.8.2\forge-1.12.2-14.23.5.2847-universal.jar'
            Vanilla = 'D:\Games\Minecraft-Games\Tekkit\modpacks\vanilla\server\forge-1.16.2-33.0.5.jar'
        }
    }
    SubnauticaMP = 'D:\Games\Subnautica-MultiPlayer'
    Subnautica = 'D:\AP-Progs\Steam\steamapps\common\SubnauticaZero'
}

function Link-SteamLoader($Path = "D:\AP-Progs\Steam\steamapps\common\") {
    $Apps = (ls "$Path" -Dir) -join ","

    iex "function global:steam([ValidateSet($Apps)]`$App) {
        start steam://something
    }"
    Write-AP "+Use steam <app> to launch portable apps!"
}
function global:__world-backup {
    param(
        [Parameter(Mandatory=$true, Position = 0)][string]$GameName,
        [string]$WorldPath = '.\world',
        [string]$BackupFolder = '.\ap.bkps',
        [string]$BackupName,
        [switch]$List,
        [switch]$SkipSizeCalc
    )
    if (!(Test-Path $WorldPath)) {return Write-AP "-Backup folder for $GameName does not exist [$WorldPath]"}
    if ($List) {
        ls -dir $BackupFolder | % {
            $s = ls -R $_.FullName | % Length | measure -Sum | % sum
            [Pscustomobject]@{Name=$_.name;Size=(Size-Adj $s)}
        }
        return
    }
    $Prefix = Split-Path -Leaf $WorldPath
    if (!$BackupName) {
        $BackupName = "$GameName-$Prefix-$((Get-Date).ToString("yy-MM-dd_HH"))"
    }
    $FinalBkp = Join-Path $BackupFolder $BackupName
    md -ea SilentlyContinue $FinalBkp | Out-Null
    Write-AP "x*Backing up $GameName - Save ","n!$Prefix"
    Write-AP "x>*Path: ","n#$(Resolve-Path $FinalBkp)"
    cp -R -Force "$WorldPath\*" $FinalBkp
    if ($SkipSizeCalc) {return Write-AP ">+Done!"}
    $ss = ls -R $FinalBkp -File | % Length | Measure -sum | % sum
    Write-AP ">+Done! (Size: $(Size-Adj $ss))"
}
function global:minecraft {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(Mandatory=$true, Position = 0)][ArgumentCompleter({param($a,$b,$WordToComplete)@($AP_Games.Minecraft.Single.Keys) | ? {$_ -match "^$WordToComplete"}})]$Name,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup
    )
    if ($cd) {return pushd $AP_Games.Minecraft.Single.$Name}
    if ($open) {return explorer $AP_Games.Minecraft.Single.$Name}
    if ($backup) {
        if ($Name -eq 'Vanilla') {return Write-AP "!Cannot backup vanilla world as AP does not know where those files are actually saved!"}
        return __world-backup -GameName $Name -WorldPath $AP_Games.Minecraft.Single.$Name -BackupFolder "$($AP_Games.Minecraft.Single.$Name)\..\..\ap.bkps"
    }
    # Launch Game otherwise
    if ($Name -eq 'Vanilla') {return & $AP_Games.Minecraft.Launchers.Vanilla}
    & $AP_Games.Minecraft.Launchers.Tekkit
}
function global:minecraft-server {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(Mandatory=$true, Position = 0)][ArgumentCompleter({param($a,$b,$WordToComplete)@($AP_Games.Minecraft.Servers.Keys) | ? {$_ -match "^$WordToComplete"}})]$Name,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup,
        [Parameter(ParameterSetName = 'launch')][switch]$NewShell,
        [Parameter(ParameterSetName = 'launch')][int]$Mem=4
    )
    $JarFile = $AP_Games.Minecraft.Servers.$Name
    $Folder = Split-Path $JarFile
    $JarFile = Split-Path -Leaf $JarFile
    if ($cd) {return pushd $Folder}
    if ($open) {return explorer $Folder}
    if ($backup) {
        return __world-backup -GameName $Name -WorldPath "$Folder\World" -BackupFolder "$Folder\ap.bkps"
    }
    # Launch Game otherwise
    if (!(AP-Require "dep:java" -PassThru)) {return Write-AP '-Java is required by the minecraft to run'}
    Write-AP "+Launching $Name Server - ${Mem}GB"
    Write-AP ">*Jar File: $JarFile"
    $MemSize = $Mem * 1024
    $Arg = "-Xmx${MemSize}M -Xms${MemSize}M -jar $JarFile nogui"
    pushd $Folder
    if ($NewShell) {start java.exe $Arg}
    else {iex "java.exe $Arg"}
    popd
}

function global:subnautica {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(ParameterSetName = 'install', Mandatory = $true, Position = 0)][string]$InstallMod,
        [Parameter(ParameterSetName = 'install', Position = 1)][switch]$DontDeleteInstaller,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup,
        [Parameter(ParameterSetName = 'listbkps')][switch]$ListBkps
    )
    if ($ListBkps) {
        return __world-backup -GameName 'Subnautica' -WorldPath "$($AP_Games.Subnautica)\SNAppData" -BackupFolder "$($AP_Games.Subnautica)\ap.bkps" -List
    }
    if ($Backup) {
        return __world-backup -GameName 'Subnautica' -WorldPath "$($AP_Games.Subnautica)\SNAppData" -BackupFolder "$($AP_Games.Subnautica)\ap.bkps"
    }
    if ($Open) {return explorer $AP_Games.Subnautica}
    pushd $AP_Games.Subnautica
    if ($Cd) {return}
    if ($InstallMod) {
        if ($InstallMod -notmatch "\.zip$") {Write-AP "!This Path is not a zip file [$InstallMod]";return popd}
        if (!(Test-Path $InstallMod)) {Write-AP "!This zip file doesn't exist [$InstallMod]";return popd}
        if (!(AP-Require -PassThru "dep:7z")) {Write-AP "!7-Zip not found in path, cannot continue with installation";return popd}
        if (!(Test-Path '.\QMods')) {Write-AP "!Your subnautica instance is not yet ready for modding. Go to: https://www.reddit.com/r/subnautica/comments/9b9847/a_quick_and_dirty_guide_to_mods/";return popd}
        $ModName = Split-Path -leaf $InstallMod
        Write-AP "*Installing from [$ModName]"
        7z x $InstallMod -oQMods/ 2>&1 | % {Write-AP ">#$_"}
        if (!$?) {Write-AP ">!Something went wrong, sorry";return popd}
        $ModSize = ls $InstallMod | % length
        Write-AP "+Successfully installed mod [$ModName] ($(Size-Adj $ModSize))"
        if (!$DontDeleteInstaller) {
            Write-AP ">*Cleaning Installer"
            rm $InstallMod
        }
    } else {
        $Exe = Split-Path -Leaf $AP_Games.Subnautica
        Write-AP "+Launching $Exe"
        & ".\$Exe.exe"
    }
    popd
}
function global:subnautica-multiplayer([switch]$Folder, [switch]$Backup) {
    if ($Backup) {
        #TODO(AP): Implement the __world-backup function here instead and make single entrypoint for Subnautica
        pushd $AP_Games.SubnauticaMP
        if ($Sizes) {.\ap.scripts\sizes.ps1}
        else {.\backup.bat}
        popd
        return
    }
    if ($Folder) {return explorer $AP_Games.SubnauticaMP}
    pushd $AP_Games.Subnautica
    .\NitroxLauncher.exe
    popd
}
sal -sc Global subnautica-mp subnautica-multiplayer
Write-AP "+Configured Game-Linking [Tekkit, Minecraft, Subnautica] for AP-Console"
