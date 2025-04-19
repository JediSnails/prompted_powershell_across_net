$commands= read-host "what cmd to run "
$hosts = Get-Content hosts.txt
$filename = [string](read-host "where and what to name csv file as (hostname will be attached at the end) ")
$ScriptBlock = [scriptblock]::Create($commands)

Foreach ($x in $hosts) {
$hostname= icm -ComputerName $x -cred $cred -SessionOption (New-PSSessionOption -NoMachineProfile) -ScriptBlock {hostname}
write-host "IP:$($x) Hostname:$hostname"
icm -ComputerName $x -cred $cred -SessionOption (New-PSSessionOption -NoMachineProfile) -ScriptBlock $ScriptBlock |export-csv -Path $filename-$hostname.csv
}


#get-aduser -filter *
#cmd /c dir /b /s C:\flag.txt 2> $null
#get-adtrust -filter *
#
#
#
#
#
#
#
#
#nsn -CN $target -SessionOption (New-PSSessionOption -NoMachineProfile) -ScriptBlock { $commandToRun };
#etsn -CN $target -SessionOption (New-PSSessionOption -NoMachineProfile) -ScriptBlock { $commandToRun };
