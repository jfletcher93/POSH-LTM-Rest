﻿Function Get-PoolList {
<#
.SYNOPSIS
    Get a list of all pools for the specified F5 LTM
#>
    param (
        [Parameter(Mandatory=$true)]$F5session
    )

    #Only retrieve the pool names
    $PoolsPage = $F5session.BaseURL + 'pool/?$select=fullPath'

    Try {

        $PoolsJSON = Invoke-RestMethodOverride -Method Get -Uri $PoolsPage -Credential $F5session.Credential
        $PoolsJSON.items.fullPath

    }
    Catch{
        Write-Error ("Failed to get the list of pool names.")
        Write-Error ("StatusCode:" + $_.Exception.Response.StatusCode.value__)
        Write-Error ("StatusDescription:" + $_.Exception.Response.StatusDescription)
    }
}