param([Hashtable]$Config)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.3] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPlxEZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT5cQVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPlxBUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAX10pKD88dz4uKikiKSB7cmV0dXJuICRUZXh0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gUGxhY2UtQWxpZ25lZC1UZXh0IHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJywgW0FsaWFzKCJmIildW1N5c3RlbS5Db25zb2xlQ29sb3JdJEZvcmVDb2w9W0NvbnNvbGVdOjpGb3JlR3JvdW5kQ29sb3IsIFtBbGlhcygiYiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRCYWNrQ29sPVtDb25zb2xlXTo6QmFja0dyb3VuZENvbG9yLCBbaW50XSRPZmZzZXQ9MCwgW0FsaWFzKCJOTkwiKV1bU3dpdGNoXSROb05ld0xpbmUpDQoNCiAgICAkU3BhY2VzPSAiICIqKCRUZXh0Lmxlbmd0aC0kdGV4dC50cmltU3RhcnQoKS5sZW5ndGgpDQogICAgJFRleHQgID0gQWxpZ24tVGV4dCAkVGV4dCAkQWxpZ24NCiAgICAkRmluYWwgPSAkU3BhY2VzKyRUZXh0LnRyaW1TdGFydCgpDQogICAgJENvdW50ID0gJFRleHQuTGVuZ3RoLSRUZXh0LlRyaW1TdGFydCgpLkxlbmd0aC0kU3BhY2VzLmxlbmd0aCskT2Zmc2V0DQogICAgW0NvbnNvbGVdOjpDdXJzb3JMZWZ0ID0gJENvdW50DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiROb05ld0xpbmUgLWYgJEZvcmVDb2wgLWIgJEJhY2tDb2wgJEZpbmFsDQp9CgpmdW5jdGlvbiBDbGVhci1MaW5lIHsNCiAgICAkTm0gPSBbQ29uc29sZV06OldpbmRvd1dpZHRoDQogICAgJHQgPSBbQ29uc29sZV06OkN1cnNvclRvcDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZSAoIiAiKiROTSkNCiAgICBbQ29uc29sZV06OkN1cnNvclRvcD0kdDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAgICAgICAgICAgICAgIHtHZXQtV2hlcmUgJE1hdGNoZXNbMV19DQogICAgICAgICJeKGxpYnxtb2R1bGUpOiguKikiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykge2lmICghJGEpIHtjb250aW51ZX07aWYgKCRhLkdldFR5cGUoKS5OYW1lIC1lcSAiU2NyaXB0QmxvY2siKSB7JGEgPSAkYS5pbnZva2UoKTtpZiAoISRhKXtjb250aW51ZX19O3JldHVybiAkYX19CgpmdW5jdGlvbiBBbGlnbi1UZXh0IHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRUZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdDZW50ZXInKQ0KDQogICAgaWYgKCRUZXh0LmNvdW50IC1ndCAxKSB7DQogICAgICAgICRhbnMgPSBAKCkNCiAgICAgICAgZm9yZWFjaCAoJGxuIGluICRUZXh0KSB7JEFucyArPSBBbGlnbi1UZXh0ICRsbiAkQWxpZ259DQogICAgICAgIHJldHVybiAoJGFucykNCiAgICB9IGVsc2Ugew0KICAgICAgICAkV2luU2l6ZSA9IFtjb25zb2xlXTo6QnVmZmVyV2lkdGgNCiAgICAgICAgaWYgKCgiIiskVGV4dCkuTGVuZ3RoIC1nZSAkV2luU2l6ZSkgew0KICAgICAgICAgICAgJEFwcGVuZGVyID0gQCgiIik7DQogICAgICAgICAgICAkaiA9IDANCiAgICAgICAgICAgIGZvcmVhY2ggKCRwIGluIDAuLigoIiIrJFRleHQpLkxlbmd0aC0xKSl7DQogICAgICAgICAgICAgICAgaWYgKCgkcCsxKSUkd2luc2l6ZSAtZXEgMCkgeyRqKys7JEFwcGVuZGVyICs9ICIifQ0KICAgICAgICAgICAgICAgICMgIiIrJGorIiAtICIrJHANCiAgICAgICAgICAgICAgICAkQXBwZW5kZXJbJGpdICs9ICRUZXh0LmNoYXJzKCRwKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgcmV0dXJuIChBbGlnbi1UZXh0ICRBcHBlbmRlciAkQWxpZ24pDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBpZiAoJEFsaWduIC1lcSAiQ2VudGVyIikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKlttYXRoXTo6dHJ1bmNhdGUoKCRXaW5TaXplLSgiIiskVGV4dCkuTGVuZ3RoKS8yKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZWlmICgkQWxpZ24gLWVxICJSaWdodCIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIiooJFdpblNpemUtKCIiKyRUZXh0KS5MZW5ndGgtMSkrJFRleHQpDQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIHJldHVybiAoJFRleHQpDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0K")))
# ========================================END=OF=COMPILER===========================================================|

