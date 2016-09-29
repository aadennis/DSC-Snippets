Configuration Clean-Installation2 {
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    node localhost {
        Log ParamLog {
            Message = "Just a test"
        }
    }
  

}

