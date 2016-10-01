# . .\Database2Manager.ps1
#Clean-Installation2 # creates the MOF dirs
# Start-DscConfiguration -Path .\Clean-Installation2 -Wait -Verbose

$config = @{
    AllNodes = @(
        @{NodeName = "localhost";
        PSDscAllowPlainTestPassword=$true}
    )
}

Configuration SqlServerInstall {
    param (
        [Parameter (Mandatory=$true)]
        [string]$Instance
    )
    Import-DscResource -Module xSqlPs

    Node $AllNodes.NodeName { 
        xSqlServerInstall installSqlServer {
            InstanceName = $Instance
            SourcePath = "asdfadf"
        }
    }
}



