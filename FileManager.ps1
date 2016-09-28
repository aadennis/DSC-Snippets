Configuration Create-Files {
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
    
    Node "localhost" {
        File MyRandomDir {
            DestinationPath = "C:\temp\forTheDemo"
            Type = "Directory"
            Recurse = $false
        }
    }
}

