# No role is required, install MS-SQL


$VmMachine = "MsSql01"
$TranscriptLogFile = "$PSScriptRoot\Transcript.txt"

Start-Transcript -Path $TranscriptLogFile -Append -Force
Get-Date -Format "yyyy-MM-dd HH:mm"

     Write-Host " --------------------------------------------------------"         -ForegroundColor Yellow 
     Write-Host " Step 5 - Part 4: $VmMachine Add Sql Firewall Rules...   "         -ForegroundColor Yellow
     Write-Host "                     0 %                                 "         -ForegroundColor Yellow
     Write-Host " --------------------------------------------------------"         -ForegroundColor Yellow   
     
     Write-Host " " 
     Write-Host "Enter Lab\Username and Password " -ForegroundColor Red

# Step 1 Start
Try 
    { # Start Try $VmMachine Join domain lab.local
     Write-Host "Create SQL-FireWall Rules on $VmMachine... 0 % "
     
     Invoke-Command -VMName $VmMachine -ScriptBlock{ # Start ScriptBlock 

        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  
        #Enabling SQL Server Ports
        New-NetFirewallRule -DisplayName “SQL Server” -Direction Inbound –Protocol TCP –LocalPort 1433 -Action allow
        New-NetFirewallRule -DisplayName “SQL Admin Connection” -Direction Inbound –Protocol TCP –LocalPort 1434 -Action allow
        New-NetFirewallRule -DisplayName “SQL Database Management” -Direction Inbound –Protocol UDP –LocalPort 1434 -Action allow
        New-NetFirewallRule -DisplayName “SQL Service Broker” -Direction Inbound –Protocol TCP –LocalPort 4022 -Action allow
        New-NetFirewallRule -DisplayName “SQL Debugger/RPC” -Direction Inbound –Protocol TCP –LocalPort 135 -Action allow
        #Enabling SQL Analysis Ports
        New-NetFirewallRule -DisplayName “SQL Analysis Services” -Direction Inbound –Protocol TCP –LocalPort 2383 -Action allow
        New-NetFirewallRule -DisplayName “SQL Browser” -Direction Inbound –Protocol TCP –LocalPort 2382 -Action allow
        #Enabling Misc. Applications
        New-NetFirewallRule -DisplayName “HTTP” -Direction Inbound –Protocol TCP –LocalPort 80 -Action allow
        New-NetFirewallRule -DisplayName “SSL” -Direction Inbound –Protocol TCP –LocalPort 443 -Action allow
        New-NetFirewallRule -DisplayName “SQL Server Browse Button Service” -Direction Inbound –Protocol UDP –LocalPort 1433 -Action allow
        #Enable Windows Firewall
        # Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Allow -NotifyOnListen True -AllowUnicastResponseToMulticast True

     } # End ScriptBlock    
    } # End Try $VmMachine Join domain lab.local

Catch
    { # Start Catch
     Write-Warning -Message "$VmMachine could not join domain lab.local"
     Write-Error $Error[0]
    } # End Catch



# Step Confirmation
Try 
    { # Start Try Confirmation
     Write-Host "Create SQL-FireWall Rules on $VmMachine... 100 % " -BackgroundColor Green
     Write-Host ""

     Write-Host " --------------------------------------------------------"         -ForegroundColor Green 
     Write-Host " Step 5 - Part 4: $VmMachine Add Sql Firewall Rules...   "         -ForegroundColor Green
     Write-Host "                     100 %                              "         -ForegroundColor Green                                                          
     Write-Host " "
     Write-Host " "      
     Write-Host "          Go to next step,Step 3 - Part 4"                          -ForegroundColor Green   
     Write-Host " --------------------------------------------------------"          -ForegroundColor Green  

   } # End Try Confirmation
    
Catch
    { # Start Catch
     Write-Warning -Message "Script could not be runned"
     Write-Error $Error[0]
    } # End Catch
# Step Confirmation


