param([Switch]$Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.4] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gQWRkLVRvUGF0aCB7cGFyYW0oW1ZhbGlkYXRlUGF0dGVybigiLisiKV1bU3RyaW5nXSRGb2xkZXIgPSAkUFdELCBbQWxpYXMoInAiLCJwcmUiLCJiYWNrIildW3N3aXRjaF0kUHJlcGVuZCwgW1N3aXRjaF0kVHJ5LCBbU3dpdGNoXSRGb3JjZSwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgIHRyeSB7DQogICAgICAgIGlmICghJEZvcmNlKSB7dHJ5IHskRm9sZGVyID0gUmVzb2x2ZS1QYXRoICRGb2xkZXIgLUVycm9yQWN0aW9uIFN0b3B9IGNhdGNoIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBGb2xkZXIgWyRGb2xkZXJdIERvZXMgbm90IEV4aXN0In19DQogICAgICAgIGlmICghJEZvcmNlIC1hbmQgKFRlc3QtUGF0aCAkZm9sZGVyIC10eXBlIGxlYWYpKSB7VGhyb3cgIltBUC1QYXRoOkFkZF0gSW5wdXQgWyRGb2xkZXJdIG11c3QgYmUgYSBmb2xkZXIhIn0NCiAgICAgICAgaWYgKCRGb2xkZXIgLWluIChHZXQtUGF0aCAtUGF0aFZhciAkUGF0aFZhcikpIHtyZXR1cm59DQogICAgICAgICRQdGggPSBHZXQtQ29udGVudCBlbnY6XCRQYXRoVmFyDQogICAgICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICAgICAkUGF0aFNlcCA9ICQoaWYgKCRJc1VuaXgpIHsiOiJ9IGVsc2UgeyI7In0pDQogICAgICAgIGlmICghJFByZXBlbmQpIHskUHRoICs9ICIkUGF0aFNlcCRGb2xkZXIifSBlbHNlIHskUHRoID0gIiRGb2xkZXIkUGF0aFNlcCQoJFB0aCkifQ0KICAgICAgICBbRW52aXJvbm1lbnRdOjpTZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyLCAkUHRoKQ0KICAgIH0gY2F0Y2ggew0KICAgICAgICBpZiAoJFRyeSkge3JldHVybn0NCiAgICAgICAgVGhyb3cgJF8NCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgJFBhdGhTZXAgPSAkKGlmICgkSXNVbml4KSB7IjoifSBlbHNlIHsiOyJ9KQ0KICAgIGlmICghJFB0aCkge3JldHVybiBAKCl9DQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhcg0KICAgICRkID0gKCRQdGgpLnNwbGl0KCRQYXRoU2VwKQ0KICAgIGlmICgkbWF0Y2gpIHskZCAtbWF0Y2ggJG1hdGNofSBlbHNlIHskZH0NCn0KClNldC1BbGlhcyBBMlBhdGggQWRkLVRvUGF0aA==")
# ========================================END=OF=COMPILER===========================================================|

$PyD = @((item C:\Program*\Oracle\VirtualBox,C:\AP-Progs\Virtua*Box).FullName)[-1]
if (!$PyD) {Throw "VirtualBox Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Virtual-Box [$(vbox-img.exe -v)] for AP-PShell Management Console!"}
rv PYD
