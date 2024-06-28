param([Hashtable]$Config)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gR2V0LUVzY2FwZSB7W0NoYXJdMHgxYn0KCmZ1bmN0aW9uIEFQLUNvbnZlcnRQYXRoIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kUGF0aCkNCg0KICAgICRQYXRoU2VwID0gW0lPLlBhdGhdOjpEaXJlY3RvcnlTZXBhcmF0b3JDaGFyDQogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlIA0KICAgICAgICAiPERlcD4iLCI8TGliPiR7UGF0aFNlcH1EZXBlbmRlbmNpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPExpYj4iLCI8SG9tZT4ke1BhdGhTZXB9QVAtTGlicmFyaWVzIiAtcmVwbGFjZSANCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPiR7UGF0aFNlcH1BUC1Db21wb25lbnRzIiAtcmVwbGFjZSANCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gW2NvbnNvbGVdOjpCdWZmZXJXaWR0aA0KICAgICAgICAkQ2xlYW5UZXh0U2l6ZSA9IChTdHJpcC1Db2xvckNvZGVzICgiIiskVGV4dCkpLkxlbmd0aA0KICAgICAgICBpZiAoJENsZWFuVGV4dFNpemUgLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCRDbGVhblRleHRTaXplLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQogICAgICAgICAgICAgICAgIyAiIiskaisiIC0gIiskcA0KICAgICAgICAgICAgICAgICRBcHBlbmRlclskal0gKz0gJFRleHQuY2hhcnMoJHApDQogICAgICAgICAgICB9DQogICAgICAgICAgICByZXR1cm4gKEFsaWduLVRleHQgJEFwcGVuZGVyICRBbGlnbikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGlmICgkQWxpZ24gLWVxICJDZW50ZXIiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRBbGlnbiAtZXEgIlJpZ2h0Iikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKigkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZS0xKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgkVGV4dCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFBsYWNlLUFsaWduZWQtVGV4dCB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9J0N1cnNvcicpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSwgUG9zaXRpb24gPSAwKV1bU3RyaW5nXSRUZXh0LA0KICAgICAgICBbUGFyYW1ldGVyKFBvc2l0aW9uID0gMSldW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbiA9ICdDZW50ZXInLA0KICAgICAgICBbQWxpYXMoImYiKV1bU3lzdGVtLkNvbnNvbGVDb2xvcl0kRm9yZUNvbCA9IFtDb25zb2xlXTo6Rm9yZUdyb3VuZENvbG9yLA0KICAgICAgICBbQWxpYXMoImIiKV1bU3lzdGVtLkNvbnNvbGVDb2xvcl0kQmFja0NvbCA9IFtDb25zb2xlXTo6QmFja0dyb3VuZENvbG9yLA0KICAgICAgICBbaW50XSRPZmZzZXQgPSAwLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWUgPSAnQ3Vyc29yJyldW0FsaWFzKCJOTkwiKV1bU3dpdGNoXSROb05ld0xpbmUsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZSA9ICdCdWZmZXJlZCcpXSR5UG9zID0gMA0KICAgICkNCiAgICAkU3BhY2VzPSAiICIqKCRUZXh0Lmxlbmd0aC0kdGV4dC50cmltU3RhcnQoKS5sZW5ndGgpDQogICAgJFRleHQgID0gQWxpZ24tVGV4dCAkVGV4dCAkQWxpZ24NCiAgICAkRmluYWwgPSAkU3BhY2VzKyRUZXh0LnRyaW1TdGFydCgpDQogICAgJENvdW50ID0gJFRleHQuTGVuZ3RoLSRUZXh0LlRyaW1TdGFydCgpLkxlbmd0aC0kU3BhY2VzLmxlbmd0aCskT2Zmc2V0DQogICAgaWYgKCRQc0NtZGxldC5QYXJhbWV0ZXJTZXROYW1lIC1lcSAnQ3Vyc29yJykgew0KICAgICAgICBbQ29uc29sZV06OkN1cnNvckxlZnQgPSAkQ291bnQNCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiROb05ld0xpbmUgLWYgJEZvcmVDb2wgLWIgJEJhY2tDb2wgJEZpbmFsDQogICAgfSBlbHNlIHsNCiAgICAgICAgUGxhY2UtQnVmZmVyZWRDb250ZW50ICRGaW5hbCAteCAkQ291bnQgLXkgJHlQb3MgLUYgJEZvcmVDb2wgLUIgJEJhY2tDb2wNCiAgICB9DQp9CgpmdW5jdGlvbiBXcml0ZS1BUCB7DQogICAgW0NtZGxldEJpbmRpbmcoKV0NCiAgICBwYXJhbShbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPSR0cnVlLCBNYW5kYXRvcnk9JFRydWUpXSRUZXh0LFtTd2l0Y2hdJE5vU2lnbixbU3dpdGNoXSRQbGFpblRleHQsW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nTGVmdCcsW1N3aXRjaF0kUGFzc1RocnUpDQogICAgYmVnaW4geyRUVCA9IEAoKX0NCiAgICBQcm9jZXNzIHskVFQgKz0gLCRUZXh0fQ0KICAgIEVORCB7DQogICAgICAgICRCbHVlID0gJChpZiAoJFdSSVRFX0FQX0xFR0FDWV9DT0xPUlMpezN9ZWxzZXsnQmx1ZSd9KQ0KICAgICAgICBpZiAoJFRULmNvdW50IC1lcSAxKSB7JFRUID0gJFRUWzBdfTskVGV4dCA9ICRUVA0KICAgICAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7DQogICAgICAgICAgICByZXR1cm4gJFRleHQgfCA/IHsiJF8ifSB8ICUgew0KICAgICAgICAgICAgICAgIFdyaXRlLUFQICRfIC1Ob1NpZ246JE5vU2lnbiAtUGxhaW5UZXh0OiRQbGFpblRleHQgLUFsaWduICRBbGlnbiAtUGFzc1RocnU6JFBhc3NUaHJ1DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgaWYgKCEkdGV4dCAtb3IgJHRleHQgLW5vdG1hdGNoICJeKCg/PE5OTD54KXwoPzxOUz5ucz8pKXswLDJ9KD88dD5cPiopKD88cz5bK1wtIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAgICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aA0KICAgICAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0kQmx1ZTsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknOydfJz0nd2hpdGUnfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgICAgIEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIHtmdW5jdGlvbiBHbG9iYWw6QWxpZ24tVGV4dCgkYWxpZ24sJHRleHQpIHskdGV4dH19DQogICAgICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAgICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICAgICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgICAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICREYXRhfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7DQogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgUG9zaXRpb249MCldW3N0cmluZ10kRmlsZSwNCiAgICAgICAgW1N3aXRjaF0kQWxsLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J05vcm1hbCcpXVtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJE1hbnVhbFNjYW4sDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nU2NhbicpXVtTd2l0Y2hdJERiZywNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICAkSXNWZXJib3NlID0gJERiZyAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdWZXJib3NlJykgLW9yICRQU0JvdW5kUGFyYW1ldGVycy5Db250YWluc0tleSgnRGVidWcnKQ0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCiAgICAgICAgDQogICAgICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICAgICAgcmV0dXJuIEAoJE91dClbMF0NCiAgICB9DQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7DQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUiDQogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGZvcmVhY2ggKCRFeHRlbnNpb24gaW4gKEdldC1QYXRoIC1QYXRoVmFyIFBBVEhFWFQpKSB7DQogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiINCiAgICAgICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0NCiAgICAgICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFN0cmlwLUNvbG9yQ29kZXMge3BhcmFtKCRTdHIpDQoNCiAgICAkU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9DQp9CgpmdW5jdGlvbiBQbGFjZS1CdWZmZXJlZENvbnRlbnQge3BhcmFtKCRUZXh0LCAkeCwgJHksIFtDb25zb2xlQ29sb3JdJEZvcmVncm91bmRDb2xvcj1bQ29uc29sZV06OkZvcmVncm91bmRDb2xvciwgW0NvbnNvbGVDb2xvcl0kQmFja2dyb3VuZENvbG9yPVtDb25zb2xlXTo6QmFja2dyb3VuZENvbG9yKQ0KDQogICAgJGNyZCA9IFtNYW5hZ2VtZW50LkF1dG9tYXRpb24uSG9zdC5Db29yZGluYXRlc106Om5ldygkeCwkeSkNCiAgICAkYiA9ICRIb3N0LlVJLlJhd1VJDQogICAgJGFyciA9ICRiLk5ld0J1ZmZlckNlbGxBcnJheShAKCRUZXh0KSwgJEZvcmVncm91bmRDb2xvciwgJEJhY2tncm91bmRDb2xvcikNCiAgICAkeCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGgtMS0kVGV4dC5sZW5ndGgNCiAgICAkYi5TZXRCdWZmZXJDb250ZW50cygkY3JkLCAkYXJyKQ0KfQoKZnVuY3Rpb24gQ2xlYXItTGluZSB7DQogICAgJE5tID0gW0NvbnNvbGVdOjpXaW5kb3dXaWR0aA0KICAgICR0ID0gW0NvbnNvbGVdOjpDdXJzb3JUb3A7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmUgKCIgIiokTk0pDQogICAgW0NvbnNvbGVdOjpDdXJzb3JUb3A9JHQ7W0NvbnNvbGVdOjpDdXJzb3JMZWZ0PTANCn0KCmZ1bmN0aW9uIEFQLVJlcXVpcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICAgICAgICAgICAgICAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopIiAgICAgIHskTG9hZE1vZHVsZS5pbnZva2UoJE1hdGNoZXNbMl0sICR0cnVlKX0NCiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopIiB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgICAgIGRlZmF1bHQge1dyaXRlLUFQICIhSW52YWxpZCBzZWxlY3RvciBwcm92aWRlZCBbJCgiJExpYiIuc3BsaXQoJzonKVswXSldIjt0aHJvdyAnQkFEX1NFTEVDVE9SJ30NCiAgICB9KQ0KICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykge2lmICghJGEpIHtjb250aW51ZX07aWYgKCRhLkdldFR5cGUoKS5OYW1lIC1lcSAiU2NyaXB0QmxvY2siKSB7JGEgPSAkYS5pbnZva2UoKTtpZiAoISRhKXtjb250aW51ZX19O3JldHVybiAkYX19CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0K")
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
