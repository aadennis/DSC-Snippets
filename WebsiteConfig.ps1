#. .\WebsiteMaster.ps1
# WebSiteConfig
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


Configuration WebSiteConfig {
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xWebAdministration'

    Node DENMOT {
        WindowsFeature IIS {
            Ensure = "Present"
            Name = "Web-Server"
            IncludeAllSubFeature = $true
        }
        WindowsFeature IISManagementxTools {
            Name = "Web-Mgmt-Tools"
            Ensure = "Present"
            IncludeAllSubFeature = $true
        }
        WindowsFeature ASP {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
        }
        xWebsite DenWebSite {
            Ensure = "Present"
            Name = "DenWebSite"
            PhysicalPath = "C:\Inetpub\wwwroot"
            DependsOn = "[WindowsFeature]IIS"
            State = "Started"
        }
        File DenApp2File {
            Ensure = "Present"
            Type = "Directory"
            Recurse = $false
            DestinationPath = "C:\Inetpub\wwwroot\DenApp3"
            Force = $true
        }
        File IndexHtml {
            Ensure = "Present"
            Type = "File"
            Contents = "<!DOCTYPE html><html>This is stuff</html>"
            Recurse = $false
            DestinationPath = "C:\Inetpub\wwwroot\DenApp3\index.html"
            Force = $true
        }
        xWebVirtualDirectory MyWebApp {
            Name = "DenApp3"
            PhysicalPath = "C:\Inetpub\wwwroot\DenApp3"
            Ensure = "Present"
            WebSite = "DenWebSite"
            WebApplication = "MahWebApplication"
        }
    }
}