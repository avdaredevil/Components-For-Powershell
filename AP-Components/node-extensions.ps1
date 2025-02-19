param($Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.2) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
$Script:AP_Console = @{version=[version]'1.2'; isShim = $true}
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSBbY29uc29sZV06OkJ1ZmZlcldpZHRoDQogICAgICAgICRDbGVhblRleHRTaXplID0gKFN0cmlwLUNvbG9yQ29kZXMgKCIiKyRUZXh0KSkuTGVuZ3RoDQogICAgICAgIGlmICgkQ2xlYW5UZXh0U2l6ZSAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oJENsZWFuVGV4dFNpemUtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiAgICAgICAgICAgICAgICAjICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBDbGVhci1MaW5lIHsNCiAgICAkTm0gPSBbQ29uc29sZV06OldpbmRvd1dpZHRoDQogICAgJHQgPSBbQ29uc29sZV06OkN1cnNvclRvcDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZSAoIiAiKiROTSkNCiAgICBbQ29uc29sZV06OkN1cnNvclRvcD0kdDtbQ29uc29sZV06OkN1cnNvckxlZnQ9MA0KfQoKZnVuY3Rpb24gR2V0LUVzY2FwZSB7DQogICAgaWYgKCEoQVAtUmVxdWlyZSAiYWJpbGl0eTplc2NhcGVfY29kZXMiKSkge3Rocm93ICJbR2V0LVJCR10gWW91ciBjb25zb2xlIGRvZXMgbm90IHN1cHBvcnQgQU5TSSBlc2NhcGUgY29kZXMifQ0KICAgIHJldHVybiBbQ2hhcl0weDFiICMgYGUNCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIHBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkV1JJVEVfQVBfTEVHQUNZX0NPTE9SUyl7M31lbHNleydCbHVlJ30pDQogICAgICAgIGlmICgkVFQuY291bnQgLWVxIDEpIHskVFQgPSAkVFRbMF19OyRUZXh0ID0gJFRUDQogICAgICAgIGlmICgkdGV4dC5jb3VudCAtZ3QgMSAtb3IgJHRleHQuR2V0VHlwZSgpLk5hbWUgLW1hdGNoICJcW1xdJCIpIHsNCiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ID8geyIkXyJ9IHwgJSB7DQogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPltcK1wtXCFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICR0YiAgPSAiICAgICIqJE1hdGNoZXMudC5sZW5ndGgNCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgICAgIGlmICghJENvbCkge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgICAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm59DQogICAgICAgIGlmIChBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiAtcGEpIHsNCiAgICAgICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIH0NCiAgICAgICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgICAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICREYXRhfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFN0cmlwLUNvbG9yQ29kZXMge3BhcmFtKCRTdHIpDQoNCiAgICAkU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9DQp9CgpmdW5jdGlvbiBMb2FkaW5nLU1lc3NhZ2Ugew0KICAgIFtDbWRsZXRCaW5kaW5nKCldcGFyYW0oW1N0cmluZ10kVGV4dCA9ICJMb2FkaW5nIiwgW2NoYXJdJGMgPSAnLicsW0FsaWFzKCJDeWNsZXMiLCJDeWNsZXNQZXJCdWZmZXIiKV1bZGVjaW1hbF0kQ1BCPTEyNTAwLFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9JFRydWUpXSREYXRhU3RyZWFtLFtTd2l0Y2hdJE91dE51bGwpDQogICAgQmVnaW4geyRCUCA9IFtDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZTtbQ29uc29sZV06OkN1cnNvclZpc2libGUgPSAkRmFsc2U7JERvdCA9ICIiOyRDVCA9IDA7JENQQl9Ob3JtPVtNYXRoXTo6TWF4KCRDUEIsMSk7V3JpdGUtSG9zdCAtZiBZZWxsb3cgLU5vTmV3TGluZSAkVGV4dDtpZiAoJENQQiAtbHQgMCkge3Rocm93ICJWYWx1ZSBvZiBDUEIgY2Fubm90IGJlIGxlc3MtdGhhbi1vci1lcSB0byAwLiI7cmV0dXJufX0NCiAgICBQcm9jZXNzIHsNCiAgICAgICAgMS4uW01hdGhdOjpNYXgoKDEvJENQQiksMSkgfCAlIHsNCiAgICAgICAgICAgICRMRCA9ICREb3QNCiAgICAgICAgICAgICREb3QgPSAiICRjIiooW1N5c3RlbS5NYXRoXTo6Rmxvb3IoJENULyRDUEJfTm9ybSklNCkNCiAgICAgICAgICAgIGlmICgkRG90IC1uZSAkTEQpIHsNCiAgICAgICAgICAgICAgICBbQ29uc29sZV06OkN1cnNvckxlZnQgPSAkVGV4dC5MZW5ndGg7V3JpdGUtSG9zdCAtZiBZZWxsb3cgLU5vTmV3TGluZSAiJERvdCQoIiAiKig2LSREb3QuTGVuZ3RoKSkiDQogICAgICAgICAgICB9DQogICAgICAgICAgICAkQ1QrKw0KICAgICAgICAgICAgaWYgKCRDUEIgLWx0IDEpIHtzbGVlcCAtbSAyMDB9DQogICAgICAgIH0NCiAgICAgICAgaWYgKCEkT3V0TnVsbCkgeyREYXRhU3RyZWFtfQ0KICAgIH0NCiAgICBFTkQge1tDb25zb2xlXTo6Q3Vyc29yVmlzaWJsZSA9ICRCcDtydiBET1QsQ1Q7Q2xlYXItTGluZX0NCn0KCmZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykge2lmICghJGEpIHtjb250aW51ZX07aWYgKCRhLkdldFR5cGUoKS5OYW1lIC1lcSAiU2NyaXB0QmxvY2siKSB7JGEgPSAkYS5pbnZva2UoKTtpZiAoISRhKXtjb250aW51ZX19O3JldHVybiAkYX19CgpmdW5jdGlvbiBBZGQtVG9QYXRoIHtwYXJhbShbVmFsaWRhdGVQYXR0ZXJuKCIuKyIpXVtTdHJpbmddJEZvbGRlciA9ICRQV0QsIFtBbGlhcygicCIsInByZSIsImJhY2siKV1bc3dpdGNoXSRQcmVwZW5kLCBbU3dpdGNoXSRUcnksIFtTd2l0Y2hdJEZvcmNlLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgdHJ5IHsNCiAgICAgICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgICAgIGlmICghJEZvcmNlKSB7dHJ5IHskRm9sZGVyID0gUmVzb2x2ZS1QYXRoICRGb2xkZXIgLUVycm9yQWN0aW9uIFN0b3B9IGNhdGNoIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBGb2xkZXIgWyRGb2xkZXJdIERvZXMgbm90IEV4aXN0In19DQogICAgICAgIGlmICghJEZvcmNlIC1hbmQgKFRlc3QtUGF0aCAkZm9sZGVyIC10eXBlIGxlYWYpKSB7VGhyb3cgIltBUC1QYXRoOkFkZF0gSW5wdXQgWyRGb2xkZXJdIG11c3QgYmUgYSBmb2xkZXIhIn0NCiAgICAgICAgaWYgKCRGb2xkZXIgLWluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHtyZXR1cm59DQogICAgICAgICRQdGggPSBHZXQtQ29udGVudCBlbnY6XCRQYXRoVmFyDQogICAgICAgICRGb2xkZXJTZXAgPSAkKGlmICgkSXNVbml4KSB7Ii8ifSBlbHNlIHsiXCJ9KQ0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgICRGb2xkZXIgPSAkRm9sZGVyWzBdICsgJEZvbGRlci5TdWJzdHJpbmcoMSkuVHJpbUVuZCgkRm9sZGVyU2VwKQ0KICAgICAgICBpZiAoISRQcmVwZW5kKSB7JFB0aCArPSAiJFBhdGhTZXAkRm9sZGVyIn0gZWxzZSB7JFB0aCA9ICIkRm9sZGVyJFBhdGhTZXAkKCRQdGgpIn0NCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKCRUcnkpIHtyZXR1cm59DQogICAgICAgIFRocm93ICRfDQogICAgfQ0KfQoKZnVuY3Rpb24gU2V0LVBhdGggew0KICAgIFtjbWRsZXRiaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5ID0gJHRydWUsIFZhbHVlRnJvbVBpcGVsaW5lID0gJHRydWUpXVtzdHJpbmdbXV0kUGF0aCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoDQogICAgfQ0KICAgIHByb2Nlc3Mgew0KICAgICAgICAkUGF0aCB8ICUgew0KICAgICAgICAgICAgJEZpbmFsUGF0aCArPSAkXw0KICAgICAgICB9DQogICAgfQ0KICAgIGVuZCB7DQogICAgICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgICRQdGggPSAkRmluYWxQYXRoIC1qb2luICRQYXRoU2VwDQogICAgICAgICRQdGggPSAoJFB0aCAtcmVwbGFjZSgiJFBhdGhTZXArIiwgJFBhdGhTZXApIC1yZXBsYWNlKCJcXCRQYXRoU2VwfFxcJCIsICRQYXRoU2VwKSkudHJpbSgkUGF0aFNlcCkNCiAgICAgICAgJFB0aCA9ICgoJFB0aCkuc3BsaXQoJFBhdGhTZXApIHwgc2VsZWN0IC11bmlxdWUpIC1qb2luICRQYXRoU2VwDQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNCb3VuZFBhcmFtZXRlcnMuQ29udGFpbnNLZXkoJ1ZlcmJvc2UnKSAtb3IgJFBTQm91bmRQYXJhbWV0ZXJzLkNvbnRhaW5zS2V5KCdEZWJ1ZycpDQogICAgJFdoZXJlQmluRXhpc3RzID0gR2V0LUNvbW1hbmQgIndoZXJlIiAtZWEgU2lsZW50bHlDb250aW51ZQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30NCiAgICBpZiAoJFdoZXJlQmluRXhpc3RzIC1hbmQgISRNYW51YWxTY2FuKSB7DQogICAgICAgICRPdXQ9JG51bGwNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRPdXQgPSB3aGljaCAkZmlsZSAyPiRudWxsDQogICAgICAgIH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQ0KICAgICAgICANCiAgICAgICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgICAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQ0KICAgIH0NCiAgICBmb3JlYWNoICgkRm9sZGVyIGluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHsNCiAgICAgICAgaWYgKCRJc1VuaXgpIHsNCiAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSINCiAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aA0KICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgZm9yZWFjaCAoJEV4dGVuc2lvbiBpbiAoR2V0LVBhdGggLVBhdGhWYXIgUEFUSEVYVCkpIHsNCiAgICAgICAgICAgICAgICAkTG9va3VwID0gIiRGb2xkZXIvJEZpbGUkRXh0ZW5zaW9uIg0KICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQ0KICAgICAgICAgICAgICAgIGlmICghKFRlc3QtUGF0aCAtUGF0aFR5cGUgTGVhZiAkTG9va3VwKSkge2NvbnRpbnVlfQ0KICAgICAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KDQogICAgJFBhdGhTZXAgPSBbSU8uUGF0aF06OkRpcmVjdG9yeVNlcGFyYXRvckNoYXINCiAgICByZXR1cm4gJFBhdGggLXJlcGxhY2UgDQogICAgICAgICI8RGVwPiIsIjxMaWI+JHtQYXRoU2VwfURlcGVuZGVuY2llcyIgLXJlcGxhY2UgDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlIA0KICAgICAgICAiPENvbXAob25lbnRzKT8+IiwiPEhvbWU+JHtQYXRoU2VwfUFQLUNvbXBvbmVudHMiIC1yZXBsYWNlIA0KICAgICAgICAiPEhvbWU+IiwkUFNIZWxsfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bQXJndW1lbnRDb21wbGV0ZXIoew0KICAgIFtPdXRwdXRUeXBlKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW3N0cmluZ10gJENvbW1hbmROYW1lLA0KICAgICAgICBbc3RyaW5nXSAkUGFyYW1ldGVyTmFtZSwNCiAgICAgICAgW3N0cmluZ10gJFdvcmRUb0NvbXBsZXRlLA0KICAgICAgICBbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5MYW5ndWFnZS5Db21tYW5kQXN0XSAkQ29tbWFuZEFzdCwNCiAgICAgICAgW1N5c3RlbS5Db2xsZWN0aW9ucy5JRGljdGlvbmFyeV0gJEZha2VCb3VuZFBhcmFtZXRlcnMNCiAgICApDQogICAgJENvbXBsZXRpb25SZXN1bHRzID0gW1N5c3RlbS5Db2xsZWN0aW9ucy5HZW5lcmljLkxpc3RbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XV06Om5ldygpDQogICAgJExpYiA9IEAoIkludGVybmV0Iiwib3M6d2luZG93cyIsIm9zOmxpbnV4Iiwib3M6dW5peCIsImFkbWluaXN0cmF0b3IiLCJyb290IiwibGliOiIsImxpYl90ZXN0OiIsImZ1bmN0aW9uOiIsInN0cmljdF9mdW5jdGlvbjoiLCJhYmlsaXR5OmVzY2FwZV9jb2RlcyIsImFiaWxpdHk6ZW1vamlzIikNCiAgICBKUy1PUiB7JExpYiB8ID8geyRfIC1saWtlICIkV29yZFRvQ29tcGxldGUqIn19IHskTGliIHwgPyB7JF8gLWxpa2UgIiokV29yZFRvQ29tcGxldGUqIn19IHwgJSB7DQogICAgICAgICRDb21wbGV0aW9uUmVzdWx0cy5BZGQoW1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uQ29tcGxldGlvblJlc3VsdF06Om5ldygkXywgJF8sICdQYXJhbWV0ZXJWYWx1ZScsICRfKSkNCiAgICB9DQogICAgcmV0dXJuICRDb21wbGV0aW9uUmVzdWx0cw0KfSldW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbCwgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICAkTG9hZE1vZHVsZSA9IHsNCiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkNCiAgICAgICAgdHJ5IHtJbXBvcnQtTW9kdWxlICRGaWxlIC1lYSBzdG9wO3JldHVybiAxfSBjYXRjaCB7fQ0KICAgICAgICAkTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7JExGID0gIiRMaWJcJEZpbGUiDQogICAgICAgIFtzdHJpbmddJGYgPSBpZih0ZXN0LXBhdGggLXQgbGVhZiAkTEYpeyRMRn1lbHNlaWYodGVzdC1wYXRoIC10IGxlYWYgIiRMRi5kbGwiKXsiJExGLmRsbCJ9DQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHtJbXBvcnQtTW9kdWxlICRmfQ0KICAgICAgICByZXR1cm4gJGYNCiAgICB9DQogICAgJEludm9rZU9yUmV0dXJuID0gew0KICAgICAgICBwYXJhbSgkQ21kKQ0KICAgICAgICBpZiAoJENtZCAtaXMgW1NjcmlwdEJsb2NrXSkgeyYgJENtZH0gZWxzZSB7JENtZH0NCiAgICB9DQogICAgaWYgKCEkT25GYWlsKSB7JFBhc3NUaHJ1ID0gJHRydWV9DQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQkIiAgICAgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXm9zOih3aW4oZG93cyk/fGxpbnV4fHVuaXgpJCIgeyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IjtpZiAoJE1hdGNoZXNbMV0gLW1hdGNoICJed2luIikgeyEkSXNVbml4fSBlbHNlIHskSXNVbml4fX0NCiAgICAgICAgIl5hZG1pbihpc3RyYXRvcik/JHxecm9vdCQiICAgIHtUZXN0LUFkbWluaXN0cmF0b3J9DQogICAgICAgICJeZGVwOiguKikkIiAgICAgICAgICAgICAgICAgICB7R2V0LVdoZXJlICRNYXRjaGVzWzFdfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKTooLiopJCIgICAgICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSwgJHRydWUpfQ0KICAgICAgICAiXihsaWJ8bW9kdWxlKV90ZXN0OiguKikkIiAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSQiICAgICAgICAgICAgICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopJCIgICAgICAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICAgICAgIl5hYmlsaXR5Oihlc2NhcGVfY29kZXN8ZW1vamlzKSQiICAgICB7JiAkSW52b2tlT3JSZXR1cm4gKEB7DQogICAgICAgICAgICBlc2NhcGVfY29kZXMgPSAkSG9zdC5VSS5TdXBwb3J0c1ZpcnR1YWxUZXJtaW5hbA0KICAgICAgICAgICAgZW1vamlzID0gJGVudjpXVF9TRVNTSU9OIC1vciAkZW52OldUX1BST0ZJTEVfSUQNCiAgICAgICAgfVskTWF0Y2hlc1sxXV0pfQ0KICAgICAgICBkZWZhdWx0IHtXcml0ZS1BUCAiIUludmFsaWQgc2VsZWN0b3IgcHJvdmlkZWQgWyQoIiRMaWIiLnNwbGl0KCc6JylbMF0pXSI7dGhyb3cgJ0JBRF9TRUxFQ1RPUid9DQogICAgfSkNCiAgICBpZiAoISRTdGF0IC1hbmQgJE9uRmFpbCkgeyYgJE9uRmFpbH0NCiAgICBpZiAoJFBhc3NUaHJ1IC1vciAhJE9uRmFpbCkge3JldHVybiAkU3RhdH0NCn0KCmZ1bmN0aW9uIFRlc3QtQWRtaW5pc3RyYXRvciB7DQogICAgaWYgKCRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiKSB7DQogICAgICAgIGlmICgkKHdob2FtaSkgLWVxICJyb290Iikgew0KICAgICAgICAgICAgcmV0dXJuICR0cnVlDQogICAgICAgIH0NCiAgICAgICAgZWxzZSB7DQogICAgICAgICAgICByZXR1cm4gJGZhbHNlDQogICAgICAgIH0NCiAgICB9DQogICAgIyBXaW5kb3dzDQogICAgKE5ldy1PYmplY3QgU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NQcmluY2lwYWwgKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKSkuSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRpblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KfQoKU2V0LUFsaWFzIEEyUGF0aCBBZGQtVG9QYXRo")
# ========================================END=OF=COMPILER===========================================================|

