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


Configuration Cleanup {
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

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
    }
}