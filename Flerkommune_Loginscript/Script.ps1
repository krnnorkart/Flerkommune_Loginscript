#
# Script.ps1
#
#Finner ut hvilke grupper brukeren er medlem av, og skriver verdien til $groups

$id = [Security.Principal.WindowsIdentity]::GetCurrent()
$groups = $id.Groups | foreach-object {
 $_.Translate([Security.Principal.NTAccount])
} 

# For hver gruppe i $groups sjekker den om den finner Kommunenavn_ og kjører scriptet som tilhører kommunen.

foreach($group in $groups)
{
    switch -wildcard ($group.Value)
    {
      "NKKUNDE\Eidsvoll_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerEidsvoll.bat
      }
	  "NKKUNDE\Gjerdrum_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerGjerdrum.bat
      }
	  "NKKUNDE\Hurdal_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerHurdal.bat
      }
	  "NKKUNDE\Nannestad_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerNannestad.bat
      }
	  "NKKUNDE\Nes_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerNes.bat
      }
	  "NKKUNDE\ORBrann_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerORBrann.bat
      }
	  "NKKUNDE\Ullensaker_*"{
        #Start bat script
        #& "\\filesrv01\scripts\domain\EidsvollStart.bat"
		& C:\Login\DiskerUllensaker.bat
      }
	 }
}