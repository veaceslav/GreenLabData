

$hosts = Get-VMHost
$vms = Get-VM |Where {$_.PowerState -eq “PoweredOn“}

$CurrentDate = Get-Date
$CurrentDate = $CurrentDate.ToString('MM-dd-yyyy_hh-mm-ss')
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat power.power.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Host_$CurrentDate.csv


foreach($vm in $vms){
  
	$vmname = $vm.name
  	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat cpu.usage.average | Export-CSV Z:\GreenLab\Team1\VMtests\CPUVM$vmname_$CurrentDate.csv
   	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat mem.usage.average | Export-CSV Z:\GreenLab\Team1\VMtests\MEMVM$vmname_$CurrentDate.csv
	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat power.power.average | Export-CSV Z:\GreenLab\Team1\VMtests\POWERVM$vmname_$CurrentDate.csv
	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat disk.read.average | Export-CSV Z:\GreenLab\Team1\VMtests\ReadsVM$vmname_$CurrentDate.csv
  	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat disk.write.average | Export-CSV Z:\GreenLab\Team1\VMtests\WritesVM$vmname_$CurrentDate.csv
  
}

