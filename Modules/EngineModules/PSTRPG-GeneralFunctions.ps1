#Generic Functions Module
function New-GUID {
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateSet('Scene', 'View', 'Item', 'Event', 'NPC', IgnoreCase = $true)]
		[String]$GuidType
	)
	$GeneratedGUID = ""
	$GuidTypeID = ''
	$GuidRandomString = ''
	switch ($GuidType) {
		'Scene' {
			$GuidTypeID = '5cf43ed8'
		}
		'View' {
			$GuidTypeID = '769dea12'
		}
		'Item' {
			$GuidTypeID = '77e5ad0e'
		}
		'Event' {
			$GuidTypeID = '3151c39f'
		}
		'NPC' {
			$GuidTypeID = '4cd09cb6'
		}
	}
	#Generate rest of GUID
	For ($i = 0; $i -lt 28; $i++) {
		If ($i -eq 0 -or $i -eq 5 -or $i -eq 10) {
			$GuidRandomString = $GuidRandomString + '-'
		}
		Else {
			$D4 = Get-Random -Minimum 1 -Maximum 4
			if ($CoinFlip -eq 1) {
				#97.122 - Letters
				$GuidRandomString = $GuidRandomString + "$([char](Get-Random -Minimum 97 -Maximum 122))"
			}
			Else {
				$GuidRandomString = $GuidRandomString + "$(Get-Random -Minimum 0 -Maximum 9)"
			}
		}
		
	}
	$GeneratedGUID = "$GuidTYPEID" + "$GuidRandomString"
	return $GeneratedGUID
}
