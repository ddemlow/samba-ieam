# powershell core script using HZN CLI to delete nodes from exchange matching pattern name
# requires environment variables for HZN
# creates list - converts to csv (which strips quotes and commas and greps for pattern to delete)
$hzn = hzn exchange node list | ConvertFrom-Csv | grep demo
Write-Host Nodes to Delete: $hzn.Count
foreach ($item in $hzn) {
    Write-Host Deleting node $item from exchange
    hzn exchange node remove $item -f  #-f forces deletion, remove to be prompted
}