<#
  MAJOR TODO: Create Bootstrapper using: http://stackoverflow.com/questions/18685772/how-to-set-powershell-background-color-programmatically-to-rgb-value
#>

function Enum-Obj ($a) {
    if ($a.GetEnumerator) {return $a.GetEnumerator()}
    $a | gm -MemberType NoteProperty | % name | % {[PSCustomObject]@{Key=$_;Value=$a.$_}}
}
function Join-Hashtables {
    $MergeOb = {
        param($a,$b,[bool]$Overwrite)
        Enum-Obj $b | % {
            $k,$v = $_.key,$_.value;$atp,$btp = $a.$k.GetType().Name, $v.GetType().Name
            if ($atp -eq $btp -and $btp -in "PSCustomObject","Hashtable") {$MergeOb.invoke($a.$k, $b.$k)}
            else {if (!@([PsCustomObject]$a | gm $k).count) {Write-AP ">!Merging a[$k] into b";$a[$k] = $v}}
            Write-AP "+$atp -> $btp"
        }
    }
    $seed = $args[0];$a = $args[1..$args.length]
    if ($args.length -eq 1) {return $seed}
    $a[-1] | % {
        $MergeOb.invoke($seed,$_,1)
    }
    if ($args.length -eq 2) {return $seed}
    $a[$a.count-2..0] | % {
        $MergeOb.invoke($seed,$_)
    }
}

$Global:AP_PROMPT_SETTINGS = Make-ReadOnly @{
    plugins=@{}
    path = [PSCustomObject]@{
        arrowPath=0
        compressHome=1
        compressors=@{}}
    rightData = [PSCustomObject]@{
        show=1
        errorCode=1
        sameLine=0}
    depth = [PSCustomObject]@{
        show=1
        noDings=0}
    git = [PSCustomObject]@{
        show=1}
    hooks=[PSCustomObject]@{
        pre=@{}
        end=@{}
    };charMap=$null;state=Make-ReadOnly @{lastPrintLocation = [Console]::CursorTop-1; lastWasError = 0; Plugins = @{}}}

try {
    # MAJOR TODO: Fix this
    Join-Hashtables $AP_PROMPT_SETTINGS $Config
} catch {
    Write-Host $_
}

