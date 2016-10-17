param($Silent)
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
