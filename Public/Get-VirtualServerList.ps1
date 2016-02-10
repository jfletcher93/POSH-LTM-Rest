﻿Function Get-VirtualServerList{
<#
.SYNOPSIS
    Get a list of all virtual servers for the specified F5 LTM
#>

    param (
        [Parameter(Mandatory=$true)]$F5session
    )

    #Only retrieve the pool names
    $VirtualServersPage = $F5session.BaseURL + 'virtual?$select=fullPath'

    Try {
        $VirtualServersJSON = Invoke-RestMethodOverride -Method Get -Uri $VirtualServersPage -Credential $F5session.Credential
        $VirtualServersJSON.items.fullPath

    }
    Catch{

        Write-Error ("Failed to retrieve the list of virtual servers.")
        Write-Error ("StatusCode:" + $_.Exception.Response.StatusCode.value__)
        Write-Error ("StatusDescription:" + $_.Exception.Response.StatusDescription)
    }

}