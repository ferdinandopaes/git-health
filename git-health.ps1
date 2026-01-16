Add-Type -AssemblyName System.Windows.Forms

# ================= CONFIGURAÇÕES =================
$BranchName = "main" # Ajustar conforme o uso cotidiano
$RepoPath   = "C:\repos\meu-repo" # Ajustar conforme a pasta onde o projeto fica instalado
$MaxBehindCommits = 3
# =================================================

Set-Location $RepoPath

git fetch origin | Out-Null

$behind = git rev-list --count "$BranchName..origin/$BranchName"

if ($behind -gt $MaxBehindCommits) {
    $message = @"
⚠ ATENÇÃO ⚠

A branch '$BranchName' está ATRASADA!

Commits atrás: $behind

Atualize sua branch o quanto antes.
"@
    $title = "Branch desatualizada"
    $icon  = [System.Windows.Forms.MessageBoxIcon]::Warning
}
else {
    $message = @"
✅ Tudo certo!

A branch '$BranchName' está atualizada.
Commits atrás: $behind
"@
    $title = "Branch OK"
    $icon  = [System.Windows.Forms.MessageBoxIcon]::Information
}

[System.Windows.Forms.MessageBox]::Show(
    $message,
    $title,
    [System.Windows.Forms.MessageBoxButtons]::OK,
    $icon
) | Out-Null

