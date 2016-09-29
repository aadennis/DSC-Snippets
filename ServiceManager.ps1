#https://msdn.microsoft.com/en-us/powershell/dsc/serviceresource

configuration ServiceTest {
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost {
        Service ServiceTesty {
            Name = "Fax"
            Ensure = "Absent"
        }
    }
}


