# feb/09/2014 13:27:54 by RouterOS 6.9
# software id = UW5S-3GXS
#
/system script
add name="Namecheap Dynamic DNS" policy=read,test source="# RouterOS 6.9 teste\
    d\
    \n# e4r7hbug\
    \n# Script requires \"read\" and \"test\" policies to run\
    \n\
    \n# Define User Variables\
    \n:local ddnsdomain \"domain.com\"\
    \n:local ddnspass \"l0ngpassw0rdstr1ng\"\
    \n:local ddnshost \"test\"\
    \n\
    \n:log info \"Namecheap: Updating \$ddnshost record\"\
    \n\
    \n# Define egress port name\
    \n:local ddnsinterface \"ether1-gateway\"\
    \n\
    \n# Get IP of egress point\
    \n:local myIP [/ip address get value-name=address number=[/ip address find\
    \_interface=\$ddnsinterface]]\
    \n# Strip netmask\
    \n:local myIP [:pick \$myIP 0 [:find \$myIP \"/\"]]\
    \n:log info \"Namecheap: Current IP is \$myIP\"\
    \n\
    \n# Check that ISP assigned IP\
    \n:if ([:typeof \$myIP] = \"nothing\") do={\
    \n  :log info \"Namecheap: No IP on \$ddnsinterface\"\
    \n} else={\
    \n  :log info \"Namecheap: Sending update for new IP \$myIP\"\
    \n\
    \n# Construct Namecheap Dynamic DNS update URL\
    \n# URL from http://apt8h.com/how-to-set-up-ddns-on-namecheap-and-a-dd-wrt\
    -client/\
    \n# https://dynamicdns.park-your-domain.com/update\?domain=something.com&p\
    assword=longstring1234&host=hostname[&ip=0.0.0.0]\
    \n# If no IP specified then your public IP is used, else append \"&ip=0.0.\
    0.0\" to specify your IP\
    \n  :local updateurl \"https://dynamicdns.park-your-domain.com/update\?dom\
    ain=\$ddnsdomain&password=\$ddnspass&host=\$ddnshost\"\
    \n  :log info \"Namecheap: \$updateurl\"\
    \n\
    \n# POST URL for update\
    \n  /tool fetch url=\$updateurl mode=https\
    \n  :log info \"Namecheap: Host \$ddnshost updating complete\"\
    \n}"
