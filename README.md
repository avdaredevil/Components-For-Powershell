# Components-For-Powershell
> Polyfill Like components for PowerShell - Single Line Integrations with any Technology Stack

## Usage
```PowerShell
Configure-Component.ps1 [-Component] <Object> [[-Preference] <Object>] [-Silent] [-ThrowErrors] [-InRecurse] [-Remove] [-RawOutput] [<CommonParameters>]
Configure-Component.ps1 [-List] [-PassThru]
Configure-Component.ps1 [-Update]
```
- Will configure any component (Technology Stack, Programming Language, Utility in one line!)
- Use `sal cc Configure-Component`, to make it even easier!
  - Then you can configure components like `cc java` or `cc python,ruby @{python=3}`
- *__Note__: If you've never run PowerShell Scripts before refer to __Setup PowerShell Section__ Below*

## Features
- Polyfill Inspired Logic for Connecting Components
- Teardown mechanism added
- Auto Path Switching
- Component shared and dynamic args ability
- Alias based component resolution
- Custom Components added

## Examples
#### Refer **[Here](docs/examples.md)** for examples
#### Refer **[Here](docs/scr.md)** for screenshots

## In Built Components
#### In Script:
Name        | Type       | Preferences/Arguments | Alias
----------- | ---------- | --------------------- | ------
`Bower`     | Tech Stack | `[-NoPrepend]`        | `NA`
`Java`      | Language   | `NA`                  | `NA`
`Go`        | Language   | `NA`                  | `NA`
`Python`    | Language   | `[-Version=2 <string>]`| `py`
`Racket`    | Language   | `NA`                  | `DrRacket`
`Git`       | Language   | `NA`                  | `NA`
`PHP`       | Language   | `[-Version=5.4 <5.4,5.6>]`| `NA`
`C`         | Language   | `NA`                  | `NA`
`R`         | Language   | `[-Bit=32 <32,64>]`   | `NA`
`Ruby`      | Language   | `[-Version=2 <string>]`| `rb`
`ssh`       | Tech Stack | `NA`                  | `NA`
`MongoDB`   | Tech Stack | `NA`                  | `Mongo`

#### Custom Components:
Name              | Type                | Description | Preferences
----------------- | ------------------- | ----------- | -----
`Oh-My-Prompt`    | PS Enhancement      | Loads an Oh-My-Zsh Agnoster like prompt system for powershell, complete with flags, customization and so much more! | `NA`
`SSH-Link-Opener` | PS Enhancement      | Scans your current shell buffer for URLs and opens them dynamically when detected | `NA`
`Combinatorics`   | PS Enhancement      | Adds probability Math Functions | `NA` 
`Clock`           | Aesthetic Addon     | Creates a *New background Thread* that injects your Clock to your shell | `[-Refresh] <int>`
`IP-Address`      | Aesthetic Addon     | Creates a *New background Thread* that injects your IP address to your shell | `[-Refresh] <int>`
`Mysql`           | Language Extension  | Connects to mySQL and adds helper functions | `NA`
`node-extensions` | Language Extension  | Configure node related extensions like [*Node_Webkit*] | `[-Silent]`

## Parameters
Parameter         | Definition | Parameter Set
----------------- | ---------- | -------------
`-Component <c [Array/String]>`  | Attach all `c` components to PShell | `Install`
`-Preference <p [Value/Object]>` | Pass preference <code>p[c] &#124;&#124; p</code> to every `c` | `Install`
`-List`           | List all Components | `List`
`-PassThru`       | Pass the components in a object [*Programmatic API*] | `List`
`-Silent`         | Show only failures | `Common`
`-ThrowErrors`    | Instead of `Write-AP <err_msg>` use `throw <exception>` instead | `Common`
`-Remove <c>`     | Remove all components `c` that have a teardown behavior defined | `Common`
`-Debug`          | Enable Debugging messages | `Common`
`-RawOutput`      | Skip Write-AP and return PlainText instead [*Useful when used within other scripts*] | `Common`

## Set Up PowerShell [If you've never run a script in PowerShell]
- Open PowerShell with Admin Access
- Run `Set-ExecutionPolicy Bypass`
- This allows scripts to be run in PowerShell
- cd to the *Folder* where you downloaded/cloned [Configure-Component.ps1](Configure-Component.ps1)
- `./Configure-Component.ps1`*`<arguments>`*

---
By: [Apoorv Verma](https://github.com/avdaredevil)
