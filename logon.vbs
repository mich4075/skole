On Error Resume Next

Set objSysInfo = CreateObject("ADSystemInfo")
Set objNetwork = CreateObject("Wscript.Network")

strUserPath = "LDAP://" & objSysInfo.UserName
Set objUser = GetObject(strUserPath)

colGroups = objUser.GetEx("memberOf")
For Each strGroup in colGroups
strGroupPath = "LDAP://" & strGroup
Set objGroup = GetObject(strGroupPath)
strGroupName = objGroup.CN

if strGroupName = "adm_r" or strGroupName = "adm_rw" then
objNetwork.MapNetworkDrive "S:", "\\JDR\data\faelles\adm"
End If 
if strGroupName = "prod_r" or strGroupName = "prod_rw" then
objNetwork.MapNetworkDrive "P:", "\\JDR\data\faelles\prod"
End If 
if strGroupName = "led_r" or strGroupName = "led_rw" then
objNetwork.MapNetworkDrive "L:", "\\JDR\data\faelles\ledere"

End If
Next

wscript.echo "Velkommen til JDR Windows 2012 server!"
