Clear-Host

$groups = "group1","group2","group3","group4","group5","group6","group7","group8","group9","group10"

[int]$xAxis
[int]$yAxis
[int]$x
[int]$y

$groupsArray = New-Object 'object[,]' 1,$groups.Count

$x = 0
$y = 0

ForEach($group in $groups)
{
	$xAxis = 0
	$yAxis = 0

	$members = Get-ADGroupMember $group

	$membersArray = New-Object 'object[,]' $members.Count,1

	ForEach($member in $members)
	{
		$membersArray[$yAxis,$xAxis] = $member.Name
		$mergeDetails = $mergeDetails + "`n" + $membersArray[$yAxis,$xAxis]
		$yAxis++
	}

	$groupsArray[$y,$x] = $mergeDetails
	$allDetails = $allDetails + $groupsArray[$y,$x]
	$x++
}
$allDetails
