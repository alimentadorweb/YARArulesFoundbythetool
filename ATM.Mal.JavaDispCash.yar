/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule ATM_Malware_JavaDispCash {
	meta:
		description = "Detects ATM Malware JavaDispCash"
		author = "Frank Boldewin (@r3c0nst)"
		reference = "https://twitter.com/r3c0nst/status/1111254169623674882"
		date = "2019-03-28"
		hash1 = "0149667c0f8cbfc216ef9d1f3154643cbbf6940e6f24a09c92a82dd7370a5027"
		hash2 = "ef407db8c79033027858364fd7a04eeb70cf37b7c3a10069a92bae96da88dfaa"
		
	strings:
		$CashInfo = "getNumberOfCashUnits" nocase ascii wide
		$Dispense = "waitforbillstaken" nocase ascii wide
		$Inject = "No code to inject!" nocase ascii wide
		$config = ".Agentcli" nocase ascii wide
		$log1 = "logft.log" nocase ascii wide
		$log2 = ".loginside" nocase ascii wide
		
	condition:
		uint16(0) == 0x4B50 and filesize < 500KB and all of them
}
