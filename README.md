# Lab.local
This Rep is basically my work test-env at home. 

---------------------------------------------------------------------------------------------

1. Create Enviroment in Hyper V.Ps1
  
  The image in my Env is Generation 2 based, You need to rename the VHDX image after string.
  
  See String at line 19 and 20
  
  * $GoldenImageServer = "$PSScriptRoot\Windows Server 2016.vhdx"
  * $GoldenImageClient = "$PSScriptRoot\Windows 10.vhdx"


   1. Creates folders after the string $ServerCollection
   2. Creates folders after the string $ClientCollection
   3. Copy $GoldenImageServe to every folder that Step 1 created
   4. Copy $GoldenImageClient to every folder that Step 2 created
   5. Create a Csv-file, Populate it Basename & Fullbase
   6. Creates 3 Virtual Switch
      * ExternalNic
      * InternalNic
      * PrivatNic 
   7. Create Vm in hyper-V
  
---------------------------------------------------------------------------------------------
Step 2 - Configuration DC01 Part 1 - Start VM.ps1
* Starts-Vm

Step 2 - Configuration DC01 Part 2 - Change Nic, RenamePc.Ps1
* Rename Computer after role, Changes nic-settings, ges

Step 2 - Configuration DC01 Part 3 - Install Role.ps1
Install Roles
     * AD-Domain-Services
     * DHCP
     * DNS

Promte Server to domain controller
   
* Line 57, type in password *
   
---------------------------------------------------------------------------------------------  
Configure Clients

Step 3 - Configuration Client01, Client02, Client03 Part 1 - Start VM.ps1

Step 3 - Configuration Client01, Client02, Client03 Part 2 - Change Nic, RenamePc.ps1


Step 3 - Configuration Client01, Client02, Client03 Part 3 - Join Domain.ps1


 
 
