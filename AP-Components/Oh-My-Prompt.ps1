param([Hashtable]$Config)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gSlMtT1Ige2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7aWYgKCEkYSkge2NvbnRpbnVlfTtpZiAoJGEuR2V0VHlwZSgpLk5hbWUgLWVxICJTY3JpcHRCbG9jayIpIHskYSA9ICRhLmludm9rZSgpO2lmICghJGEpe2NvbnRpbnVlfX07cmV0dXJuICRhfX0KCmZ1bmN0aW9uIENsZWFyLUxpbmUgew0KICAgICRObSA9IFtDb25zb2xlXTo6V2luZG93V2lkdGgNCiAgICAkdCA9IFtDb25zb2xlXTo6Q3Vyc29yVG9wO1tDb25zb2xlXTo6Q3Vyc29yTGVmdD0wDQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lICgiICIqJE5NKQ0KICAgIFtDb25zb2xlXTo6Q3Vyc29yVG9wPSR0O1tDb25zb2xlXTo6Q3Vyc29yTGVmdD0wDQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBQbGFjZS1CdWZmZXJlZENvbnRlbnQge3BhcmFtKCRUZXh0LCAkeCwgJHksIFtDb25zb2xlQ29sb3JdJEZvcmVncm91bmRDb2xvcj1bQ29uc29sZV06OkZvcmVncm91bmRDb2xvciwgW0NvbnNvbGVDb2xvcl0kQmFja2dyb3VuZENvbG9yPVtDb25zb2xlXTo6QmFja2dyb3VuZENvbG9yKQ0KDQogICAgJGNyZCA9IFtNYW5hZ2VtZW50LkF1dG9tYXRpb24uSG9zdC5Db29yZGluYXRlc106Om5ldygkeCwkeSkNCiAgICAkYiA9ICRIb3N0LlVJLlJhd1VJDQogICAgJGFyciA9ICRiLk5ld0J1ZmZlckNlbGxBcnJheShAKCRUZXh0KSwgJEZvcmVncm91bmRDb2xvciwgJEJhY2tncm91bmRDb2xvcikNCiAgICAkeCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGgtMS0kVGV4dC5sZW5ndGgNCiAgICAkYi5TZXRCdWZmZXJDb250ZW50cygkY3JkLCAkYXJyKQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAX10pKD88dz4uKikiKSB7cmV0dXJuICRUZXh0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gUGxhY2UtQWxpZ25lZC1UZXh0IHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0nQ3Vyc29yJyldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlLCBQb3NpdGlvbiA9IDApXVtTdHJpbmddJFRleHQsDQogICAgICAgIFtQYXJhbWV0ZXIoUG9zaXRpb24gPSAxKV1bVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduID0gJ0NlbnRlcicsDQogICAgICAgIFtBbGlhcygiZiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRGb3JlQ29sID0gW0NvbnNvbGVdOjpGb3JlR3JvdW5kQ29sb3IsDQogICAgICAgIFtBbGlhcygiYiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRCYWNrQ29sID0gW0NvbnNvbGVdOjpCYWNrR3JvdW5kQ29sb3IsDQogICAgICAgIFtpbnRdJE9mZnNldCA9IDAsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZSA9ICdDdXJzb3InKV1bQWxpYXMoIk5OTCIpXVtTd2l0Y2hdJE5vTmV3TGluZSwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lID0gJ0J1ZmZlcmVkJyldJHlQb3MgPSAwDQogICAgKQ0KICAgICRTcGFjZXM9ICIgIiooJFRleHQubGVuZ3RoLSR0ZXh0LnRyaW1TdGFydCgpLmxlbmd0aCkNCiAgICAkVGV4dCAgPSBBbGlnbi1UZXh0ICRUZXh0ICRBbGlnbg0KICAgICRGaW5hbCA9ICRTcGFjZXMrJFRleHQudHJpbVN0YXJ0KCkNCiAgICAkQ291bnQgPSAkVGV4dC5MZW5ndGgtJFRleHQuVHJpbVN0YXJ0KCkuTGVuZ3RoLSRTcGFjZXMubGVuZ3RoKyRPZmZzZXQNCiAgICBpZiAoJFBzQ21kbGV0LlBhcmFtZXRlclNldE5hbWUgLWVxICdDdXJzb3InKSB7DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yTGVmdCA9ICRDb3VudA0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JE5vTmV3TGluZSAtZiAkRm9yZUNvbCAtYiAkQmFja0NvbCAkRmluYWwNCiAgICB9IGVsc2Ugew0KICAgICAgICBQbGFjZS1CdWZmZXJlZENvbnRlbnQgJEZpbmFsIC14ICRDb3VudCAteSAkeVBvcyAtRiAkRm9yZUNvbCAtQiAkQmFja0NvbA0KICAgIH0NCn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gU3RyaXAtQ29sb3JDb2RlcyB7cGFyYW0oJFN0cikNCg0KICAgICRTdHIgfCAlIHskXyAtcmVwbGFjZSAiJChbcmVnZXhdOjplc2NhcGUoIiQoR2V0LUVzY2FwZSlbIikpXGQrKFw7XGQrKSptIiwiIn0NCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gW2NvbnNvbGVdOjpCdWZmZXJXaWR0aA0KICAgICAgICAkQ2xlYW5UZXh0U2l6ZSA9IChTdHJpcC1Db2xvckNvZGVzICgiIiskVGV4dCkpLkxlbmd0aA0KICAgICAgICBpZiAoJENsZWFuVGV4dFNpemUgLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCRDbGVhblRleHRTaXplLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQogICAgICAgICAgICAgICAgIyAiIiskaisiIC0gIiskcA0KICAgICAgICAgICAgICAgICRBcHBlbmRlclskal0gKz0gJFRleHQuY2hhcnMoJHApDQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gKEFsaWduLVRleHQgJEFwcGVuZGVyICRBbGlnbikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGlmICgkQWxpZ24gLWVxICJDZW50ZXIiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRBbGlnbiAtZXEgIlJpZ2h0Iikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKigkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZS0xKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgkVGV4dCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQkIiAgICAgICAgICAgICAgIHt0ZXN0LWNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXR9DQogICAgICAgICJeb3M6KHdpbnxsaW51eHx1bml4KSQiICAgIHskSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCI7aWYgKCRNYXRjaGVzWzFdIC1lcSAid2luIikgeyEkSXNVbml4fSBlbHNlIHskSXNVbml4fX0NCiAgICAgICAgIl5hZG1pbiQiICAgICAgICAgICAgICAgICAge1Rlc3QtQWRtaW5pc3RyYXRvcn0NCiAgICAgICAgIl5kZXA6KC4qKSQiICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSQiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikkIiB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopJCIgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSQiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCAtYW5kICRPbkZhaWwpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc1RocnUgLW9yICEkT25GYWlsKSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gVGVzdC1BZG1pbmlzdHJhdG9yIHsNCiAgICBpZiAoJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIpIHsNCiAgICAgICAgaWYgKCQod2hvYW1pKSAtZXEgInJvb3QiKSB7DQogICAgICAgICAgICByZXR1cm4gJHRydWUNCiAgICAgICAgfQ0KICAgICAgICBlbHNlIHsNCiAgICAgICAgICAgIHJldHVybiAkZmFsc2UNCiAgICAgICAgfQ0KICAgIH0NCiAgICAjIFdpbmRvd3MNCiAgICAoTmV3LU9iamVjdCBTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c1ByaW5jaXBhbCAoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzSWRlbnRpdHldOjpHZXRDdXJyZW50KCkpKS5Jc0luUm9sZShbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NCdWlsdGluUm9sZV06OkFkbWluaXN0cmF0b3IpDQp9Cg==")
# ========================================END=OF=COMPILER===========================================================|

