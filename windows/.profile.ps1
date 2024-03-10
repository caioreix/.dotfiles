Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Invoke-Expression (&starship init powershell)

$ENV:STARSHIP_CONFIG = "$HOME/.starship.toml"


echo "Welcome Caio!"
