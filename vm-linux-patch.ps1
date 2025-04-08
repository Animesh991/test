param (
    [string]$resourceGroupName = "collab",
    [string]$vmName = "collab-t-vm"
)

# Authenticate using Managed Identity
Connect-AzAccount -Identity

# Run patching command on the VM
$script = "sudo apt update -y && sudo apt upgrade -y"

# Invoke command on VM
Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName -Name $vmName -CommandId 'RunShellScript' -ScriptString $script

Write-Output "Patch update completed on VM: $vmName"
