<#
|===============================================================>|
   Flask DevTools for PShell by Apoorv Verma [AP] on 2/12/2014
|===============================================================>|
      $) Makes Custom Functions to Automate Flask Dev Activities
      $) All Instances Parameters for all Functions
      $) Tree Killing Supported for swift run/close
      $) Fast Tools like editing code, to launching server
|===============================================================>|
#>
param([ValidatePattern("..*")][Alias("Index")][Parameter(Mandatory=$true)][String]$IndexFile,[Switch]$Silent)
if (!(Test-Path $IndexFile -Type Leaf)) {throw "Index File [$IndexFile] does not exist!";exit}
$IndexFile = Resolve-Path $IndexFile
$IndexFold = Split-Path -Leaf $IndexFile\..
pushd (Split-Path $IndexFile)
try {$VFld = "$(Resolve-Path (Get-ChildItem -Directory | ? {"$((Get-ChildItem -Directory $_).name)" -match "Include.*Lib.*Scripts"})[0])"} catch {throw "Could not find flask V-Env, Run Flask-Config.ps1";exit}
$CMDs = @{"Flask-List"="
    param([Switch]`$All)
    if (`$All) {
        `$Matchs = '] Flask-Website by AP'
    } else {
        `$Matchs = [Regex]::Escape('[$IndexFold->$(Split-Path -leaf $IndexFile)]')
    }
    Get-Process powershell | ? {`$_.mainWindowTitle -match `$Matchs} | select id,mainWindowTitle
"}
$CMDs += @{"Flask-New"="
    param([Parameter(Mandatory=`$True)][ValidateSet('Template')][String]`$ObjectType,[Parameter(Mandatory=`$True)][Alias('Name')][String]`$ObjectName,[String]`$Folder)
    Flask-Pwd
    `$Fold = @{'Template'='Templates'}.`$ObjectType
    if (`$Folder) {`$Fold = `$Folder}
    if (!`$Fold) {Write-AP '!There is no resolution for `$ObjType -> Folder. Wierd!';return}
    `$ObjectName = `$ObjectName.trim()
    if (`$ObjectName -Match ""[`$([Regex]::Escape([System.IO.Path]::InvalidPathChars -join ''))]"") {Write-AP '!Invalid File name!';return}
    if (!(Test-Path -type container `$Fold)) {Write-AP ""!Can't find the [`$Fold] folder"";return}
    if (Test-Path -type leaf ""`$Fold\`$ObjectName"") {Write-AP ""!`$ObjectType [`$ObjectName] already exists"";return}
    if (`$ObjectName -notMatch ""\.(\w){2,4}$"") {`$ObjectName = ""`$ObjectName.html""}
    Touch ""`$Fold\`$ObjectName""
    notepad ""`$Fold\`$ObjectName""
    popd
"}
$CMDs += @{"Flask-Pwd"="pushd ""$Pwd"""}
$CMDs += @{"Flask-Fix"="
    Flask-Pwd
    Flask-Activate
    `$Rand = Get-Random
    :A While (`$True) {
        `$Killer = start -windowstyle hidden powershell 'sleep -s 2;Stop-Process -name python' -passthru
        python '$IndexFile' 2>""`$Rand-Fix.data""
        try {`$Killer.Kill()} catch {}
        `$a = [IO.File]::ReadAllLines(""`$PWD\`$Rand-Fix.data"")
        del ""`$PWD\`$Rand-Fix.data""
        `$a = ""`$a""
        while (`$a -match ""ImportError: No module named (?<Module>\w+)"") {
            Write-AP ""!Found Missing Module [`$(`$Matches['Module'])]""
            Flask-AddPackage `$Matches['Module'] -ShowFinal -Silent
            continue A
        }
        break
    }
    Deactivate
    popd
"}
$CMDs += @{"Flask-Edit"="
    param([Switch]`$Idle)
    if (`$IDLE -and (`$Function:Idle)) {
        Idle '$IndexFile'
    } else {
        Notepad '$IndexFile'
    }
"}
$CMDs += @{"Flask-AddPackage"="
    param([Parameter(Mandatory=`$true)][String]`$Package='',[Switch]`$Silent,[Switch]`$ShowFinal,[int]`$Tab=0)
    `$tb = ('>'*`$Tab)
    if (!`$Package.trim()) {throw 'Invalid Package'}
    if (!`$Function:Deactivate) {if (!`$Silent) {Write-AP ""`$tb*Loading Virtual-Env""};`$Script:RemoveDevAddPKG = `$True;Flask-Activate}
    `$name = `$_ -replace ""\=.*""
    if (!`$Silent) {Write-AP ""`$tb*Getting Package [`$Package]""}
    `$a = & ""$VFld\Scripts\pip"" install `$Package
    `$b = `$a -match ""^Successfully installed (?<Modules>.*)""
    if (`$b) {
        `$b | % {if (!`$Silent -or `$ShowFinal) {write-AP ""`$tb>+`$_""}}
    } elseif (`$a -match 'Requirement already satisfied') {
        if (!`$Silent -or `$ShowFinal) {Write-AP ""`$tb>!Package [`$Package] Already Installed""}
    } else {
        if (!`$Silent -or `$ShowFinal) {Write-AP ""`$tb>-Failed to Install [`$Package]""}
    }
    if (`$RemoveDevAddPKG) {try{deactivate}catch{};rv RemoveDevAddPKG -scope script}
"}
$CMDs += @{"Flask-Check"="
param([Switch]`$All)
return [bool](Flask-List -All:`$All)
"}
$CMDs += @{"Flask-RemoveTools"="ls Function:\Flask-* | del"}
$CMDs += @{"Flask-Activate"="
    if (!`$Function:Deactivate) {& '$VFLD\Scripts\activate.ps1'}
"}
$CMDs += @{"Flask-Close"="
param([Switch]`$All)
if (!(Flask-Check -All:`$All)) {return}
(Flask-List -All:`$All).ID | % {
    `$Child = Find-ChildProcess `$_
    Write-host -f 2 [+] Killing ``#`$_
    Stop-Process `$_
    `$Child.id | % {
        Stop-Process `$_
        Write-host -f 2 '    [+]'Killing Child Process ``#`$_
    }
}"}
$Cmds.Keys | % {
    iex "function Global:$_ { $($CMDS.$_) }"
}
$CMD = @{"Flask-Host"="
function Flask-Check {
    ${Function:Flask-Check}
}
function Find-ChildProcess {
    ${Function:Find-ChildProcess}
}
function Flask-List {
    ${Function:Flask-List}
}
function Flask-Close {
    ${Function:Flask-Close}
}
Flask-Close
& '$VFLD\Scripts\activate.ps1'
[Console]::Title = '[$IndexFold->$(Split-Path -leaf $IndexFile)] Flask-Website by AP'
[Console]::SetWindowSize(75,5);[Console]::SetBufferSize(75,100);cmd /c color 4f
pushd (Split-Path '$IndexFile')
while (`$True) {python '$indexFile'};pause;popd"}
$CMD += @{"Flask-Update"=$CMD."Flask-Host"}
$Cmd.Keys | % {
    $a = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($CMD.$_))
    iex "function Global:$_ { start 'powershell' '-EncodedCommand $a' }"
}
if (!$Silent) {
    Write-AP "*Following Commands will let you command your Website!"
    Write-AP ">*Flask-Host        : Runs the Website"
    Write-AP ">*Flask-Edit        : Opens Notepad to edit index file for website"
    Write-AP ">*Flask-Update      : Updates the Website with new changes"
    Write-AP ">*Flask-Check       : Checks for any instance of currently running website"
    Write-AP ">*Flask-Activate    : Activates virtual environment for flask website"
    Write-AP ">*Flask-List        : Lists any instances of currently running website"
    Write-AP ">*Flask-New         : Helps create a new Flask related file/object"
    Write-AP ">*Flask-Pwd         : Pushd's into Flask Root Folder"
    Write-AP ">*Flask-Close       : Closes any instances of the website"
    Write-AP ">*Flask-Fix         : Fixes your current instance [adds modules automatically]"
    Write-AP ">*Flask-AddPackage  : Adds a package to website specific python instance"
    Write-AP ">*Flask-RemoveTools : Removes all flask modules"
    Write-AP "*Param [-all shows all AP-Flask Inst]"
}
rv cmd,cmds,index*
popd
