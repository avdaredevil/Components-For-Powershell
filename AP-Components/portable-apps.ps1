
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")

    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))
}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsLCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgICRMb2FkTW9kdWxlID0gew0KICAgICAgICBwYXJhbSgkRmlsZSxbYm9vbF0kSW1wb3J0KQ0KICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9DQogICAgICAgICRMaWI9QVAtQ29udmVydFBhdGggIjxMSUI+IjskTEYgPSAiJExpYlwkRmlsZSINCiAgICAgICAgW3N0cmluZ10kZiA9IGlmKHRlc3QtcGF0aCAtdCBsZWFmICRMRil7JExGfWVsc2VpZih0ZXN0LXBhdGggLXQgbGVhZiAiJExGLmRsbCIpeyIkTEYuZGxsIn0NCiAgICAgICAgaWYgKCRmIC1hbmQgJEltcG9ydCkge0ltcG9ydC1Nb2R1bGUgJGZ9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCIgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAgICAgICAgICAgICAgIHtHZXQtV2hlcmUgJE1hdGNoZXNbMV19DQogICAgICAgICJeKGxpYnxtb2R1bGUpOiguKikiICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikiIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0pfQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJec3RyaWN0X2Z1bmN0aW9uOiguKikiICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQ0KICAgIH0pDQogICAgaWYgKCEkU3RhdCAtYW5kICRPbkZhaWwpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc1RocnUgLW9yICEkT25GYWlsKSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPlxEZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT5cQVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPlxBUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0K")
# ========================================END=OF=COMPILER===========================================================|
$Apps = (ls "F:\AP\PortableApps\" -Dir | ? Name -Match "^(.+)Portable$" | % {"""$($Matches.1)"""}) -join ","

iex "function global:portableapp([ValidateSet($Apps)]`$App) {
    if (!`$App) {return & ""F:\AP\Start.exe""}
    & ""F:\AP\PortableApps\`${App}Portable\`${App}Portable.exe"" @args
}"
Write-AP "+Use portableapp <app> to launch portable apps!"
