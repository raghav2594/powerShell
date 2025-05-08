#WhatIf switch helps to show you, what will happen if we execute the command with -whatIf attribute
#This would be more helpful for before doing delete or update operation we can check what will happen with this command

#Example1
Remove-Item "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt" -WhatIf

<#
PS C:\Users\ugh4kor> Remove-Item "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt" -WhatIf

What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\password.txt".

This helps a lot. Before removing the password.txt, it will tell that what is going to be perform with is command

#>

#Example2 Use -WhatIf to check what are all the .ps1 will be deleted under below path.

Get-ChildItem "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell" -File '*.ps1' | Remove-Item -WhatIf

<#
PS C:\Users\ugh4kor> Get-ChildItem "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell" -File '*.ps1' | Remove-Item -WhatIf
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\10_Functions.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\12_ErrorHandlingTryCatchFinally.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\13_Credential_Management.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\14_WhatIf_switch.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\1_VariablesDataTypes.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\2forLoop.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\3forEach.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\4conditionalOperator.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\5comparasionOperator.ps1".
What if: Performing the operation "Remove File" on target "C:\Users\ugh4kor\Documents\Raghav doc\1 Study_Materials\PowerShell\6whileDoWhile.ps1".
#>

Get-Help whatif