<#
|===============================================================>|
   Flask Config by APoorv Verma [AP] on 2/12/2014
|===============================================================>|
      $) Configures Flask in a Designated Folder
      $) Makes Common Web-Dev Folders
      $) Makes a template Website.py file for Automatic Launch
      $) Checks For Dependencies
      $) Verfication for 0 Parameter Run
      $) Sets The virtual Environment with Common Packages
      $) Configures Flask Environment in Basic, Interm, and Adv.
      $) Runs Flask Dev Tools for Powershell by Apoorv Verma [AP]
|===============================================================>|
#>
param(
    [ValidatePattern("..*")][String]$Folder = "|******|",
    [ValidatePattern("..*")][Alias("Index")][String]$IndexFile="Website.py",
    [Switch]$Silent,
    [Switch]$Force,
    [ValidateSet("Basic","Intermediate","Advanced")][String]$Form = "Basic"
)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gU3RyaXAtQ29sb3JDb2RlcyB7cGFyYW0oJFN0cikNCg0KICAgICRTdHIgfCAlIHskXyAtcmVwbGFjZSAiJChbcmVnZXhdOjplc2NhcGUoIiQoR2V0LUVzY2FwZSlbIikpXGQrKFw7XGQrKSptIiwiIn0NCn0KCmZ1bmN0aW9uIEtleVByZXNzZWQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJEtleSwgJFN0b3JlPSJeXl4iKQ0KDQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIgLWFuZCAkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9IGVsc2Uge2lmICgkU3RvcmUgLWVxICJeXl4iKSB7cmV0dXJuICRGYWxzZX19DQogICAgJEFucyA9ICRGYWxzZQ0KICAgICRLZXkgfCAlIHsNCiAgICAgICAgJFNPVVJDRSA9ICRfDQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkQW5zID0gJEFucyAtb3IgKEtleVByZXNzZWRDb2RlICRTT1VSQ0UgJFN0b3JlKQ0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgIEZvcmVhY2ggKCRLIGluICRTT1VSQ0UpIHsNCiAgICAgICAgICAgICAgICBbU3RyaW5nXSRLID0gJEsNCiAgICAgICAgICAgICAgICBpZiAoJEsubGVuZ3RoIC1ndCA0IC1hbmQgKCRLWzAsMSwtMSwtMl0gLWpvaW4oIiIpKSAtZXEgIn5+fn4iKSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoS2V5UHJlc3NlZENvZGUgKEtleVRyYW5zbGF0ZSgkSykpICRTdG9yZSkNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKCRLLmNoYXJzKDApIC1pbiAkU3RvcmUuQ2hhcmFjdGVyKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCiAgICByZXR1cm4gJEFucw0KfQoKZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAX10pKD88dz4uKikiKSB7cmV0dXJuICRUZXh0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsLCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAgICAgICAgICAgICAgIHtHZXQtV2hlcmUgJE1hdGNoZXNbMV19DQogICAgICAgICJeKGxpYnxtb2R1bGUpOiguKikiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCAtYW5kICRPbkZhaWwpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc1RocnUgLW9yICEkT25GYWlsKSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAew0KICAgICAgICAifn5DdHJsQ35+Ij02Nw0KICAgICAgICAifn5TcGFjZX5+Ij0zMg0KICAgICAgICAifn5FU0NBUEV+fiI9MjcNCiAgICAgICAgIn5+RW50ZXJ+fiI9MTMNCiAgICAgICAgIn5+U2hpZnR+fiI9MTYNCiAgICAgICAgIn5+Q29udHJvbH5+Ij0xNw0KICAgICAgICAifn5BbHR+fiI9MTgNCiAgICAgICAgIn5+QmFja1NwYWNlfn4iPTgNCiAgICAgICAgIn5+RGVsZXRlfn4iPTQ2DQogICAgICAgICJ+fmYxfn4iPTExMg0KICAgICAgICAifn5mMn5+Ij0xMTMNCiAgICAgICAgIn5+ZjN+fiI9MTE0DQogICAgICAgICJ+fmY0fn4iPTExNQ0KICAgICAgICAifn5mNX5+Ij0xMTYNCiAgICAgICAgIn5+ZjZ+fiI9MTE3DQogICAgICAgICJ+fmY3fn4iPTExOA0KICAgICAgICAifn5mOH5+Ij0xMTkNCiAgICAgICAgIn5+Zjl+fiI9MTIwDQogICAgICAgICJ+fmYxMH5+Ij0xMjENCiAgICAgICAgIn5+ZjExfn4iPTEyMg0KICAgICAgICAifn5mMTJ+fiI9MTIzDQogICAgICAgICJ+fk11dGV+fiI9MTczDQogICAgICAgICJ+fkluc2VydH5+Ij00NQ0KICAgICAgICAifn5QYWdlVXB+fiI9MzMNCiAgICAgICAgIn5+UGFnZURvd25+fiI9MzQNCiAgICAgICAgIn5+RU5Efn4iPTM1DQogICAgICAgICJ+fkhPTUV+fiI9MzYNCiAgICAgICAgIn5+dGFifn4iPTkNCiAgICAgICAgIn5+Q2Fwc0xvY2t+fiI9MjANCiAgICAgICAgIn5+TnVtTG9ja35+Ij0xNDQNCiAgICAgICAgIn5+U2Nyb2xsTG9ja35+Ij0xNDUNCiAgICAgICAgIn5+V2luZG93c35+Ij05MQ0KICAgICAgICAifn5MZWZ0fn4iPTM3DQogICAgICAgICJ+flVwfn4iPTM4DQogICAgICAgICJ+flJpZ2h0fn4iPTM5DQogICAgICAgICJ+fkRvd25+fiI9NDANCiAgICAgICAgIn5+S1Awfn4iPTk2DQogICAgICAgICJ+fktQMX5+Ij05Nw0KICAgICAgICAifn5LUDJ+fiI9OTgNCiAgICAgICAgIn5+S1Azfn4iPTk5DQogICAgICAgICJ+fktQNH5+Ij0xMDANCiAgICAgICAgIn5+S1A1fn4iPTEwMQ0KICAgICAgICAifn5LUDZ+fiI9MTAyDQogICAgICAgICJ+fktQN35+Ij0xMDMNCiAgICAgICAgIn5+S1A4fn4iPTEwNA0KICAgICAgICAifn5LUDl+fiI9MTA1DQogICAgfQ0KICAgIGlmIChbaW50XSRDb252ZXJ0ID0gJEhhc2hLZXkuJEtleSkge3JldHVybiAkQ29udmVydH0NCiAgICBUaHJvdyAiSW52YWxpZCBTcGVjaWFsIEtleSBDb252ZXJzaW9uIg0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KCmZ1bmN0aW9uIElucHV0LVByb21wdCB7cGFyYW0oW1ZhbGlkYXRlTm90TnVsbG9yRW1wdHkoKV1bU3RyaW5nXSRQcm9tcHQgPSAiRW50ZXIgVGV4dCA6ICIpDQoNCiAgICBXcml0ZS1ob3N0IC1ub25ld2xpbmUgJFByb21wdA0KICAgICRSZVJlZ1ggPSAnW15ceDAxLVx4MDhceDEwLVx4ODBdKycjJ1teXHdcLl0nIFvQkC3Rj9CB0ZFdDQogICAgJFRyU3RyaW5nID0gIiINCiAgICAkaVBvc3ggPSBbQ29uc29sZV06OkN1cnNvckxlZnQNCiAgICAkaVBvc3kgPSBbQ29uc29sZV06OkN1cnNvclRvcA0KICAgICRDdmlzID0gW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlDQogICAgW0NvbnNvbGVdOjpDdXJzb3JWaXNpYmxlID0gJEZhbHNlDQogICAgJENvdW50ID0gMTskU2xlZXAgPSAwDQogICAgV2hpbGUgKCRUcnVlKSB7DQogICAgICAgIGlmICgkY291bnQgLWd0IDUwMCkgeyRTbGVlcCA9IDEwMH0NCiAgICAgICAgaWYgKCRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlEb3duLE5vRWNobyIpOyRDb3VudD0wOyRTbGVlcD0wfSBlbHNlIHskQ291bnQrKztTdGFydC1TbGVlcCAtbSAkU2xlZXA7Y29udGludWV9DQogICAgICAgIGlmIChLZXlQcmVzc2VkICJ+fkJhY2tTcGFjZX5+IiAkU3RvcmUpIHtpZiAoJHN0b3JlLkNvbnRyb2xLZXlTdGF0ZSAtbWF0Y2ggImN0cmwiKSB7JFRyU3RyaW5nPSIifSBlbHNlIHskVHJTdHJpbmcgPSA/OiAoJFRyU3RyaW5nLkxlbmd0aCAtZXEgMCl7IiJ9eyRUclN0cmluZy5zdWJzdHJpbmcoMCwkVHJTdHJpbmcuTGVuZ3RoLTEpfX19DQogICAgICAgIGVsc2VpZiAoS2V5UHJlc3NlZCAifn5TcGFjZX5+IiAkU3RvcmUpIHskVHJTdHJpbmcgKz0gIiAifQ0KICAgICAgICBlbHNlaWYgKEtleVByZXNzZWQgIn5+RXNjYXBlfn4iICRTdG9yZSkgeyRUclN0cmluZz0iIjticmVha30NCiAgICAgICAgZWxzZWlmIChLZXlQcmVzc2VkICJ+fkVOVEVSfn4iICRTdG9yZSkge1dyaXRlLUhvc3QgIiI7YnJlYWt9IGVsc2UgDQogICAgICAgIHskVHJTdHJpbmcgKz0gJFN0b3JlLkNoYXJhY3RlciAtcmVwbGFjZSAoJFJlUmVnWCwnJyl9DQogICAgICAgICR3dCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGggLSAkaVBvc3ggLSAxDQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29ybGVmdCA9ICRpUG9zeA0KICAgICAgICBbQ29uc29sZV06OkN1cnNvclRvcCA9ICRpUG9zeQ0KICAgICAgICBpZiAoJHd0LSRUclN0cmluZy5MZW5ndGggLWx0IDApIHsNCiAgICAgICAgICAgICR0Yj0iIg0KICAgICAgICAgICAgJHR0PSIuLi4iKyRUclN0cmluZy5zdWJzdHJpbmcoJFRyU3RyaW5nLkxlbmd0aC0kd3QrMykNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICR0Yj0iICIqKCR3dC0kVHJTdHJpbmcuTGVuZ3RoKQ0KICAgICAgICAgICAgJHR0PSRUclN0cmluZw0KICAgICAgICB9DQogICAgICAgICRmY29sID0gW2NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3INCiAgICAgICAgV3JpdGUtaG9zdCAtbm9uZXdsaW5lIC1mICRmQ29sICR0dCRUYg0KICAgIH0NCiAgICBbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkQ3Zpcw0KICAgIHJldHVybiAkVFJTdHJpbmcNCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHtwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkNCg0KICAgIGlmICgkZGVjaWRlcikgeyAmJGlmdHJ1ZX0gZWxzZSB7ICYkaWZmYWxzZSB9DQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")
# ========================================END=OF=COMPILER===========================================================|

