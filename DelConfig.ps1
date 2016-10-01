#. .\DelConfig.ps1
# DelConfig
# $session = New-CimSession -ComputerName $env:COMPUTERNAME
# Start-DscConfiguration -Path WebSiteConfig -CimSession $session -Wait -Verbose
# Start-DscConfiguration -Path WebSiteConfig -Wait -Verbose
# Have to create Physical Path pre executing it... of course
# Remove-DscConfigurationDocument -Stage Pending
# Remove-Item -Recurse .\WebSiteConfig
# . .\WebsiteConfig.ps1
# WebSiteConfig
# Start-DscConfiguration -Path WebSiteConfig -CimSession $session -Wait -Verbose -Force
# https://weblog.west-wind.com/posts/2013/Oct/02/Use-IIS-Application-Initialization-for-keeping-ASPNET-Apps-alive#GettingstartedwithApplicationInitialization
#https://gallery.technet.microsoft.com/scriptcenter/xDatabase-PowerShell-0db6cdaf
#Install-Module -Name xDatabase
#https://www.powershellgallery.com/packages/xDatabase/1.4.0.0
#https://github.com/PowerShell/xDatabase
#http://go.microsoft.com/fwlink/?LinkId=393729
#CleanUp -Credentials $Credentials
#iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
# choco install sql2014.smo (no 2016 yet)
# https://msdn.microsoft.com/en-us/library/hh245202.aspx - refers to 2016
# https://msdn.microsoft.com/en-us/library/hh231286.aspx#Security
# sqlcmd -U adguy -P thepassword -Q "create database db1"
# https://msdn.microsoft.com/en-us/powershell/dsc/scriptresource

Configuration Cleanup {
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -Module 'xDatabase'

    Node DENMOT {
        
        File DeleteIISFolders {
            Ensure = "Absent"
            Type = "Directory"
            Recurse = $true
            DestinationPath = "C:\Inetpub\wwwroot\DenApp3"
            Force = $true
        }

        File DeleteProgramDataFolders {
            Ensure = "Absent"
            Type = "Directory"
            Recurse = $true
            DestinationPath = "C:\ProgramData\SomeTest"
            Force = $true
        }

        Script DropTheDatabases {
            GetScript = {"GetScript seems to do nothing - defect?"}
            SetScript = {"SetScript seems to do nothing - defect?"}
            TestScript = {
        }
    }
   }    
}