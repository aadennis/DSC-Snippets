Configuration Clean-Installation {
   
    Import-DscResource -ModuleName xsqlserver

    xSQLServerDatabase xx {
        Name = "xx"
        Ensure = "Absent"
        SQLServer = "asdfaf"
        SQLInstanceName = "asdfadf"
    }

}

