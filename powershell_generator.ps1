# Password Generator Script
# Generates a 20-character password composed of random upper/lower-case letters, digits, and symbols (!, #, $)
# :3


param(
    [int]
    $Length = 20
)

# Build character set
$upper = [char[]](65..90)      # A-Z
$lower = [char[]](97..122)     # a-z
$digits = [char[]](48..57)     # 0-9
$symbols = @('!','#','$')      # allowed symbols

$chars = $upper + $lower + $digits + $symbols
$charCount = $chars.Length

# Create a cryptographically secure random number generator
$rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()

# Pre-allocate byte array and fill with random bytes
$bytes = New-Object Byte[] $Length
$rng.GetBytes($bytes)

# Map each byte to a character in our set 
$password = -join (
    $bytes | ForEach-Object { $chars[$_ % $charCount] }
)

Write-Host ""
Write-Host $password