# ------------------------------------------------------------
if ($Folder -eq "|******|") {
    $FG = [Console]::ForegroundColor
    [Console]::ForegroundColor = "yellow"
    $IP = Input-Prompt "Do you want to configure Flask in current Folder [yes/no] : "
    [Console]::ForegroundColor = $FG
    rv fg
    if ($IP[0] -ne "y") {Write-AP "!Please call the command 'Flask-Config <Path to configure flask>'";exit}
    $Folder = $PWD
}
# ------------------------------------------------------------
Write-AP "*Configuring Flask in [$Form] Mode"
if ($Force) {Write-AP "!In Force\OverWrite Mode"}
# ------------------------------------------------------------
if (!(test-path $Folder -type container)) {
    if ($Force) {
        try {md $Folder | Out-Null} catch {Write-AP "-Invalid Folder Name";exit}
    } else {
        Write-AP "-Folder does not exist!";exit
    }
}
try {Virtualenv | out-null} catch {Write-AP "-Python VirtualEnv is not installed or isn't in Path, Please FIX!";exit}
# ------------------------------------------------------------
$OldPath = $PWD
cd $Folder
# ---------------
if (!$Silent) {Write-AP "*Reading config state of folder"}
try {$VFld = "$(Resolve-Path (Get-ChildItem -Directory | ? {"$((Get-ChildItem -Directory $_).name)" -eq "Include Lib Scripts"})[0])"} catch {}
# ---------------
if (!$Silent) {Write-AP "*Intializing Virtual Environment"}
try {& "$VFld\Scripts\activate.ps1"} catch {
    try {
        del $FLVD
        Write-AP "-V-ENV in [$(Split-Path $VFLD -leaf)] is Mal-Configured! Rebuilding."
        $VFLD = ""
    } catch {}
}
# ---------------
if ($VFld -notmatch "..*") {
    $VFld = "$PWD\FLASK"
    if (!$Silent) {Write-AP ">*Configuring V-Env in [$(Split-Path $VFLD -leaf)]"}
    $dmp = Virtualenv $VFLD
    $Dmp | % {write-host -f 3 "        $_"}
    & "$VFld\Scripts\activate.ps1"
    $Script:NewInst = $True
} else {
    if (!$Silent) {Write-AP ">*Configuring V-Env in [$(Split-Path $VFLD -leaf)]"}
}
# ---------------
if (!$Silent) {Write-AP "*Building Folder Structure"}
"templates","static","static/css" | ? {!(test-path -type container $PWD\$_)} | % {md $_ | Out-Null}
# ---------------
$IndexCode = @"
#!flask/bin/python
from flask import Flask

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return """
        <div align='center'>
            <b><u><i>This is a Site Template Created on Flask-Config by <a href='http://www.linkedin.com/in/ApoorvVerma'>Apoorv Verma [AP]</a></i></u></b>
        </div>
    """

