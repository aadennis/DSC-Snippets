After creating this .ps1 or something like it, 
first dot-it, to get the functions into memory, 
then run the function Create-Files.
This creates a sub-dir of the same name with a MOF file inside it.
Then run Start-DscConfiguration -Path .\CreateFiles -Wait -Verbose


