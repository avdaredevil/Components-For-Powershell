param([Hashtable]$Config)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JChbYm9vbF0kTWF0Y2hlcy5OTkwpIC1mICRDb2wgJERhdGENCiAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICB9DQp9CgpmdW5jdGlvbiBDbGVhci1MaW5lIHsNCiAgICAkTm0gPSBbQ29uc29sZV06OldpbmRvd1dpZHRoDQogICAgJHQgPSBbQ29uc29sZV06OkN1cnNvclRvcDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZSAoIiAiKiROTSkNCiAgICBbQ29uc29sZV06OkN1cnNvclRvcD0kdDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KfQoKZnVuY3Rpb24gUGxhY2UtQWxpZ25lZC1UZXh0IHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJywgW0FsaWFzKCJmIildW1N5c3RlbS5Db25zb2xlQ29sb3JdJEZvcmVDb2w9W0NvbnNvbGVdOjpGb3JlR3JvdW5kQ29sb3IsIFtBbGlhcygiYiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRCYWNrQ29sPVtDb25zb2xlXTo6QmFja0dyb3VuZENvbG9yLCBbaW50XSRPZmZzZXQ9MCwgW0FsaWFzKCJOTkwiKV1bU3dpdGNoXSROb05ld0xpbmUpDQoNCiAgICAkU3BhY2VzPSAiICIqKCRUZXh0Lmxlbmd0aC0kdGV4dC50cmltU3RhcnQoKS5sZW5ndGgpDQogICAgJFRleHQgID0gQWxpZ24tVGV4dCAkVGV4dCAkQWxpZ24NCiAgICAkRmluYWwgPSAkU3BhY2VzKyRUZXh0LnRyaW1TdGFydCgpDQogICAgJENvdW50ID0gJFRleHQuTGVuZ3RoLSRUZXh0LlRyaW1TdGFydCgpLkxlbmd0aC0kU3BhY2VzLmxlbmd0aCskT2Zmc2V0DQogICAgW0NvbnNvbGVdOjpDdXJzb3JMZWZ0ID0gJENvdW50DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiROb05ld0xpbmUgLWYgJEZvcmVDb2wgLWIgJEJhY2tDb2wgJEZpbmFsDQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHtwYXJhbSgkU3RyKQ0KDQogICAgJFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifQ0KfQoKZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gSlMtT1Ige2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7aWYgKCEkYSkge2NvbnRpbnVlfTtpZiAoJGEuR2V0VHlwZSgpLk5hbWUgLWVxICJTY3JpcHRCbG9jayIpIHskYSA9ICRhLmludm9rZSgpO2lmICghJGEpe2NvbnRpbnVlfX07cmV0dXJuICRhfX0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopIiAgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0sICR0cnVlKX0NCiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopIiB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgICAgIGRlZmF1bHQge1dyaXRlLUFQICIhSW52YWxpZCBzZWxlY3RvciBwcm92aWRlZCBbJCgiJExpYiIuc3BsaXQoJzonKVswXSldIjt0aHJvdyAnQkFEX1NFTEVDVE9SJ30NCiAgICB9KQ0KICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIEFQLUNvbnZlcnRQYXRoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kUGF0aCkNCg0KICAgIHJldHVybiAkUGF0aCAtcmVwbGFjZSANCiAgICAgICAgIjxEZXA+IiwiPExpYj5cRGVwZW5kZW5jaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxMaWI+IiwiPEhvbWU+XEFQLUxpYnJhcmllcyIgLXJlcGxhY2UgDQogICAgICAgICI8Q29tcChvbmVudHMpPz4iLCI8SG9tZT5cQVAtQ29tcG9uZW50cyIgLXJlcGxhY2UgDQogICAgICAgICI8SG9tZT4iLCRQU0hlbGx9Cg==")
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
