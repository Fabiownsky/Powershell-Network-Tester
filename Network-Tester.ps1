# Define the parameter for setting the time interval between tests
param (
    [int]$t = 10  # Default to 60 seconds if no argument is provided
)

# Define the path for the log file in the same directory as the script
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$logFilePath = "$scriptDirectory\log.txt"

# Function to test latency (Ping) using Test-NetConnection
function Test-Latency {
    $result = Test-NetConnection -ComputerName "8.8.8.8" -InformationLevel "Detailed"
    $ping = $result.PingSucceeded
    $pingRTT = $result.PingReplyDetails.RoundTripTime
    
    if ($ping -and $pingRTT -ne $null) {
        $pingResult = "Ping succeeded: $ping, Latency: $pingRTT ms"
    } elseif ($ping) {
        $pingResult = "Ping succeeded, but latency is unavailable."
    } else {
        $pingResult = "Ping failed."
    }
    
    # Write the result to the log file
    Add-Content -Path $logFilePath -Value $pingResult
}

# Function to test internet speed using speedtest-cli
function Test-Speed {
    # Check if speedtest-cli exists in the same directory as the script
    $speedtestCliPath = "$scriptDirectory\speedtest.exe"
    
    if (!(Test-Path $speedtestCliPath)) {
        Add-Content -Path $logFilePath -Value "speedtest-cli not found. Make sure it's installed correctly."
        return
    }
    
    # Run the speedtest and capture the output
    $speedtestResult = & "$speedtestCliPath" -f json
    $speedtestData = $speedtestResult | ConvertFrom-Json
    
    # Extract the results
    $downloadSpeed = $speedtestData.download.bandwidth / 125000 # Convert to Mbps
    $uploadSpeed = $speedtestData.upload.bandwidth / 125000 # Convert to Mbps
    
    $speedResult = "Download speed: $([math]::Round($downloadSpeed, 2)) Mbps, Upload speed: $([math]::Round($uploadSpeed, 2)) Mbps"
    
    # Write the result to the log file
    Add-Content -Path $logFilePath -Value $speedResult
}

# Function to run the latency and speed tests
function Run-Test {
    $timestamp = "Running test at: $(Get-Date)"
    Add-Content -Path $logFilePath -Value $timestamp
    Test-Latency
    Test-Speed
    Add-Content -Path $logFilePath -Value "------------------------------"
}

# Loop to repeat the test every $t seconds (user-defined or default to 10)
while ($true) {
    Run-Test
    Start-Sleep -Seconds $t
}