function Make-ReadOnly($o) {
    if (!$o.GetEnumerator) {Write-AP "!Invalid object passed, must have the '.GetEnumerator()' method";return}
    $new = [PsCustomObject]@{}
    $o.GetEnumerator() | % {$v = $_.value;$new | Add-Member $_.key -Force -MemberType ScriptProperty {$v}.GetNewClosure()}
    return $new
}
$Global:AP_PROMPT_SETTINGS | Add-Member -MemberType ScriptMethod -Name 'LoadTest' -Value {
    $p = $Global:AP_PROMPT_SETTINGS;$Times = @{pre=@{};post=@{}}
    function global:Write-Host() {}
    "pre","post" | % {
        $k=$_
        @($p.hooks.$k.keys) | % {$Times.$k.$_ = Measure-Command {try{$p.hooks.$k.$_.invoke($Global:AP_OutQ)}catch{}}}
        $Times.$k = [PSCustomObject]$Times.$K
    }
    $Times.total = Measure-Command {prompt}
    rm Function:\Write-Host
    return [PSCustomObject]$Times
}
$Global:AP_PROMPT_SETTINGS.hooks | gm -type NoteProperty | % name | % {
    $p = $Global:AP_PROMPT_SETTINGS;$k = $_;$Code = @{
        "attach"={
            param($Name, $Code)
            $type = $code.GetType().Name
            if ($type -ne "ScriptBlock") {Write-AP "!Invalid type [$type] provided, must be ScriptBlock";return}
            $p.hooks.$k.$Name = $Code
        }.GetNewClosure()
        "invokeAll"={
            @($p.hooks.$k.values) | % {try {$_.invoke($Global:AP_OutQ)} catch {}}
        }.GetNewClosure()
    };$Code.Add = $Code.attach
    @($Code.keys) | % {
        $p.hooks.$k | Add-Member -MemberType ScriptMethod -Name $_ -Value $Code.$_ -F
    }
}
$CMap = Make-Readonly @{
    home_path='~'
    last_bad=[char]1008
    dings=0x24FF,$(0x2776..0x277F),$(0x24EB..0x24F4) | % {$_} | % {[char]$_}
    arrows=Make-ReadOnly @{
        Full_Right=[char]57520
        Thin_Right=[char]57521
        Full_Left=[char]57522
        Thin_Left=[char]57523
        Full_Round_Right=[char]57524
        Full_Round_Left=[char]57526
        Thin_Round_Right=[char]57525
        Thin_Round_Left=[char]57527
        Code_Right=[char]57542
        Code_Left=[char]57543
    }
    git=Make-ReadOnly @{
        branch=[char]57504
        link=[char]57505
        access_denied=[char]57506
        dirty=[char]10038
        new=[char]1008
    }
    sanity=Make-ReadOnly @{
        correct=[char]8730
        incorrect=[char]215
    }
    useful=Make-ReadOnly @{
        lambda=[char]955
    }
}

