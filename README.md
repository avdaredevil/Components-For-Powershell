# Components-For-Powershell
> Polyfill Like components for PowerShell - Single Line Integrations with any Technology Stack

## Usage
>
```PowerShell
./Configure-Component.ps1 [[-Component] <Object>] [[-Preference] <Object>] [-List] [-Silent] [-ThrowErrors] [-InRecurse] [-Remove] [-Debug]
```
- Will configure any component (Technology Stack, Programming Language, Utility in one line!)
- Use `sal cc Configure-Component`, to make it even easier!
  - Then you can configure components like `cc java` or `cc python,ruby @{python=3}`
- *__Note__: If you've never run PowerShell Scripts before refer to __Setup PowerShell Section__ Below*

## Features
>
- Polyfill Inspired Logic for Connecting Components
- Teardown mechanism added
- Auto Path Switching
- Component shared and dynamic args ability
- Alias based component resolution
- Custom Components added

## Examples
> Refer **[Here](docs/examples.md)** for examples

## In Built Components
> 
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
`MongoDB`   | Tech Stack | `NA`                  | `Mongo`
>
#### Custom Components:
Name              | Type                | Description | Preferences/Arguments
----------------- | ------------------- | ----------- | -----
`Brackets-Editor` | Program Integration | Connects Brackets web editor | `[-Silent]`
`Combinatrix`     | PS Enhancement      | Adds probability Math Functions | `NA` 
`IP-Address`      | PS Enhancement      | Creates a *New background Thread* that injects your IP address to your shell | `[-Refresh]`
`Mysql`           | PS Enhancement      | Connects to mySQL and adds helper functions | `NA`
`node-extensions` | Language Extension  | Configure node related extensions like [*Node_Webkit*] | `[-Silent]`

## Set Up PowerShell [If you've never run a script in PowerShell]
> - Open PowerShell with Admin Access
- Run `Set-ExecutionPolicy Bypass`
- This allows scripts to be run in PowerShell
- cd to the *Folder* where you downloaded/cloned [Configure-Component.ps1](Configure-Component.ps1)
- `./Configure-Component.ps1`*`<arguments>`*
