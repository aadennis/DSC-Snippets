# . .\DatabaseManager.ps1
#Clean-Installation2 # creates the MOF dirs
# Start-DscConfiguration -Path .\Clean-Installation2 -Wait -Verbose
Configuration Clean-Installation2 {
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    node localhost {
        Log ParamLog {
            Message = "Just a test"
        }
    }
}