<#
  MAJOR TODO: Create Bootstrapper using: http://stackoverflow.com/questions/18685772/how-to-set-powershell  -background-color-programmatically-to-rgb-value
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
    settings = [PSCustomObject]@{
        # Can reference something from the charMap or be a char
        transitionRightIcon='full_round_right'
        # Can reference something from the charMap or be a char
        transitionLeftIcon='full_round_left'
    }
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
function global:_Prompt-Transition-Icon ([ValidateSet('right','left')]$dir) {
    $s = $Global:AP_PROMPT_SETTINGS.settings
    $cmap = $Global:AP_PROMPT_SETTINGS.charMap
    $icon = $s."transition$dir`Icon"
    $resolvedIcon = $CMap.arrows.$icon
    if (!$resolvedIcon) {
        if ($icon.length -ne 1) {
            Write-AP "n![AP_PROMPT_TRANSITION_ICON] Invalid icon [$icon] requested for transition";return
        }
        $resolvedIcon = JS-OR $icon $CMap.arrows.Full_Round_Right
    }
    return $resolvedIcon
}
function Global:_Transition-Prompt($f,$b) {
    _Prompt-Queue-Out -fo $f -ba $b (_Prompt-Transition-Icon right) -trans;$b
}
function Global:_Prompt-Queue-Out ($text,$ba,$fo,[switch]$trans) {
    if (!$Global:AP_OutQ) {Write-AP "n![AP_PROMPT_TRANSITION_ICON] Cannot queue out since there is no OutQ to dump to.";return}
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
        Write-Host -n -fo $BG.path (_Prompt-Transition-Icon right)
    }
    $v = [Console]::CursorTop
    $S.state | Add-Member lastPrintLocation -Force -MemberType ScriptProperty {$v}.GetNewClosure()
    if ($s.rightData.show) {
        $cc = [Console]::CursorLeft
        $LineAdj = $(if([Console]::CursorTop){-1}else{1})
        if (!$s.rightData.sameLine) {[Console]::CursorTop += $LineAdj}
        $dt = " $((Get-Date).ToShortTimeString()) "
        Place-Aligned-Text (_Prompt-Transition-Icon left) Right -f DarkGray -b Black -Offset ($dt.length*-1) -nnl
        Place-Aligned-Text $dt Right -f Black -b DarkGray -nnl
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
    if ($s.path.compressHome) {
        $OSDependentHome = JS-OR $env:USERPROFILE $env:HOME
        $Path = $Path.replace($OSDependentHome,"~")
    }
    if ($thereBeDepth) {
        $symbol = [Math]::min($path_depth,$dings.length-1)
        if (!$s.depth.noDings) {$symbol = $Dings[$symbol]}
        _Prompt-Queue-Out -fo white -ba $BG.depth " $symbol$(if($path_depth -ge $dings.length){'+'}) "
        $bc = _Transition-Prompt $bc $BG.path
    }
    if ($s.path.arrowPath) {$Path = $Path.replace("\"," $($s.charMap.arrows.thin_right) ")}
    _Prompt-Queue-Out -fo black -ba $bc " $Path "
    #=GIT=Checks================================|
    $HasGit = AP-Require "dep:git" -pa
    if ($s.git.show -and $HasGit) {$isGit = git rev-parse --git-dir 2>$null}
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
