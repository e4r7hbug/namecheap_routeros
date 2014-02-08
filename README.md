namecheap_routeros
==================

Namecheap dynamic DNS update script for RouterOS. This has been tested with RouterOS v6.9.

Make sure to update the variables at the beginning of the script to match your site.

```
:local ddnsdomain "domain.com"
:local ddnspass "l0ngpassw0rdstr1ng"
:local ddnshost "test"
```

And also the name of your interface that leads to the Public Internet, for logging purposes.

```
:local ddnsinterface "ether1-gateway"
```