$PyD = @((item C:\Node*Extensions,C:\AP-Langs\Node*Extensions -ea SilentlyContinue).FullName)[-1]
if (!$PyD) {Throw "NodeExtentions Does not Exist on System (In: 'C:\' or 'C:\AP-Langs')!";exit}
$Out = @("+Configured Node-Extensions for AP-PShell Management Console!")
ls -Dir "$PyD" | % {
    $Out += "x>*Added [","nsx+$_","ns*] as an extension"
    $PKG = $_.FullName;if (Test-Path "$PKG\bin") {$PKG = "$PKG\bin"}
    A2Path $PKG
}
if (AP-Require "dep:nw" -PassThru) {
    $Out += "x>*Configuring ","nx!Node Webkit","n* functions:"
    $Out += "x>>*Functions Added [","nx+NW-Package-App","n*]"
    function Global:NW-Package-App($Dir=".",$BinaryName = "app") {
        $SIG = "x!","nx#NW-Package-App: "
        if (!(AP-Require "function:Get-Where" -PassThru)) {Write-AP-Wrapper $SIG,"n!Cannot finalize binary without [Get-Where]";return}
        if (!(AP-Require "dep:7z" -PassThru)) {Write-AP-Wrapper $SIG,"n!Cannot compress app without 7z";return}
        pushd $Dir
        if (!(Test-Path -type leaf "package.json")) {popd;Write-AP-Wrapper $SIG,"nx!Required File [","nx+package.json","n!] is missing";return}
        $JSON = cat .\package.json | ConvertFrom-Json
        Write-AP-Wrapper "x*Creating nw binary for ","nx!$($JSON.name)","nx* [","nx+$($JSON.version)","n*]:"
        $PKG = @{file="app-package.nw";path=$(Split-Path $JSON.main);other=$JSON.include_dirs}
        if ($PKG.other -and $PKG.other.length) {Write-AP-Wrapper "x>*Including Folder: ",(($PKG.other | % {"nx!$_"}) -join "|nx*, |").split("|"),"n*."}
        rm $PKG.file -ea SilentlyContinue
        if (!$PKG.path) {Write-AP-Wrapper ">!No package path defined...";return}
        if (!(test-path -type container $PKG.path)) {Write-AP-Wrapper "x>!Could not access package path [","nx+$($PKG.path)","n!]";return}
        $s7z = "7z a -ssw -tzip '$($PKG.file)' package.json '$($PKG.path)' $(($PKG.Other | % {"'$_'"}) -join " ")"
        iex $s7z | Loading-Message "    Compressing App" -CPB 100 | Out-Null
        $NodeWeb = Split-Path (Get-Where nw)
        iex "cmd /c copy /b '$(Join-Path $NodeWeb nw.exe)'+'$($PKG.file)' '$BinaryName.exe'" | Out-Null
        rm $PKG.file -ea SilentlyContinue
        Write-AP-Wrapper ">+Created Binary - $BinaryName.exe"
        popd
    }
}
if (!$Silent) {Write-AP-Wrapper $Out}
rv PYD

