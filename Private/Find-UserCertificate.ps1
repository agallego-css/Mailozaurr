function Find-UserCertificate {
    [cmdletBinding()]
    param(

    )
    $store = [System.Security.Cryptography.X509Certificates.X509Store]::new('My', [System.Security.Cryptography.X509Certificates.StoreLocation]::CurrentUser)
    $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadOnly)
    $store.Certificates | Where-Object { $_.EnhancedKeyUsageList.FriendlyName -eq 'Secure Email' }

    # $collection = $store.Certificates.Find([System.Security.Cryptography.X509Certificates.X509FindType]::FindBySubjectName, "senderEmail@something.com", $false); #//TODO Change to true after test
    #$senderCertificate = $collection[0];
    # $senderCertificate
}

<#
$WindowsSecureMimeContext =[MimeKit.Cryptography.WindowsSecureMimeContext]::new()

$Address = [MimeKit.MailboxAddress]::new('przemyslaw.klys@evotec.pl')

$WindowsSecureMimeContext.CanEncrypt($Address)
#>

#[MimeKit.Cryptography.TemporarySecureMimeContext]::new()

