param([Switch]$Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.5] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")
    [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
# This syntax is to prevent AV's from misclassifying this as anything but innocuous
& (Get-Alias iex) (B64 "ZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBBZGQtVG9QYXRoIHtwYXJhbShbVmFsaWRhdGVQYXR0ZXJuKCIuKyIpXVtTdHJpbmddJEZvbGRlciA9ICRQV0QsIFtBbGlhcygicCIsInByZSIsImJhY2siKV1bc3dpdGNoXSRQcmVwZW5kLCBbU3dpdGNoXSRUcnksIFtTd2l0Y2hdJEZvcmNlLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgdHJ5IHsNCiAgICAgICAgaWYgKCEkRm9yY2UpIHt0cnkgeyRGb2xkZXIgPSBSZXNvbHZlLVBhdGggJEZvbGRlciAtRXJyb3JBY3Rpb24gU3RvcH0gY2F0Y2gge1Rocm93ICJbQVAtUGF0aDpBZGRdIEZvbGRlciBbJEZvbGRlcl0gRG9lcyBub3QgRXhpc3QifX0NCiAgICAgICAgaWYgKCEkRm9yY2UgLWFuZCAoVGVzdC1QYXRoICRmb2xkZXIgLXR5cGUgbGVhZikpIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBJbnB1dCBbJEZvbGRlcl0gbXVzdCBiZSBhIGZvbGRlciEifQ0KICAgICAgICBpZiAoJEZvbGRlciAtaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkge3JldHVybn0NCiAgICAgICAgJFB0aCA9IEdldC1Db250ZW50IGVudjpcJFBhdGhWYXINCiAgICAgICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICAgICAgaWYgKCEkUHJlcGVuZCkgeyRQdGggKz0gIiRQYXRoU2VwJEZvbGRlciJ9IGVsc2UgeyRQdGggPSAiJEZvbGRlciRQYXRoU2VwJCgkUHRoKSJ9DQogICAgICAgIFtFbnZpcm9ubWVudF06OlNldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIsICRQdGgpDQogICAgfSBjYXRjaCB7DQogICAgICAgIGlmICgkVHJ5KSB7cmV0dXJufQ0KICAgICAgICBUaHJvdyAkXw0KICAgIH0NCn0KClNldC1BbGlhcyBBMlBhdGggQWRkLVRvUGF0aA==")
# ========================================END=OF=COMPILER===========================================================|

$PyD = @((item C:\Program*\Oracle\VirtualBox,C:\AP-Progs\Virtua*Box).FullName)[-1]
if (!$PyD) {Throw "VirtualBox Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Virtual-Box [$(vbox-img.exe -v)] for AP-PShell Management Console!"}
rv PYD
