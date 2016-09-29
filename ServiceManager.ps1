configuration ServiceTest {
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost {
        Service ServiceTesty {
            Name = "xx"
            Ensure = "Absent"
        }
    }
}