$Global:AP_PROMPT_SETTINGS | Add-Member charMap -Force -MemberType ScriptProperty {$CMap}.GetNewClosure()
$Global:AP_PROMPT_SETTINGS.hooks | Add-Member -MemberType AliasProperty -Name post -value end
function Global:_Transition-Prompt($f,$b) {_Prompt-Queue-Out -fo $f -ba $b $AP_PROMPT_SETTINGS.charMap.arrows.full_round_right -trans;$b}
function Global:_Prompt-Queue-Out ($text,$ba,$fo,[switch]$trans) {
    if (!$Global:AP_OutQ) {Write-AP "!Cannot queue out since there is no OutQ to dump to.";return}
    $Global:AP_OutQ += ,[PSCustomObject]@{ba=$ba;fo=$fo;t=$text;tr=!!$trans}
}
function Global:_Prompt-Create-End($m) {
    $s.hooks.end.invokeAll()
    $count = 0;$prompt_sz = 1
    $Global:AP_OutQ | ? {$_.ba} | % {Write-Host -n -fo $_.fo -ba $_.ba $_.t;$count+=$_.t.length}
    if ($count -gt $m) {$prompt_sz++
        Write-Host -n -ba $BG.path "`n"
        Clear-Line;Write-Host "";[Console]::CursorTop-- # Fix for new console bug
        Write-Host -n -ba $BG.path ' '
        Write-Host -n -fo $BG.path -ba black $s.charMap.arrows.full_round_right
    }
    $v = [Console]::CursorTop
    $S.state | Add-Member lastPrintLocation -Force -MemberType ScriptProperty {$v}.GetNewClosure()
    if ($s.rightData.show) {
        $cc = [Console]::CursorLeft
        $LineAdj = $(if([Console]::CursorTop){-1}else{1})
        if (!$s.rightData.sameLine) {[Console]::CursorTop += $LineAdj}
        $dt = " $((Get-Date).ToShortTimeString()) "
        Place-Aligned-Text $s.charMap.arrows.full_round_left Right DarkGray Black ($dt.length*-1) -nnl
        Place-Aligned-Text $dt Right Black DarkGray -nnl
        [Console]::CursorLeft = $cc
        if (!$s.rightData.sameLine) {[Console]::CursorTop -= $LineAdj}
    }
    $s.state | Add-Member lastHadError -Force -MemberType ScriptProperty {$lastBad}.GetNewClosure()
    $s.state | Add-Member promptSize -Force -MemberType ScriptProperty {$prompt_sz}.GetNewClosure()
    rv -s global AP_OutQ
    return " "
}
function Global:prompt {
    $lastBad = !$?;$last = $$
    $s = $AP_PROMPT_SETTINGS;$Buffer_Limit = [console]::BufferWidth*.7
    $dings = $s.charMap.dings
    $s.state | Add-Member hasError -Force -MemberType ScriptProperty {$lastBad}.GetNewClosure()
    $path_depth = (pwd -Stack).count; $thereBeDepth = $s.depth.show -and $path_depth
    $Global:AP_OutQ = @(,1)
    $BG = @{path="DarkBlue"; git="DarkGreen"; git_dirty="Yellow"; venv="Cyan"; git_new="Gray"; depth = 'DarkMagenta'; error = "DarkYellow"}
    $s.hooks.pre.invokeAll()
    #=Error=Checks================================|
    $seedColor = $(if($thereBeDepth){$BG.depth}else{$BG.path})
    $bc = $seedColor
    if ($lastBad) {
        $fc = "Red";$bc = $BG.error
        _Prompt-Queue-Out -fo $fc -ba $bc " $($s.charMap.last_bad) "
        $bc = _Transition-Prompt $bc $seedColor
    }
    if ($Env:VIRTUAL_ENV) {
        $fc = "White";$bc = $BG.venv
        _Prompt-Queue-Out -fo $fc -ba $bc " $($s.charMap.git.link) VENV "
        $bc = _Transition-Prompt $bc $seedColor
    }
    #=Folder=Checks================================|
    $Path = "$pwd";$NNL = ""
    $s.path.compressors.GetEnumerator() | % {$Path = $Path -Replace ([Regex]::Escape($_.Key)), $_.Value}
    if ($s.path.compressHome) {$Path = $Path.replace($env:USERPROFILE,"~")}
    if ($thereBeDepth) {
        $symbol = [Math]::min($path_depth,$dings.length-1)
        if (!$s.depth.noDings) {$symbol = $Dings[$symbol]}
        _Prompt-Queue-Out -fo white -ba $BG.depth " $symbol$(if($path_depth -ge $dings.length){'+'}) "
        $bc = _Transition-Prompt $bc $BG.path
    }
    if ($s.path.arrowPath) {$Path = $Path.replace("\"," $($s.charMap.arrows.thin_right) ")}
    _Prompt-Queue-Out -fo black -ba $bc " $Path "
    #=GIT=Checks================================|
    if ($s.git.show) {$isGit = git rev-parse --git-dir 2>$null}
    if (!$isGit) {$null = _Transition-Prompt $bc "Black";return _Prompt-Create-End $Buffer_Limit}
    $ActiveBranch = "$(@(git branch | ? {$_[0] -eq '*'})[0])"[2..1000] -join ""
    $newRepo = !$ActiveBranch
    $branch = JS-OR $ActiveBranch "New Repo"
    if (!$newRepo) {$isDirty = git status --porcelain}
    $bc = _Transition-Prompt $bc $BG["git$(if($newRepo){'_new'}elseif($isDirty){'_dirty'})"]
    $gitIcon = $s.charMap.git.$(if($newRepo){'new'}elseif($isDirty){'dirty'}else{'branch'})
    _Prompt-Queue-Out -fo $(if($newRepo){'2'}else{'black'}) -ba $bc " $gitIcon"
    _Prompt-Queue-Out -fo $(if($newRepo){'DarkGray'}else{'black'}) -ba $bc " $branch "
    $bc = _Transition-Prompt $bc Black
    _Prompt-Create-End $Buffer_Limit
}
Write-AP "+Configured Oh-My-Prompt for AP-PSHell Management Console!"