if __name__ == "__main__":
    app.run(debug=True)
"@
# ---------------
if (!(Test-Path $IndexFile -Type Leaf)) {
    if (!$Silent) {Write-AP "*Writing Template to [$IndexFile]"}
    $IndexCode | Out-File -Encoding default $IndexFile
} else {
    if (!$Silent) {Write-AP "*Index File [$IndexFile] exists, skipping."}
}
# ---------------
Write-AP "*Linkaging Package To Functions [Ease of Use]!"
Flask-DevTools $IndexFile -Silent:$Silent
# ------------------------------------------------------------
if ($NewInst -or $Force) {
    if (!$Silent) {Write-AP "*Installing Basic Packages"}
#    "lamson chardet flask-mail","sqlalchemy==0.7.9","flask-sqlalchemy==0.16","sqlalchemy-migrate==0.7.2","flask-whooshalchemy==0.54a","flask-wtf==0.8.4","pytz==2013b","flask-babel==0.8",
    "flask","flask-login","flask-openid","flup" | % {Flask-AddPackage -Silent -ShowFinal $_ -Tab 1}
}
# ---------------
if (!$Silent) {Write-AP "*De-Activating V-Env. To Re-Activate use '$(Split-Path $VFld -leaf)\Scripts\activate'"}
try {gcm deactivate -ErrorAction Stop | Out-Null;deactivate} catch {Write-AP "!Function [Deactivate] should have existed! VirtualEnv Was not configured!"}
# ---------------
Write-AP "+Completed Configuring Flask in [$(Split-Path $PWD -leaf)]"
# ------------------------------------------------------------
cd $OLDPath;rv oldpath
