> Automated Active Directory Password Expiration Email Notification Script
> 
> This PowerShell script provides automated email notifications to Active Directory users about their soon-to-expire or recently-expired passwords. It offers full integration with Office 365's SMTP server and the option to use Office 365 credentials for secure email delivery. With flexible threshold settings, the script can be configured to send notifications 10, 5, and 1 day before the password expires, ensuring users are aware of the upcoming password change deadline. This script is a reliable and efficient solution for managing password expiration notifications in Active Directory environments, with built-in version control for added security and efficiency.
> 
> Features
> 
> - Automated email notifications to Active Directory users about soon-to-expire or recently-expired passwords
> - Full integration with Office 365's SMTP server, with the option to use Office 365 credentials for secure email delivery
> - Flexible threshold settings for notifications 10, 5, and 1 day before the password expires
> - Version control for easy tracking and management of changes
> 
> Requirements
> 
> - PowerShell 5.1 or higher
> - Active Directory module for PowerShell
> 
> Usage
> 
> 1. Replace the following placeholders in the script with the appropriate values:
>   - `your_smtp_server` with the hostname or IP address of your SMTP server
>   - `noreply@example.com` with the email address that you want to use as the sender
>   - `your_office365_username` and `your_office365_password` with your Office 365 credentials (if using Office 365's SMTP server)
> 2. Save the script to a file with a `.ps1` extension.
> 3. Run the script using a PowerShell console or the PowerShell ISE.
> 
> Version Control
> 
> This script uses a version control system (such as Git) to track changes and ensure the integrity of the code. Please make sure to follow best practices for version control when making changes to this script.
> 
> Contributing
> 
> If you would like to contribute to this project, please fork the repository, make your changes, and submit a pull request. Your contributions are greatly appreciated!
