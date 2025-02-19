param([Hashtable]$Config)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBDbGVhci1MaW5lIHsNCiAgICAkTm0gPSBbQ29uc29sZV06OldpbmRvd1dpZHRoDQogICAgJHQgPSBbQ29uc29sZV06OkN1cnNvclRvcDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZSAoIiAiKiROTSkNCiAgICBbQ29uc29sZV06OkN1cnNvclRvcD0kdDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KfQoKZnVuY3Rpb24gR2V0LUNvbG9yIHsNCiAgICA8IyAgLkRlc2NyaXB0aW9uDQogICAgICAgIEZldGNoZXMgYmFzaWMgY29sb3JzIHVzaW5nIHRoZSBVbmljb2RlIEVzY2FwZSBzZXF1ZW5jZXMNCiAgICAjPg0KICAgIHBhcmFtICgNCiAgICAgICAgW1ZhbGlkYXRlU2V0KA0KICAgICAgICAgICAgJ3InLCdyZXNldCcsJ3JTJywncmVzZXRTdHlsZXMnLCdkJywnZGltJywncycsJ3N0cmlrZScsJ3UnLCd1bmRlcmxpbmUnLCdiJywnYm9sZCcsJ2knLCdpdGFsaWMnLCdibCcsJ2JsaW5rJywncmV2ZXJzZScsJ2gnLCdoaWRkZW4nLA0KICAgICAgICAgICAgJ0JsYWNrJywnRGFya0JsdWUnLCdEYXJrR3JlZW4nLCdEYXJrQ3lhbicsJ0RhcmtSZWQnLCdEYXJrTWFnZW50YScsJ0RhcmtZZWxsb3cnLCdHcmF5JywnRGFya0dyYXknLCdCbHVlJywnR3JlZW4nLCdDeWFuJywnUmVkJywnTWFnZW50YScsJ1llbGxvdycsJ1doaXRlJywNCiAgICAgICAgICAgICdiZy5CbGFjaycsJ2JnLkRhcmtCbHVlJywnYmcuRGFya0dyZWVuJywnYmcuRGFya0N5YW4nLCdiZy5EYXJrUmVkJywnYmcuRGFya01hZ2VudGEnLCdiZy5EYXJrWWVsbG93JywnYmcuR3JheScsJ2JnLkRhcmtHcmF5JywnYmcuQmx1ZScsJ2JnLkdyZWVuJywnYmcuQ3lhbicsJ2JnLlJlZCcsJ2JnLk1hZ2VudGEnLCdiZy5ZZWxsb3cnLCdiZy5XaGl0ZScNCiAgICAgICAgKV1bU3RyaW5nW11dJENvZGUsDQogICAgICAgIFtBbGlhcygnYmcnKV1bU3dpdGNoXSRCYWNrZ3JvdW5kLA0KICAgICAgICBbU3dpdGNoXSRDb2RlU3RyaW5nDQogICAgKQ0KICAgICRBbGlhc1RhYmxlID0gQHt1ID0gJ3VuZGVybGluZSc7YiA9ICdib2xkJztpID0gJ2l0YWxpYyc7ciA9ICdyZXNldCc7clMgPSAncmVzZXRTdHlsZXMnO3MgPSAnc3RyaWtlJztkID0gJ2RpbSc7YmwgPSAnYmxpbmsnO2ggPSAnaGlkZGVuJ30NCiAgICBpZiAoISRHbG9iYWw6QVBfQ09MT1JfVEFCTEUpIHsNCiAgICAgICAgJFRCTCA9ICRHbG9iYWw6QVBfQ09MT1JfVEFCTEUgPSBAe3Jlc2V0ID0gMDtib2xkID0gMTtkaW0gPSAyO2l0YWxpYyA9IDM7dW5kZXJsaW5lID0gNDtibGluayA9IDU7cmV2ZXJzZSA9IDc7aGlkZGVuID0gODtzdHJpa2UgPSA5O3Jlc2V0U3R5bGVzID0gJzIyOzIzOzI0OzI1OzI3OzI4OzI5J30NCiAgICAgICAgMCwxIHwgJSB7DQogICAgICAgICAgICAkQmdJbmRleCA9ICRfDQogICAgICAgICAgICAwLDEgfCAlIHsNCiAgICAgICAgICAgICAgICAkU3BjSW5kZXggPSAkXw0KICAgICAgICAgICAgICAgICRpID0gMA0KICAgICAgICAgICAgICAgICdCbGFjay5UfFJlZHxHcmVlbnxZZWxsb3d8Qmx1ZXxNYWdlbnRhfEN5YW58V2hpdGUnLnNwbGl0KCd8JykgfCAlIHsNCiAgICAgICAgICAgICAgICAgICAgJEluY3IgPSAkQmdJbmRleCAqIDEwDQogICAgICAgICAgICAgICAgICAgICRDb2xOYW1lID0gKCgnJywnYmcuJylbJEJnSW5kZXhdKSsoKCdEYXJrJywnJylbJFNwY0luZGV4XSkrJF8NCiAgICAgICAgICAgICAgICAgICAgJENvbFNwYWNlID0gKDMwLCA5MClbJFNwY0luZGV4XSArICRJbmNyDQogICAgICAgICAgICAgICAgICAgICRUQkwuJENvbE5hbWUgPSAkQ29sU3BhY2UrKCRpKyspDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIEB7RGFya0dyYXkgPSAnQmxhY2suVCc7QmxhY2sgPSAnRGFya0JsYWNrLlQnO0dyYXkgPSAnRGFya1doaXRlJ30uR2V0RW51bWVyYXRvcigpIHwgJSB7DQogICAgICAgICAgICAkVEJMLigkXy5LZXkpID0gJFRCTC4oJF8uVmFsdWUpDQogICAgICAgICAgICAkVEJMLignYmcuJyskXy5LZXkpID0gJFRCTC4oJ2JnLicrJF8uVmFsdWUpDQogICAgICAgICAgICAkVEJMLnJlbW92ZSgkXy5WYWx1ZSkNCiAgICAgICAgICAgICRUQkwucmVtb3ZlKCdiZy4nKyRfLlZhbHVlKQ0KICAgICAgICB9DQogICAgfQ0KICAgICRDb2RlcyA9ICgkQ29kZSskQXJncyB8ICUgew0KICAgICAgICAkR2xvYmFsOkFQX0NPTE9SX1RBQkxFLihKUy1PUiAkQWxpYXNUYWJsZS4kXyAkXykNCiAgICB9KSAtam9pbiAnOycNCiAgICBpZiAoJENvZGVTdHJpbmcpIHtyZXR1cm4gJENvZGVzfQ0KICAgIHJldHVybiAiJChHZXQtRXNjYXBlKVske0NvZGVzfW0iDQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHsNCiAgICBpZiAoIShBUC1SZXF1aXJlICJhYmlsaXR5OmVzY2FwZV9jb2RlcyIpKSB7dGhyb3cgIltHZXQtUkJHXSBZb3VyIGNvbnNvbGUgZG9lcyBub3Qgc3VwcG9ydCBBTlNJIGVzY2FwZSBjb2RlcyJ9DQogICAgcmV0dXJuIFtDaGFyXTB4MWIgIyBgZQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgTWFuZGF0b3J5PSRUcnVlKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KICAgIGJlZ2luIHskVFQgPSBAKCl9DQogICAgUHJvY2VzcyB7JFRUICs9ICwkVGV4dH0NCiAgICBFTkQgew0KICAgICAgICAkQmx1ZSA9ICQoaWYgKCRXUklURV9BUF9MRUdBQ1lfQ09MT1JTKXszfWVsc2V7J0JsdWUnfSkNCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQNCiAgICAgICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikgew0KICAgICAgICAgICAgcmV0dXJuICRUZXh0IHwgPyB7IiRfIn0gfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+W1wrXC1cIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAgICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aA0KICAgICAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0kQmx1ZTsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknOydfJz0nd2hpdGUnfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgICAgICRTaWduID0gJChpZiAoJE5vU2lnbiAtb3IgJE1hdGNoZXMuTlMpIHsiIn0gZWxzZSB7IlskU2lnbl0gIn0pDQogICAgICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAgICAgaWYgKEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIC1wYSkgew0KICAgICAgICAgICAgJERhdGEgPSBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSINCiAgICAgICAgfQ0KICAgICAgICBpZiAoJFBsYWluVGV4dCkge3JldHVybiAkRGF0YX0NCiAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9DQogICAgfQ0KfQoKZnVuY3Rpb24gUGxhY2UtQnVmZmVyZWRDb250ZW50IHtwYXJhbSgkVGV4dCwgJHgsICR5LCBbQ29uc29sZUNvbG9yXSRGb3JlZ3JvdW5kQ29sb3I9W0NvbnNvbGVdOjpGb3JlZ3JvdW5kQ29sb3IsIFtDb25zb2xlQ29sb3JdJEJhY2tncm91bmRDb2xvcj1bQ29uc29sZV06OkJhY2tncm91bmRDb2xvcikNCg0KICAgICRjcmQgPSBbTWFuYWdlbWVudC5BdXRvbWF0aW9uLkhvc3QuQ29vcmRpbmF0ZXNdOjpuZXcoJHgsJHkpDQogICAgJGIgPSAkSG9zdC5VSS5SYXdVSQ0KICAgICRhcnIgPSAkYi5OZXdCdWZmZXJDZWxsQXJyYXkoQCgkVGV4dCksICRGb3JlZ3JvdW5kQ29sb3IsICRCYWNrZ3JvdW5kQ29sb3IpDQogICAgJHggPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoLTEtJFRleHQubGVuZ3RoDQogICAgJGIuU2V0QnVmZmVyQ29udGVudHMoJGNyZCwgJGFycikNCn0KCmZ1bmN0aW9uIFN0cmlwLUNvbG9yQ29kZXMge3BhcmFtKCRTdHIpDQoNCiAgICAkU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9DQp9CgpmdW5jdGlvbiBKUy1PUiB7Zm9yZWFjaCAoJGEgaW4gJGFyZ3MpIHtpZiAoISRhKSB7Y29udGludWV9O2lmICgkYS5HZXRUeXBlKCkuTmFtZSAtZXEgIlNjcmlwdEJsb2NrIikgeyRhID0gJGEuaW52b2tlKCk7aWYgKCEkYSl7Y29udGludWV9fTtyZXR1cm4gJGF9fQoKZnVuY3Rpb24gU2V0LVBhdGggew0KICAgIFtjbWRsZXRiaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5ID0gJHRydWUsIFZhbHVlRnJvbVBpcGVsaW5lID0gJHRydWUpXVtzdHJpbmdbXV0kUGF0aCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoDQogICAgfQ0KICAgIHByb2Nlc3Mgew0KICAgICAgICAkUGF0aCB8ICUgew0KICAgICAgICAgICAgJEZpbmFsUGF0aCArPSAkXw0KICAgICAgICB9DQogICAgfQ0KICAgIGVuZCB7DQogICAgICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgICRQdGggPSAkRmluYWxQYXRoIC1qb2luICRQYXRoU2VwDQogICAgICAgICRQdGggPSAoJFB0aCAtcmVwbGFjZSgiJFBhdGhTZXArIiwgJFBhdGhTZXApIC1yZXBsYWNlKCJcXCRQYXRoU2VwfFxcJCIsICRQYXRoU2VwKSkudHJpbSgkUGF0aFNlcCkNCiAgICAgICAgJFB0aCA9ICgoJFB0aCkuc3BsaXQoJFBhdGhTZXApIHwgc2VsZWN0IC11bmlxdWUpIC1qb2luICRQYXRoU2VwDQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gV3JpdGUtQVBMIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKA0KICAgICAgICBbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPSR0cnVlLCBNYW5kYXRvcnk9JFRydWUpXSRUZXh0LA0KICAgICAgICBbQWxpYXMoJ05TJyldW1N3aXRjaF0kTm9TaWduLA0KICAgICAgICBbQWxpYXMoJ05OTCcsJ05MJyldW1N3aXRjaF0kTm9OZXdMaW5lLA0KICAgICAgICBbU3dpdGNoXSRQYXNzVGhydQ0KICAgICkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIHByb2Nlc3MgeyRUZXh0IHwgJSB7JFRUICs9ICwkX319DQogICAgZW5kIHsNCiAgICAgICAgZm9yICgkaT0wOyRpIC1sdCAkVFQuY291bnQ7JGkrKykgew0KICAgICAgICAgICAgW3N0cmluZ10kQ2h1bmsgPSAkVFRbJGldDQogICAgICAgICAgICAkU2lnblJneCA9ICJbXCtcLVwhXCpcI1xAX1w+XSINCiAgICAgICAgICAgICRDaHVuayA9ICRDaHVuayAtcmVwbGFjZSAiXm4/eD9uPygkU2lnblJneCkiLCckMScNCiAgICAgICAgICAgIGlmICgkQ2h1bmsgLW5vdG1hdGNoICJeJFNpZ25SZ3guKiIpIHskQ2h1bmsgPSAiXyRDaHVuayJ9ICMgVXNlIGRlZmF1bHQgYXMgd2hpdGUNCiAgICAgICAgICAgICRQcmVmaXhDb2RlID0gPzogKCRpIC1lcSAwKSB7IngkKD86ICROb1NpZ24geyduJ30geycnfSkifSB7PzogKCRpIC1uZSAoJFRULkNvdW50IC0gMSkpIHsibngifSAibiQoPzogJE5vTmV3TGluZSB7J3gnfSB7Jyd9KSJ9DQogICAgICAgICAgICBpZiAoJFRULkNvdW50IC1lcSAxKSB7JFByZWZpeENvZGUgPSAiJCg/OiAkTm9TaWduIHsnbid9IHsnJ30pJCg/OiAkTm9OZXdMaW5lIHsneCd9IHsnJ30pIn0NCiAgICAgICAgICAgIFdyaXRlLUFQICIkUHJlZml4Q29kZSRDaHVuayIgLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bQXJndW1lbnRDb21wbGV0ZXIoew0KICAgIFtPdXRwdXRUeXBlKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW3N0cmluZ10gJENvbW1hbmROYW1lLA0KICAgICAgICBbc3RyaW5nXSAkUGFyYW1ldGVyTmFtZSwNCiAgICAgICAgW3N0cmluZ10gJFdvcmRUb0NvbXBsZXRlLA0KICAgICAgICBbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5MYW5ndWFnZS5Db21tYW5kQXN0XSAkQ29tbWFuZEFzdCwNCiAgICAgICAgW1N5c3RlbS5Db2xsZWN0aW9ucy5JRGljdGlvbmFyeV0gJEZha2VCb3VuZFBhcmFtZXRlcnMNCiAgICApDQogICAgJENvbXBsZXRpb25SZXN1bHRzID0gW1N5c3RlbS5Db2xsZWN0aW9ucy5HZW5lcmljLkxpc3RbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XV06Om5ldygpDQogICAgJExpYiA9IEAoIkludGVybmV0Iiwib3M6d2luZG93cyIsIm9zOmxpbnV4Iiwib3M6dW5peCIsImFkbWluaXN0cmF0b3IiLCJyb290IiwibGliOiIsImxpYl90ZXN0OiIsImZ1bmN0aW9uOiIsInN0cmljdF9mdW5jdGlvbjoiLCJhYmlsaXR5OmVzY2FwZV9jb2RlcyIsImFiaWxpdHk6ZW1vamlzIikNCiAgICBKUy1PUiB7JExpYiB8ID8geyRfIC1saWtlICIkV29yZFRvQ29tcGxldGUqIn19IHskTGliIHwgPyB7JF8gLWxpa2UgIiokV29yZFRvQ29tcGxldGUqIn19IHwgJSB7DQogICAgICAgICRDb21wbGV0aW9uUmVzdWx0cy5BZGQoW1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uQ29tcGxldGlvblJlc3VsdF06Om5ldygkXywgJF8sICdQYXJhbWV0ZXJWYWx1ZScsICRfKSkNCiAgICB9DQogICAgcmV0dXJuICRDb21wbGV0aW9uUmVzdWx0cw0KfSldW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJEludm9rZU9yUmV0dXJuID0gew0KICAgICAgICBwYXJhbSgkQ21kKQ0KICAgICAgICBpZiAoJENtZCAtaXMgW1NjcmlwdEJsb2NrXSkgeyYgJENtZH0gZWxzZSB7JENtZH0NCiAgICB9DQogICAgaWYgKCEkT25GYWlsKSB7JFBhc3NUaHJ1ID0gJHRydWV9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQkIiAgICAgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXm9zOih3aW4oZG93cyk/fGxpbnV4fHVuaXgpJCIgeyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IjtpZiAoJE1hdGNoZXNbMV0gLW1hdGNoICJed2luIikgeyEkSXNVbml4fSBlbHNlIHskSXNVbml4fX0NCiAgICAgICAgIl5hZG1pbihpc3RyYXRvcik/JHxecm9vdCQiICAgIHtUZXN0LUFkbWluaXN0cmF0b3J9DQogICAgICAgICJeZGVwOiguKikkIiAgICAgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopJCIgICAgICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikkIiAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSQiICAgICAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopJCIgICAgICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgIl5hYmlsaXR5Oihlc2NhcGVfY29kZXN8ZW1vamlzKSQiICAgICB7JiAkSW52b2tlT3JSZXR1cm4gKEB7DQogICAgICAgICAgICBlc2NhcGVfY29kZXMgPSAkSG9zdC5VSS5TdXBwb3J0c1ZpcnR1YWxUZXJtaW5hbA0KICAgICAgICAgICAgZW1vamlzID0gJGVudjpXVF9TRVNTSU9OIC1vciAkZW52OldUX1BST0ZJTEVfSUQNCiAgICAgICAgfVskTWF0Y2hlc1sxXV0pfQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyYgJE9uRmFpbH0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHtwYXJhbSgkZGVjaWRlciwgJGlmdHJ1ZSwgJGlmZmFsc2UgPSB7fSkNCg0KICAgICRJbnZva2VPclJldHVybiA9IHsNCiAgICAgICAgcGFyYW0oJENtZCkNCiAgICAgICAgaWYgKCRDbWQgLWlzIFtTY3JpcHRCbG9ja10pIHsmICRDbWR9IGVsc2UgeyRDbWR9DQogICAgfQ0KICAgIGlmICgkZGVjaWRlcikgeyAmICRJbnZva2VPclJldHVybiAkaWZ0cnVlIH0gZWxzZSB7ICYgJEludm9rZU9yUmV0dXJuICRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFRlc3QtQWRtaW5pc3RyYXRvciB7DQogICAgaWYgKCRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiKSB7DQogICAgICAgIGlmICgkKHdob2FtaSkgLWVxICJyb290Iikgew0KICAgICAgICAgICAgcmV0dXJuICR0cnVlDQogICAgICAgIH0NCiAgICAgICAgZWxzZSB7DQogICAgICAgICAgICByZXR1cm4gJGZhbHNlDQogICAgICAgIH0NCiAgICB9DQogICAgIyBXaW5kb3dzDQogICAgKE5ldy1PYmplY3QgU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NQcmluY2lwYWwgKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKSkuSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRpblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KfQoKZnVuY3Rpb24gUGxhY2UtQWxpZ25lZC1UZXh0IHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0nQ3Vyc29yJyldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlLCBQb3NpdGlvbiA9IDApXVtTdHJpbmddJFRleHQsDQogICAgICAgIFtQYXJhbWV0ZXIoUG9zaXRpb24gPSAxKV1bVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduID0gJ0NlbnRlcicsDQogICAgICAgIFtBbGlhcygiZiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRGb3JlQ29sID0gW0NvbnNvbGVdOjpGb3JlR3JvdW5kQ29sb3IsDQogICAgICAgIFtBbGlhcygiYiIpXVtTeXN0ZW0uQ29uc29sZUNvbG9yXSRCYWNrQ29sID0gW0NvbnNvbGVdOjpCYWNrR3JvdW5kQ29sb3IsDQogICAgICAgIFtpbnRdJE9mZnNldCA9IDAsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZSA9ICdDdXJzb3InKV1bQWxpYXMoIk5OTCIpXVtTd2l0Y2hdJE5vTmV3TGluZSwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lID0gJ0J1ZmZlcmVkJyldJHlQb3MgPSAwDQogICAgKQ0KICAgICRTcGFjZXM9ICIgIiooJFRleHQubGVuZ3RoLSR0ZXh0LnRyaW1TdGFydCgpLmxlbmd0aCkNCiAgICAkVGV4dCAgPSBBbGlnbi1UZXh0ICRUZXh0ICRBbGlnbg0KICAgICRGaW5hbCA9ICRTcGFjZXMrJFRleHQudHJpbVN0YXJ0KCkNCiAgICAkQ291bnQgPSAkVGV4dC5MZW5ndGgtJFRleHQuVHJpbVN0YXJ0KCkuTGVuZ3RoLSRTcGFjZXMubGVuZ3RoKyRPZmZzZXQNCiAgICBpZiAoJFBzQ21kbGV0LlBhcmFtZXRlclNldE5hbWUgLWVxICdDdXJzb3InKSB7DQogICAgICAgIFtDb25zb2xlXTo6Q3Vyc29yTGVmdCA9ICRDb3VudA0KICAgICAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JE5vTmV3TGluZSAtZiAkRm9yZUNvbCAtYiAkQmFja0NvbCAkRmluYWwNCiAgICB9IGVsc2Ugew0KICAgICAgICBQbGFjZS1CdWZmZXJlZENvbnRlbnQgJEZpbmFsIC14ICRDb3VudCAteSAkeVBvcyAtRiAkRm9yZUNvbCAtQiAkQmFja0NvbA0KICAgIH0NCn0KClNldC1BbGlhcyBjb2wgR2V0LUNvbG9yClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQ==")
# ========================================END=OF=COMPILER===========================================================|
<#
  MAJOR TODO: Create Bootstrapper using: http://stackoverflow.com/questions/18685772/how-to-set-powershell  -background-color-programmatically-to-rgb-value
#>
if (!$AP_Console.useLegacyPromptEngine -and (AP-Require "dep:oh-my-posh" -Pa)) {
    Write-APL "!","Falling back to ","*Oh-My-Posh","@ (if you want to skip this behavior, please ","+$(col i,b)`$AP_CONSOLE$(col rS).useLegacyPromptEngine","# = ","+`$true","@)"
    oh-my-posh init pwsh | Invoke-Expression
    exit
}

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
    if ($s.path.compressHome) {
        $OSDependentHome = JS-OR $env:USERPROFILE $env:HOME
        $Path = $Path.replace($OSDependentHome,"~")
    }
    $s.path.compressors.GetEnumerator() | % {$Path = $Path -Replace ([Regex]::Escape($_.Key)), $_.Value}
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

