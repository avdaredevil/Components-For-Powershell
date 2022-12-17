
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.3] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")

    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))
}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oW2Jvb2xdJGRlY2lkZXIsIFtzY3JpcHRibG9ja10kaWZ0cnVlLCBbc2NyaXB0YmxvY2tdJGlmZmFsc2UpDQoNCiAgICBpZiAoJGRlY2lkZXIpIHsgJiRpZnRydWV9IGVsc2UgeyAmJGlmZmFsc2UgfQ0KfQoKZnVuY3Rpb24gU3RyaXAtQ29sb3JDb2RlcyB7cGFyYW0oJFN0cikNCg0KICAgICRTdHIgfCAlIHskXyAtcmVwbGFjZSAiJChbcmVnZXhdOjplc2NhcGUoIiQoR2V0LUVzY2FwZSlbIikpXGQrKFw7XGQrKSptIiwiIn0NCn0KCmZ1bmN0aW9uIEdldC1Fc2NhcGUge1tDaGFyXTB4MWJ9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gW2NvbnNvbGVdOjpCdWZmZXJXaWR0aA0KICAgICAgICAkQ2xlYW5UZXh0U2l6ZSA9IChTdHJpcC1Db2xvckNvZGVzICgiIiskVGV4dCkpLkxlbmd0aA0KICAgICAgICBpZiAoJENsZWFuVGV4dFNpemUgLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCRDbGVhblRleHRTaXplLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQogICAgICAgICAgICAgICAgIyAiIiskaisiIC0gIiskcA0KICAgICAgICAgICAgICAgICRBcHBlbmRlclskal0gKz0gJFRleHQuY2hhcnMoJHApDQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gKEFsaWduLVRleHQgJEFwcGVuZGVyICRBbGlnbikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGlmICgkQWxpZ24gLWVxICJDZW50ZXIiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRBbGlnbiAtZXEgIlJpZ2h0Iikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKigkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZS0xKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgkVGV4dCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFNpemUtQWRqIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW0RvdWJsZV0kQnl0ZXMsIFtTd2l0Y2hdJEJ5VGhvdXNhbmQpDQoNCiAgICAkQlQgPSA/OigkQnlUaG91c2FuZCl7MTAwMH17MTAyNH0NCiAgICAkU2l6ZXMgPSBAKCIiLCJLIiwiTSIsIkciLCJUIiwiUCIsIkUiLCJaIiwiWSIpDQogICAgJERlZyA9IFtNYXRoXTo6Rmxvb3IoW01hdGhdOjpMb2coJGJ5dGVzLCRCVCkpDQogICAgJERlZyA9ID86KCREZWcgLWdlICRTaXplcy5jb3VudCl7JFNpemVzLmNvdW50LTF9eyREZWd9DQogICAgJFJldCA9ICJ7MH0iIC1mIFtNYXRoXTo6Um91bmQoJEJ5dGVzLyhbTWF0aF06OlBvdygkQlQsJERlZykpLDIpDQogICAgaWYgKCRyZXQgLWVxICJOYU4iKSB7cmV0dXJuICRyZXR9DQogICAgUmV0dXJuICIkcmV0ICQoJFNpemVzWyREZWddKUIiDQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBBUC1SZXF1aXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWwsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgJExvYWRNb2R1bGUgPSB7DQogICAgICAgIHBhcmFtKCRGaWxlLFtib29sXSRJbXBvcnQpDQogICAgICAgIHRyeSB7SW1wb3J0LU1vZHVsZSAkRmlsZSAtZWEgc3RvcDtyZXR1cm4gMX0gY2F0Y2gge30NCiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIg0KICAgICAgICBbc3RyaW5nXSRmID0gaWYodGVzdC1wYXRoIC10IGxlYWYgJExGKXskTEZ9ZWxzZWlmKHRlc3QtcGF0aCAtdCBsZWFmICIkTEYuZGxsIil7IiRMRi5kbGwifQ0KICAgICAgICBpZiAoJGYgLWFuZCAkSW1wb3J0KSB7SW1wb3J0LU1vZHVsZSAkZn0NCiAgICAgICAgcmV0dXJuICRmDQogICAgfQ0KICAgICRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAgICAgICAgICAgICAgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeZGVwOiguKikiICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSIgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSIgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSIgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9DQp9CgpmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpDQoNCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+XERlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPlxBUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+XEFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")
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
