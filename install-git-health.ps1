$installPath = "$env:LOCALAPPDATA\GitBranchHealth"
$scriptSource = "$PSScriptRoot\git-branch-health.txt"
$scriptTarget = "$installPath\git-branch-health.ps1"

# Criar pasta
if (-not (Test-Path $installPath)) {
    New-Item -Path $installPath -ItemType Directory | Out-Null
}

# Copiar e renomear script
Copy-Item $scriptSource $scriptTarget -Force

# Criar tarefa agendada
$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-ExecutionPolicy Bypass -File `"$scriptTarget`""

$triggerMorning = New-ScheduledTaskTrigger -Daily -At 09:00
$triggerAfternoon = New-ScheduledTaskTrigger -Daily -At 15:00

Register-ScheduledTask `
    -TaskName "Git Branch Health Check" `
    -Action $action `
    -Trigger @($triggerMorning, $triggerAfternoon) `
    -RunLevel LeastPrivilege `
    -Force

Write-Host "✔ Git Branch Health instalado com sucesso"
