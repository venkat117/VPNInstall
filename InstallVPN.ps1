$LocalTempDir = $env:TEMP; $VPNInstaller = "VPNInstaller.exe";
(new-object    System.Net.WebClient).DownloadFile('https://d26wo1m3adcxu5.cloudfront.net/HSS-773-ALT%7Bal_token%7D.exe?ko_click_id=ko_f5b764e5fe1ba8621', "$LocalTempDir\$VPNInstaller"); & "$LocalTempDir\$VPNInstaller" /silent /install;
$Process2Monitor =  "VPNInstaller"; Do { 
    $ProcessesFound = Get-Process | ?{
        $Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound)
{ "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 }
else
{ rm "$LocalTempDir\$VPNInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
