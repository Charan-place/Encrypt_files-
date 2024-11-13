@echo off
setlocal


set /p directory_to_encrypt=Enter the directory path to encrypt:

set /p password=Enter a password for encryption:


for /r "%directory_to_encrypt%" %%f in (*) do (
    echo Encrypting: %%f
    powershell -command ^
        "$file = '%%f';" ^
        "$content = Get-Content $file -Raw;" ^
        "$password = '%password%';" ^
        "$salt = New-Object byte[] 16; (New-Object Security.Cryptography.RNGCryptoServiceProvider).GetBytes($salt);" ^
        "$key = (New-Object Security.Cryptography.Rfc2898DeriveBytes($password, $salt, 10000)).GetBytes(32);" ^
        "$aes = New-Object System.Security.Cryptography.AesManaged;" ^
        "$aes.Key = $key;" ^
        "$aes.GenerateIV();" ^
        "$encryptor = $aes.CreateEncryptor();" ^
        "$ms = New-Object IO.MemoryStream;" ^
        "$cs = New-Object Security.Cryptography.CryptoStream($ms, $encryptor, [Security.Cryptography.CryptoStreamMode]::Write);" ^
        "[byte[]]$data = [Text.Encoding]::UTF8.GetBytes($content);" ^
        "$cs.Write($data, 0, $data.Length);" ^
        "$cs.FlushFinalBlock();" ^
        "$encryptedData = $ms.ToArray();" ^
        "$cs.Close(); $ms.Close();" ^
        "Set-Content -Path $file -Value ([Convert]::ToBase64String($salt) + [Convert]::ToBase64String($aes.IV) + [Convert]::ToBase64String($encryptedData));" ^
        "$aes.Dispose();"
)

echo Encryption completed!
pause
exit /b
