
## setup certbot assuming server in this case is master.smartorg.com

Before running this, dns must be correctly setup.

### test cert
sudo certbot --apache certonly --test-cert -d master.smartorg.com

### actual cert request
sudo certbot --apache certonly -d master.smartorg.com

### does a challenge ... writes a temp file to the www root then reads it then deletes it.

### update ssl.conf
change

SSLProtocol all -SSLv2

to

SSLProtocol             all -SSLv2 -SSLv3

and change

SSLCipherSuite HIGH:MEDIUM:!aNULL:!MD5:!SEED:!IDEA

to

SSLCipherSuite          ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA


SSLCertificateFile /etc/letsencrypt/live/master.smartorg.com/cert.pem

SSLCertificateKeyFile /etc/letsencrypt/live/master.smartorg.com/privkey.pem

SSLCertificateChainFile /etc/letsencrypt/live/master.smartorg.com/chain.pem

#reload apache gracefully ( as opposed to harsh restart with systemctl )
sudo /usr/sbin/apachectl graceful







### certs live here ...
sudo ls -ltra /etc/letsencrypt/

### setup CRON to renew cert test weekly
sudo vim /etc/cron.d/certbot

In cron.d config, follow this format.

    # Minute   Hour     Day of Month   Month              Day of Week       Who   Command
    # (0-59)   (0-23)   (1-31)         (1-12 or Jan-Dec)  (0-6 or Sun-Sat)  root  /my/fancy/script.sh

    # Runs at 2pm local time every Monday.
    MAILTO=fyu@smartorg.com
    00 14 * * 1 root /bin/certbot renew --renew-hook "/usr/sbin/apachectl graceful"


### should get an email weekly this is the nullop

Saving debug log to /var/log/letsencrypt/letsencrypt.log
Cert not yet due for renewal

-------------------------------------------------------------------------------
Processing /etc/letsencrypt/renewal/master.smartorg.com.conf
-------------------------------------------------------------------------------

The following certs are not due for renewal yet:
  /etc/letsencrypt/live/master.smartorg.com/fullchain.pem (skipped)
No renewals were attempted.
No hooks were run.

### 


### can force a renewal, but be aware of rate limits
sudo certbot renew --force-renewal --renew-hook "/usr/sbin/apachectl graceful"

#so with renewal should see a version number in this case 1 ... n increase say when 
#looking at this directory specifically 
sudo ls -l /etc/letsencrypt/archive/master.smartorg.com

-rw-r--r-- 1 root root 1809 May  9 20:17 cert1.pem
-rw-r--r-- 1 root root 1647 May  9 20:17 chain1.pem
-rw-r--r-- 1 root root 3456 May  9 20:17 fullchain1.pem
-rw-r--r-- 1 root root 1704 May  9 20:17 privkey1.pem
