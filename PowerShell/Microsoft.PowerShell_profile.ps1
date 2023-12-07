"Start Loading `$PROFILE.CurrentUserCurrentHost" | Write-Host


"`tSetting input and output encoding to UTF-8" | Write-Host
$OutputEncoding = [System.Console]::InputEncoding = [System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(65001)
####[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(65001)


"`tPowerShell parameter completion shim for the dotnet CLI" | Write-Host
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}


"`tPowerShell parameter completion shim for the winget" | Write-Host
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
    $Local:word = $wordToComplete.Replace('"', '""')
    $Local:ast = $commandAst.ToString().Replace('"', '""')
    winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}


"`tImporting scoop-completion module from buckets:extras/scoop-completion" | Write-Host
# scoop-completion
# enable completion in current shell
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"


"`tImporting posh-git module" | Write-Host
# posh-git
Import-Module posh-git


####Set-PSReadLineOption -PredictionViewStyle ListView
####Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete


"`tSetting cd with ls" | Write-Host
Remove-Alias -Name cd
function cd {
    Set-Location -Path $args[0]
    Get-ChildItem
}


"`tSetting user's shell variable" | Write-Host
####Set-Variable -Name 'Workstation' -Value 'C:\Users\PengChenxiang\OneDrive\Workstation' #'C:\Users\PengChenxiang\Workstation'
Set-Variable -Name "EnableMyPrompt" -Value $true
$Env:VIRTUAL_ENV_DISABLE_PROMPT = 1


"`tImporting ErrorPowerCommonMdule" | Write-Host
Import-Module $Env:OneDrive\Programs\PowerShell\Modules\ErrorPowerCommonModule.psm1


"`tSetting Enter key transforms ~(tildes) to `$HOME" | Write-Host
Set-PSReadlineKeyHandler -Key Enter -ScriptBlock {
    try {
        $line = $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)
        if($line -match '(?<= | ''| ")~(?=[\\/]?)') {
            [Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
            [Microsoft.PowerShell.PSConsoleReadline]::Insert(($line -replace '(?<= | ''| ")~(?=[\\/]?)', $HOME))
        }
    }
    finally {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
}
