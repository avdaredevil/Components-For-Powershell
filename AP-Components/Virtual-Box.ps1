param([Switch]$Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")

    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))
}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQWRkLVRvUGF0aCB7cGFyYW0oW1ZhbGlkYXRlUGF0dGVybigiLisiKV1bU3RyaW5nXSRGb2xkZXIgPSAkUFdELCBbQWxpYXMoInAiLCJwcmUiLCJiYWNrIildW3N3aXRjaF0kUHJlcGVuZCwgW1N3aXRjaF0kVHJ5LCBbU3dpdGNoXSRGb3JjZSwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgIHRyeSB7DQogICAgICAgIGlmICghJEZvcmNlKSB7dHJ5IHskRm9sZGVyID0gUmVzb2x2ZS1QYXRoICRGb2xkZXIgLUVycm9yQWN0aW9uIFN0b3B9IGNhdGNoIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBGb2xkZXIgWyRGb2xkZXJdIERvZXMgbm90IEV4aXN0In19DQogICAgICAgIGlmICghJEZvcmNlIC1hbmQgKFRlc3QtUGF0aCAkZm9sZGVyIC10eXBlIGxlYWYpKSB7VGhyb3cgIltBUC1QYXRoOkFkZF0gSW5wdXQgWyRGb2xkZXJdIG11c3QgYmUgYSBmb2xkZXIhIn0NCiAgICAgICAgaWYgKCRGb2xkZXIgLWluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHtyZXR1cm59DQogICAgICAgICRQdGggPSBjYXQgZW52OlwkUGF0aFZhcg0KICAgICAgICBpZiAoISRQcmVwZW5kKSB7JFB0aCArPSAiOyRGb2xkZXIifSBlbHNlIHskUHRoID0gIiRGb2xkZXI7JCgkUHRoKSJ9DQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfSBjYXRjaCB7DQogICAgICAgIGlmICgkVHJ5KSB7cmV0dXJufQ0KICAgICAgICBUaHJvdyAkXw0KICAgIH0NCn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKU2V0LUFsaWFzIEEyUGF0aCBBZGQtVG9QYXRo")
# ========================================END=OF=COMPILER===========================================================|

$PyD = @((item C:\Program*\Oracle\VirtualBox,C:\AP-Progs\Virtua*Box).FullName)[-1]
if (!$PyD) {Throw "VirtualBox Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Virtual-Box [$(vbox-img.exe -v)] for AP-PShell Management Console!"}
rv PYD
