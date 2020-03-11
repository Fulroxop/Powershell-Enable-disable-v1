$Choix = Read-Host " 1: Webcame, 2:USB, 3:impression 4:Tout"
$d = Get-PnpDevice| where {$_.friendlyname -like "Integrated Webcam"}

If($Choix -eq 1){
    $test = Read-Host " 1 pour Activer ou 2 pour desactiver"

    if ($test -eq 1){
        $d  | Enable-PnpDevice -Confirm:$false
    }
    elseif($test -eq 2){
        $d  | Disable-PnpDevice -Confirm:$false
    }
    else{
        Write-Host "vous avez entré un mauvais numéro"
    }
}
elseif($Choix -eq 2){
    $test = Read-Host " 1 pour Activer ou 2 pour desactiver"

    if ($test -eq 2){
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\" -Name "start" -Value 4
    }
    elseif($test -eq 1){
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\" -Name "start" -Value 3
    }
    else{
    Write-Host "vous avez entré un mauvais numéro"
    }
}
elseif($choix -eq 3){
    $test = Read-Host " 1 pour Activer ou 2 pour desactiver"
    
    if($test -eq 2){
        Stop-Service -Name spooler
    }
    elseif($test -eq 1){
        Start-Service -Name Spooler
    }
    else{
        Write-Host "vous avez entré un mauvais numéro"
    }
}
elseif($choix -eq 4){
    $test = Read-Host " 1 pour TOUT Activer ou 2 pour TOUT desactiver"
    if($test -eq 1){
        $d  | Enable-PnpDevice -Confirm:$false
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\" -Name "start" -Value 3
        Start-Service -Name Spooler
    }
    elseif($test -eq 2){
        $d  | Disable-PnpDevice -Confirm:$false
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\" -Name "start" -Value 4
        Stop-Service -Name spooler
    }
    else{
        Write-Host "vous avez entré un mauvais numéro"
    }
}
else{
    Write-Host "vous avez entré un mauvais numéro"
}