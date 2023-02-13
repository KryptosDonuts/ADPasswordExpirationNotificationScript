Import-Module ActiveDirectory

$SmtpServer = "your_smtp_server"
$FromAddress = "noreply@example.com"

$UseCredentials = $true # set to $false if you do not want to use Office 365 credentials
$Username = "your_office365_username"
$Password = ConvertTo-SecureString "your_office365_password" -AsPlainText -Force

$PasswordExpiryThresholds = @(10, 5, 1) # days before password expiry

# Get all users in Active Directory
$Users = Get-ADUser -Filter * -Properties "msDS-UserPasswordExpiryTimeComputed"

# Loop through each user
foreach ($User in $Users) {
    # Get the password expiry time
    $PasswordExpiryTime = [DateTime]::FromFileTime($User."msDS-UserPasswordExpiryTimeComputed")

    # Check if the password is going to expire soon
    foreach ($Threshold in $PasswordExpiryThresholds) {
        if (($PasswordExpiryTime -lt (Get-Date).AddDays($Threshold)) -and ($PasswordExpiryTime -gt (Get-Date))) {
            # Send an email to the user
            $ToAddress = $User.EmailAddress
            $Subject = "Your password is going to expire in $Threshold days"
            $Body = "Your password is going to expire on $PasswordExpiryTime. Please change your password to ensure continuous access to your account."
            if ($UseCredentials) {
                Send-MailMessage -SmtpServer $SmtpServer -From $FromAddress -To $ToAddress -Subject $Subject -Body $Body -UseSsl -Port 587 -Credential (New-Object System.Management.Automation.PSCredential($Username, $Password))
            } else {
                Send-MailMessage -SmtpServer $SmtpServer -From $FromAddress -To $ToAddress -Subject $Subject -Body $Body -UseSsl -Port 587
            }
        }
    }

    # Check if the password has already expired
    if ($PasswordExpiryTime -lt (Get-Date)) {
        # Send an email to the user
        $ToAddress = $User.EmailAddress
        $Subject = "Your password has expired"
        $Body = "Your password has expired on $PasswordExpiryTime. Please change your password as soon as possible to regain access to your account."
        if ($UseCredentials) {
            Send-MailMessage -SmtpServer $SmtpServer -From $FromAddress -To $ToAddress -Subject $Subject -Body $Body -UseSsl -Port 587 -Credential (New-Object System.Management.Automation.PSCredential($Username, $Password))
        } else {
            Send-MailMessage -SmtpServer $SmtpServer -From $FromAddress -To $ToAddress -Subject $Subject -Body $Body -UseSsl -Port 587
        }
    }
}
