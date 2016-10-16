[Click here](../readme.md) to go back.

## Examples for **Components-For-Powershell**
### Simple single attach:
>
```powershell
PS> cc py
[+] Configured Python[2.7] for AP-PShell Management Console!
```
```powershell
PS> cc py 3
[+] Configured Python[3.5] for AP-PShell Management Console!
```
_**Note**: The tool will remap your **path**, so that 2.7 entries will be removed before 3.5 entries are added_

### Multi Attach:
>
```powershell
PS> cc c,r,bower
[+] Configured C for AP-PShell Management Console!
[+] Configured R-Lang[i386] for AP-PShell Management Console!
[*] Added Bower Friendly functions [Polymer-Add, Polymer-Remove, Polymer-Paper]
```
```powershell
PS> cc c,r,py @{r=64;py=3}    # Custom Args to connect R in 64 bit, and Python v3.5 
[+] Configured C for AP-PShell Management Console!
[+] Configured R-Lang[x64] for AP-PShell Management Console!
[+] Configured Python[3.5] for AP-PShell Management Console!
```
```powershell
PS> cc c,r,py 3               # ERRANEOUS, because "3" will be passed as a global parameter to all components
[+] Configured C for AP-PShell Management Console!
[!] Could not attach component r [The attribute cannot be added because variable bit with value 3 would no longer be valid.]
[+] Configured Python[3.5] for AP-PShell Management Console!
```


