$address = "192.168.2." #will need to be adjusted per network
$count = 1
$file = "IP Scan $count.txt"
$range = 1..254
$loopControl = 1

#Prevents overwriting of files
while($loopControl){
    if(Test-Path $file){
        echo "File Exists: $file"
        $count++
        $file = "IP Scan $count.txt"
    } else {
        $loopControl = 0
    }
}

#scans for computers in a certain range
for($i = 0; $i -lt $range.Length ; $i++){
    if(Test-Connection "$($address)$($i)" -Quiet){
        echo "Connection on $($address)$($i)" | Out-File -FilePath $file -Append
    }
}