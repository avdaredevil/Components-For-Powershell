param([Switch]$Silent)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.3] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gR2V0LVBhdGgge3BhcmFtKCRtYXRjaCwgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIikNCg0KICAgICRQdGggPSBbRW52aXJvbm1lbnRdOjpHZXRFbnZpcm9ubWVudFZhcmlhYmxlKCRQYXRoVmFyKQ0KICAgICRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ig0KICAgICRQYXRoU2VwID0gJChpZiAoJElzVW5peCkgeyI6In0gZWxzZSB7IjsifSkNCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQ0KICAgIFNldC1QYXRoICRQdGggLVBhdGhWYXIgJFBhdGhWYXINCiAgICAkZCA9ICgkUHRoKS5zcGxpdCgkUGF0aFNlcCkNCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9DQp9CgpmdW5jdGlvbiBBZGQtVG9QYXRoIHtwYXJhbShbVmFsaWRhdGVQYXR0ZXJuKCIuKyIpXVtTdHJpbmddJEZvbGRlciA9ICRQV0QsIFtBbGlhcygicCIsInByZSIsImJhY2siKV1bc3dpdGNoXSRQcmVwZW5kLCBbU3dpdGNoXSRUcnksIFtTd2l0Y2hdJEZvcmNlLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiKQ0KDQogICAgdHJ5IHsNCiAgICAgICAgaWYgKCEkRm9yY2UpIHt0cnkgeyRGb2xkZXIgPSBSZXNvbHZlLVBhdGggJEZvbGRlciAtRXJyb3JBY3Rpb24gU3RvcH0gY2F0Y2gge1Rocm93ICJbQVAtUGF0aDpBZGRdIEZvbGRlciBbJEZvbGRlcl0gRG9lcyBub3QgRXhpc3QifX0NCiAgICAgICAgaWYgKCEkRm9yY2UgLWFuZCAoVGVzdC1QYXRoICRmb2xkZXIgLXR5cGUgbGVhZikpIHtUaHJvdyAiW0FQLVBhdGg6QWRkXSBJbnB1dCBbJEZvbGRlcl0gbXVzdCBiZSBhIGZvbGRlciEifQ0KICAgICAgICBpZiAoJEZvbGRlciAtaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkge3JldHVybn0NCiAgICAgICAgJFB0aCA9IGNhdCBlbnY6XCRQYXRoVmFyDQogICAgICAgIGlmICghJFByZXBlbmQpIHskUHRoICs9ICI7JEZvbGRlciJ9IGVsc2UgeyRQdGggPSAiJEZvbGRlcjskKCRQdGgpIn0NCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKCRUcnkpIHtyZXR1cm59DQogICAgICAgIFRocm93ICRfDQogICAgfQ0KfQoKU2V0LUFsaWFzIEEyUGF0aCBBZGQtVG9QYXRo")))
# ========================================END=OF=COMPILER===========================================================|

$PyD = @((item C:\Program*\Oracle\VirtualBox,C:\AP-Progs\Virtua*Box).FullName)[-1]
if (!$PyD) {Throw "VirtualBox Does not Exist on System!";exit}
A2Path $PyD
if (!$Silent) {Write-AP-Wrapper "+Configured Virtual-Box [$(vbox-img.exe -v)] for AP-PShell Management Console!"}
rv PYD
