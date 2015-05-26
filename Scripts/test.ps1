$hosts = Get-VMHost
$vms = Get-Datacenter | Get-VMhost -Name "145.108.224.15"| Get-Vm |Where {$_.PowerState -eq “PoweredOn“}

$CurrentDate = Get-Date
$CurrentDate = $CurrentDate.ToString('MM-dd-yyyy_hh-mm-ss')
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat power.power.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Poweredoff\HostPower_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat cpu.usage.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Poweredoff\HostCPU_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat mem.usage.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Poweredoff\HostMEM_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat disk.read.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Poweredoff\HostREAD_$CurrentDate.csv
Get-Datacenter | Get-VMhost -Name "145.108.224.15" | Get-Stat -Stat disk.write.AVERAGE -MaxSamples 60 -realtime | Export-CSV Z:\GreenLab\Team1\Hosttests\Poweredoff\HostWRITE_$CurrentDate.csv
