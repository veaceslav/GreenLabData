

$hosts = Get-VMHost
$vms = Get-Datacenter | Get-VMhost -Name "145.108.224.15"| Get-Vm |Where {$_.PowerState -eq “PoweredOn“}

$CurrentDate = Get-Date
$CurrentDate = $CurrentDate.ToString('MM-dd-yyyy_hh-mm-ss')
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat power.power.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\OlioDB\Idle\HostPower_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat cpu.usage.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\OlioDB\Idle\HostCPU_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat mem.usage.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\OlioDB\Idle\HostMEM_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat disk.read.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\OlioDB\Idle\HostREAD_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat disk.write.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\OlioDB\Idle\HostWRITE_$CurrentDate.csv

md -Path Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate

foreach($vm in $vms){
  
	$vmstat = "" | Select VmName
        $vmstat.VmName = $vm.name
	md -Path Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName
  	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat cpu.usage.average | Export-CSV Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName\CPU$CurrentDate.csv
   	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat mem.usage.average | Export-CSV Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName\MEM$CurrentDate.csv
	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat power.power.average | Export-CSV Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName\POWER$CurrentDate.csv
	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat disk.read.average | Export-CSV Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName\ReadsVM$CurrentDate.csv
  	Get-Stat -Entity ($vm) -MaxSamples 60 -realtime -Stat disk.write.average | Export-CSV Z:\GreenLab\Team1\VMtests\OlioDB\$CurrentDate\$vmstat.VmName\Writes$CurrentDate.csv
  
}

