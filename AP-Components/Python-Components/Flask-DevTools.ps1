<#
|===============================================================>|
   Flask DevTools for PShell by Apoorv Verma [AP] on 2/12/2014
|===============================================================>|
      $) Makes Custom Functions to Automate Flask Dev Activities
      $) All Instances Parameters for all Functions
      $) Tree Killing Supported for swift run/close
      $) Fast Tools like editing code, to launching server
|===============================================================>|
#>
param([ValidatePattern("..*")][Alias("Index")][Parameter(Mandatory=$true)][String]$IndexFile,[Switch]$Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bQXJndW1lbnRDb21wbGV0ZXIoew0KICAgIFtPdXRwdXRUeXBlKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW3N0cmluZ10gJENvbW1hbmROYW1lLA0KICAgICAgICBbc3RyaW5nXSAkUGFyYW1ldGVyTmFtZSwNCiAgICAgICAgW3N0cmluZ10gJFdvcmRUb0NvbXBsZXRlLA0KICAgICAgICBbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5MYW5ndWFnZS5Db21tYW5kQXN0XSAkQ29tbWFuZEFzdCwNCiAgICAgICAgW1N5c3RlbS5Db2xsZWN0aW9ucy5JRGljdGlvbmFyeV0gJEZha2VCb3VuZFBhcmFtZXRlcnMNCiAgICApDQogICAgJENvbXBsZXRpb25SZXN1bHRzID0gW1N5c3RlbS5Db2xsZWN0aW9ucy5HZW5lcmljLkxpc3RbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XV06Om5ldygpDQogICAgJExpYiA9IEAoIkludGVybmV0Iiwib3M6d2luZG93cyIsIm9zOmxpbnV4Iiwib3M6dW5peCIsImFkbWluaXN0cmF0b3IiLCJyb290IiwibGliOiIsImxpYl90ZXN0OiIsImZ1bmN0aW9uOiIsInN0cmljdF9mdW5jdGlvbjoiLCJhYmlsaXR5OmVzY2FwZV9jb2RlcyIsImFiaWxpdHk6ZW1vamlzIikNCiAgICBKUy1PUiB7JExpYiB8ID8geyRfIC1saWtlICIkV29yZFRvQ29tcGxldGUqIn19IHskTGliIHwgPyB7JF8gLWxpa2UgIiokV29yZFRvQ29tcGxldGUqIn19IHwgJSB7DQogICAgICAgICRDb21wbGV0aW9uUmVzdWx0cy5BZGQoW1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uQ29tcGxldGlvblJlc3VsdF06Om5ldygkXywgJF8sICdQYXJhbWV0ZXJWYWx1ZScsICRfKSkNCiAgICB9DQogICAgcmV0dXJuICRDb21wbGV0aW9uUmVzdWx0cw0KfSldW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJEludm9rZU9yUmV0dXJuID0gew0KICAgICAgICBwYXJhbSgkQ21kKQ0KICAgICAgICBpZiAoJENtZCAtaXMgW1NjcmlwdEJsb2NrXSkgeyYgJENtZH0gZWxzZSB7JENtZH0NCiAgICB9DQogICAgaWYgKCEkT25GYWlsKSB7JFBhc3NUaHJ1ID0gJHRydWV9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQkIiAgICAgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXm9zOih3aW4oZG93cyk/fGxpbnV4fHVuaXgpJCIgeyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IjtpZiAoJE1hdGNoZXNbMV0gLW1hdGNoICJed2luIikgeyEkSXNVbml4fSBlbHNlIHskSXNVbml4fX0NCiAgICAgICAgIl5hZG1pbihpc3RyYXRvcik/JHxecm9vdCQiICAgIHtUZXN0LUFkbWluaXN0cmF0b3J9DQogICAgICAgICJeZGVwOiguKikkIiAgICAgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopJCIgICAgICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikkIiAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSQiICAgICAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopJCIgICAgICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgIl5hYmlsaXR5Oihlc2NhcGVfY29kZXN8ZW1vamlzKSQiICAgICB7JiAkSW52b2tlT3JSZXR1cm4gKEB7DQogICAgICAgICAgICBlc2NhcGVfY29kZXMgPSAkSG9zdC5VSS5TdXBwb3J0c1ZpcnR1YWxUZXJtaW5hbA0KICAgICAgICAgICAgZW1vamlzID0gJGVudjpXVF9TRVNTSU9OIC1vciAkZW52OldUX1BST0ZJTEVfSUQNCiAgICAgICAgfVskTWF0Y2hlc1sxXV0pfQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyYgJE9uRmFpbH0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIFRlc3QtQWRtaW5pc3RyYXRvciB7DQogICAgaWYgKCRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiKSB7DQogICAgICAgIGlmICgkKHdob2FtaSkgLWVxICJyb290Iikgew0KICAgICAgICAgICAgcmV0dXJuICR0cnVlDQogICAgICAgIH0NCiAgICAgICAgZWxzZSB7DQogICAgICAgICAgICByZXR1cm4gJGZhbHNlDQogICAgICAgIH0NCiAgICB9DQogICAgIyBXaW5kb3dzDQogICAgKE5ldy1PYmplY3QgU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NQcmluY2lwYWwgKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKSkuSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRpblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgew0KICAgIFtDbWRsZXRCaW5kaW5nKERlZmF1bHRQYXJhbWV0ZXJTZXROYW1lPSJOb3JtYWwiKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsDQogICAgICAgIFtTd2l0Y2hdJEFsbCwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdOb3JtYWwnKV1bUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSRNYW51YWxTY2FuLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCINCiAgICApDQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnVmVyYm9zZScpIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ0RlYnVnJykNCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgaWYgKCRGaWxlIC1lcSAid2hlcmUiIC1vciAkRmlsZSAtZXEgIndoZXJlLmV4ZSIpIHtyZXR1cm4gJFdoZXJlQmluRXhpc3RzfQ0KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsNCiAgICAgICAgJE91dD0kbnVsbA0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJE91dCA9IHdoaWNoICRmaWxlIDI+JG51bGwNCiAgICAgICAgfSBlbHNlIHskT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGx9DQogICAgICAgIA0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+W1wrXC1cIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAgICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aA0KICAgICAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0kQmx1ZTsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknOydfJz0nd2hpdGUnfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAgICAgaWYgKEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIC1wYSkgew0KICAgICAgICAgICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICAgICAgfQ0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gU2V0LVBhdGggew0KICAgIFtjbWRsZXRiaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5ID0gJHRydWUsIFZhbHVlRnJvbVBpcGVsaW5lID0gJHRydWUpXVtzdHJpbmdbXV0kUGF0aCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoDQogICAgfQ0KICAgIHByb2Nlc3Mgew0KICAgICAgICAkUGF0aCB8ICUgew0KICAgICAgICAgICAgJEZpbmFsUGF0aCArPSAkXw0KICAgICAgICB9DQogICAgfQ0KICAgIGVuZCB7DQogICAgICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgICRQdGggPSAkRmluYWxQYXRoIC1qb2luICRQYXRoU2VwDQogICAgICAgICRQdGggPSAoJFB0aCAtcmVwbGFjZSgiJFBhdGhTZXArIiwgJFBhdGhTZXApIC1yZXBsYWNlKCJcXCRQYXRoU2VwfFxcJCIsICRQYXRoU2VwKSkudHJpbSgkUGF0aFNlcCkNCiAgICAgICAgJFB0aCA9ICgoJFB0aCkuc3BsaXQoJFBhdGhTZXApIHwgc2VsZWN0IC11bmlxdWUpIC1qb2luICRQYXRoU2VwDQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfQ0KfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gSlMtT1Ige2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7aWYgKCEkYSkge2NvbnRpbnVlfTtpZiAoJGEuR2V0VHlwZSgpLk5hbWUgLWVxICJTY3JpcHRCbG9jayIpIHskYSA9ICRhLmludm9rZSgpO2lmICghJGEpe2NvbnRpbnVlfX07cmV0dXJuICRhfX0KCmZ1bmN0aW9uIEdldC1Fc2NhcGUgew0KICAgIGlmICghKEFQLVJlcXVpcmUgImFiaWxpdHk6ZXNjYXBlX2NvZGVzIikpIHt0aHJvdyAiW0dldC1SQkddIFlvdXIgY29uc29sZSBkb2VzIG5vdCBzdXBwb3J0IEFOU0kgZXNjYXBlIGNvZGVzIn0NCiAgICByZXR1cm4gW0NoYXJdMHgxYiAjIGBlDQp9Cg==")
# ========================================END=OF=COMPILER===========================================================|

if (!(Test-Path $IndexFile -Type Leaf)) {throw "Index File [$IndexFile] does not exist!";exit}
$IndexFile = Resolve-Path $IndexFile
$IndexFold = Split-Path -Leaf $IndexFile\..
pushd (Split-Path $IndexFile)
try {$VFld = "$(Resolve-Path (Get-ChildItem -Directory | ? {"$((Get-ChildItem -Directory $_).name)" -match "Include.*Lib.*Scripts"})[0])"} catch {throw "Could not find flask V-Env, Run Flask-Config.ps1";exit}
$CMDs = @{"Flask-List"="
    param([Switch]`$All)
    if (`$All) {
        `$Matchs = '] Flask-Website by AP'
    } else {
        `$Matchs = [Regex]::Escape('[$IndexFold->$(Split-Path -leaf $IndexFile)]')
    }
    Get-Process powershell | ? {`$_.mainWindowTitle -match `$Matchs} | select id,mainWindowTitle
"}
$CMDs += @{"Flask-New"="
    param([Parameter(Mandatory=`$True)][ValidateSet('Template')][String]`$ObjectType,[Parameter(Mandatory=`$True)][Alias('Name')][String]`$ObjectName,[String]`$Folder)
    Flask-Pwd
    `$Fold = @{'Template'='Templates'}.`$ObjectType
    if (`$Folder) {`$Fold = `$Folder}
    if (!`$Fold) {Write-AP '!There is no resolution for `$ObjType -> Folder. Wierd!';return}
    `$ObjectName = `$ObjectName.trim()
    if (`$ObjectName -Match ""[`$([Regex]::Escape([System.IO.Path]::InvalidPathChars -join ''))]"") {Write-AP '!Invalid File name!';return}
    if (!(Test-Path -type container `$Fold)) {Write-AP ""!Can't find the [`$Fold] folder"";return}
    if (Test-Path -type leaf ""`$Fold\`$ObjectName"") {Write-AP ""!`$ObjectType [`$ObjectName] already exists"";return}
    if (`$ObjectName -notMatch ""\.(\w){2,4}$"") {`$ObjectName = ""`$ObjectName.html""}
    Touch ""`$Fold\`$ObjectName""
    notepad ""`$Fold\`$ObjectName""
    popd
"}
$CMDs += @{"Flask-Pwd"="pushd ""$Pwd"""}
$CMDs += @{"Flask-Fix"="
    Flask-Pwd
    Flask-Activate
    `$Rand = Get-Random
    :A While (`$True) {
        `$Killer = start -windowstyle hidden powershell 'sleep -s 2;Stop-Process -name python' -passthru
        python '$IndexFile' 2>""`$Rand-Fix.data""
        try {`$Killer.Kill()} catch {}
        `$a = [IO.File]::ReadAllLines(""`$PWD\`$Rand-Fix.data"")
        del ""`$PWD\`$Rand-Fix.data""
        `$a = ""`$a""
        while (`$a -match ""ImportError: No module named (?<Module>\w+)"") {
            Write-AP ""!Found Missing Module [`$(`$Matches['Module'])]""
            Flask-AddPackage `$Matches['Module'] -ShowFinal -Silent
            continue A
        }
        break
    }
    Deactivate
    popd
"}
$CMDs += @{"Flask-Edit"="
    param([Switch]`$Idle)
    if (`$IDLE -and (`$Function:Idle)) {
        Idle '$IndexFile'
    } else {
        Notepad '$IndexFile'
    }
"}
$CMDs += @{"Flask-AddPackage"="
    param([Parameter(Mandatory=`$true)][String]`$Package='',[Switch]`$Silent,[Switch]`$ShowFinal,[int]`$Tab=0)
    `$tb = ('>'*`$Tab)
    if (!`$Package.trim()) {throw 'Invalid Package'}
    if (!`$Function:Deactivate) {if (!`$Silent) {Write-AP ""`$tb*Loading Virtual-Env""};`$Script:RemoveDevAddPKG = `$True;Flask-Activate}
    `$name = `$_ -replace ""\=.*""
    if (!`$Silent) {Write-AP ""`$tb*Getting Package [`$Package]""}
    `$a = & ""$VFld\Scripts\pip"" install `$Package
    `$b = `$a -match ""^Successfully installed (?<Modules>.*)""
    if (`$b) {
        `$b | % {if (!`$Silent -or `$ShowFinal) {write-AP ""`$tb>+`$_""}}
    } elseif (`$a -match 'Requirement already satisfied') {
        if (!`$Silent -or `$ShowFinal) {Write-AP ""`$tb>!Package [`$Package] Already Installed""}
    } else {
        if (!`$Silent -or `$ShowFinal) {Write-AP ""`$tb>-Failed to Install [`$Package]""}
    }
    if (`$RemoveDevAddPKG) {try{deactivate}catch{};rv RemoveDevAddPKG -scope script}
"}
$CMDs += @{"Flask-Check"="
param([Switch]`$All)
return [bool](Flask-List -All:`$All)
"}
$CMDs += @{"Flask-RemoveTools"="ls Function:\Flask-* | del"}
$CMDs += @{"Flask-Activate"="
    if (!`$Function:Deactivate) {& '$VFLD\Scripts\activate.ps1'}
"}
$CMDs += @{"Flask-Close"="
param([Switch]`$All)
if (!(Flask-Check -All:`$All)) {return}
(Flask-List -All:`$All).ID | % {
    `$Child = Find-ChildProcess `$_
    Write-host -f 2 [+] Killing ``#`$_
    Stop-Process `$_
    `$Child.id | % {
        Stop-Process `$_
        Write-host -f 2 '    [+]'Killing Child Process ``#`$_
    }
}"}
$Cmds.Keys | % {
    iex "function Global:$_ { $($CMDS.$_) }"
}
$CMD = @{"Flask-Host"="
function Flask-Check {
    ${Function:Flask-Check}
}
function Find-ChildProcess {
    ${Function:Find-ChildProcess}
}
function Flask-List {
    ${Function:Flask-List}
}
function Flask-Close {
    ${Function:Flask-Close}
}
Flask-Close
& '$VFLD\Scripts\activate.ps1'
[Console]::Title = '[$IndexFold->$(Split-Path -leaf $IndexFile)] Flask-Website by AP'
[Console]::SetWindowSize(75,5);[Console]::SetBufferSize(75,100);cmd /c color 4f
pushd (Split-Path '$IndexFile')
while (`$True) {python '$indexFile'};pause;popd"}
$CMD += @{"Flask-Update"=$CMD."Flask-Host"}
$Cmd.Keys | % {
    $a = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($CMD.$_))
    iex "function Global:$_ { start 'powershell' '-EncodedCommand $a' }"
}
if (!$Silent) {
    Write-AP "*Following Commands will let you command your Website!"
    Write-AP ">*Flask-Host        : Runs the Website"
    Write-AP ">*Flask-Edit        : Opens Notepad to edit index file for website"
    Write-AP ">*Flask-Update      : Updates the Website with new changes"
    Write-AP ">*Flask-Check       : Checks for any instance of currently running website"
    Write-AP ">*Flask-Activate    : Activates virtual environment for flask website"
    Write-AP ">*Flask-List        : Lists any instances of currently running website"
    Write-AP ">*Flask-New         : Helps create a new Flask related file/object"
    Write-AP ">*Flask-Pwd         : Pushd's into Flask Root Folder"
    Write-AP ">*Flask-Close       : Closes any instances of the website"
    Write-AP ">*Flask-Fix         : Fixes your current instance [adds modules automatically]"
    Write-AP ">*Flask-AddPackage  : Adds a package to website specific python instance"
    Write-AP ">*Flask-RemoveTools : Removes all flask modules"
    Write-AP "*Param [-all shows all AP-Flask Inst]"
}
rv cmd,cmds,index*
popd

