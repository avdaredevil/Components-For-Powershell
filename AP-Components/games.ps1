
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAX10pKD88dz4uKikiKSB7cmV0dXJuICRUZXh0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIge2Z1bmN0aW9uIEdsb2JhbDpBbGlnbi1UZXh0KCRhbGlnbiwkdGV4dCkgeyR0ZXh0fX0NCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gVGVzdC1BZG1pbmlzdHJhdG9yIHsNCiAgICBpZiAoJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIpIHsNCiAgICAgICAgaWYgKCQod2hvYW1pKSAtZXEgInJvb3QiKSB7DQogICAgICAgICAgICByZXR1cm4gJHRydWUNCiAgICAgICAgfQ0KICAgICAgICBlbHNlIHsNCiAgICAgICAgICAgIHJldHVybiAkZmFsc2UNCiAgICAgICAgfQ0KICAgIH0NCiAgICAjIFdpbmRvd3MNCiAgICAoTmV3LU9iamVjdCBTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c1ByaW5jaXBhbCAoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzSWRlbnRpdHldOjpHZXRDdXJyZW50KCkpKS5Jc0luUm9sZShbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NCdWlsdGluUm9sZV06OkFkbWluaXN0cmF0b3IpDQp9CgpmdW5jdGlvbiBTaXplLUFkaiB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUpXVtEb3VibGVdJEJ5dGVzLCBbU3dpdGNoXSRCeVRob3VzYW5kKQ0KDQogICAgJEJUID0gPzooJEJ5VGhvdXNhbmQpezEwMDB9ezEwMjR9DQogICAgJFNpemVzID0gQCgiIiwiSyIsIk0iLCJHIiwiVCIsIlAiLCJFIiwiWiIsIlkiKQ0KICAgICREZWcgPSBbTWF0aF06OkZsb29yKFtNYXRoXTo6TG9nKCRieXRlcywkQlQpKQ0KICAgICREZWcgPSA/OigkRGVnIC1nZSAkU2l6ZXMuY291bnQpeyRTaXplcy5jb3VudC0xfXskRGVnfQ0KICAgICRSZXQgPSAiezB9IiAtZiBbTWF0aF06OlJvdW5kKCRCeXRlcy8oW01hdGhdOjpQb3coJEJULCREZWcpKSwyKQ0KICAgIGlmICgkcmV0IC1lcSAiTmFOIikge3JldHVybiAkcmV0fQ0KICAgIFJldHVybiAiJHJldCAkKCRTaXplc1skRGVnXSlCIg0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsLCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5vczood2lufGxpbnV4fHVuaXgpJCIgICAgeyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IjtpZiAoJE1hdGNoZXNbMV0gLWVxICJ3aW4iKSB7ISRJc1VuaXh9IGVsc2UgeyRJc1VuaXh9fQ0KICAgICAgICAiXmFkbWluJCIgICAgICAgICAgICAgICAgICB7VGVzdC1BZG1pbmlzdHJhdG9yfQ0KICAgICAgICAiXmRlcDooLiopJCIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopJCIgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSQiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikkIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopJCIgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyRPbkZhaWwuSW52b2tlKCl9DQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9DQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHtbQ2hhcl0weDFifQoKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")
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
