

$dps =  @(
"lit-logdp01-p01.resldap.net",
"lit-logdp01-p02.resldap.net",
"lit-logdp01-p03.resldap.net",
"lit-logdp01-p04.resldap.net",
"lit-logdp01-p05.resldap.net",
"lit-logdp01-p06.resldap.net",
"lit-logdp01-p07.resldap.net",
"lit-logdp01-p08.resldap.net",
"lit-logdp01-p09.resldap.net",
"lit-logdp01-p010.resldap.net",
"all-logdp01-p01.resldap.net",
"all-logdp01-p02.resldap.net",
"all-logdp01-p03.resldap.net",
"all-logdp01-p04.resldap.net"
)

$aies = @(
"all-logai01-p01.resldap.net",
"lit-logai01-p01.resldap.net",
"lit-logai01-p02.resldap.net",
"lit-logai01-p03.resldap.net"
)

$webs = @(
"lit-logwb01-p01.resldap.net",
"lit-logwb01-p02.resldap.net",
"lit-logwb01-p03.resldap.net",
"lit-logwb01-p04.resldap.net",
"all-logwb01-p01.resldap.net"
)


Function Start-AllTheServices {
    foreach ($dp in $dps){
        Try {
            Write-Output "Starting LogRhythm Mediator Server Service on $dp..."
            Get-Service -Name "LogRhythm Mediator Server Service" -ComputerName $dp | Start-Service
            Write-Output "Service started."
        }
        Catch {
            Write-Error "Could not start Mediator Server Service on $($dp): $_"
        }
    }

    foreach ($aie in $aies) {
        Try {
            Write-Output "Starting LogRhythm AI Engine on $aie..."
            Get-Service -Name "LogRhythm AI Engine" -ComputerName $aie | Start-Service
            Write-Output "Service Started."
        }
        Catch {
            Write-Error "Could not start AI Engine Service on $($aie): $_"
        }
    }

    foreach ($web in $webs) {
        Try {
            Write-Output "Starting LogRhythm Web Indexer on $web..."
            Get-Service -Name "LogRhythm Web Indexer" -ComputerName $web | Start-Service
            Write-Output "Service started."
        }
        Catch {
            Write-Error "Could not start Web Indexer Service on $($web): $_"
        }
    }

    Try {
        Write-Output "Starting LogRhythm Alarming and Response Manager on the local host..."
        Get-Service -Name "LogRhythm Alarming and Response Manager" | Start-Service
        Write-Host "Service started"
    }
    Catch {
        Write-Error "Could not start LogRhythm Alarming and Response Manager on the local host: $_"
    }

    Try {
        Write-Output "Starting LogRhythm Job Manager on the local host..."
        Get-Service -Name "LogRhythm Job Manager" | Start-Service
        Write-Output "Service Started."
    }
    Catch {
        Write-Error "Could not start LogRhythm Job Manager on the local host: $_"
    }
}


Function Stop-AllTheServices {
    foreach ($dp in $dps){
        Try {
            Write-Output "Stopping LogRhythm Mediator Server Service on $dp..."
            Get-Service -Name "LogRhythm Mediator Server Service" -ComputerName $dp | Stop-Service
            Write-Output "Service stopped."
        }
        Catch {
            Write-Error "Could not stop Mediator Server Service on $($dp): $_"
        }
    }

    foreach ($aie in $aies) {
        Try {
            Write-Output "Stopping LogRhythm AI Engine on $aie"
            Get-Service -Name "LogRhythm AI Engine" -ComputerName $aie | Stop-Service
            Write-Output "Service stopped."
        }
        Catch {
            Write-Error "Could not stop AI Engine Service on $($aie): $_"
        }
    }

    foreach ($web in $webs) {
        Try {
            Write-Output "Stopping LogRhythm Web Indexer on $web..."
            Get-Service -Name "LogRhythm Web Indexer" -ComputerName $web | Stop-Service
            Write-Output "Service stopped."
        }
        Catch {
            Write-Error "Could not stop Web Indexer Service on $($web): $_"
        }
    }

    Try {
        Write-Output "Stopping LogRhythm Alarming and Response Manager on the local host..."
        Get-Service -Name "LogRhythm Alarming and Response Manager" | Stop-Service
        Write-Output "Service stopped."
    }
    Catch {
        Write-Error "Could not stop LogRhythm Alarming and Response Manager on the local host : $_"
    }

    Try {
        Write-Output "Stopping LogRhythm Job Manager on the local host..."
        Get-Service -Name "LogRhythm Job Manager" | Stop-Service
        Write-Output "Service stopped."
    }
    Catch {
        Write-Error "Could not stop LogRhythm Job Manager: $_"
    }

}

# Start-AllTheServices
Stop-AllTheServices