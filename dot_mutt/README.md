### Oauth2

- https://docs.neomutt.org/howto/oauth.html
- https://docs.neomutt.org/tutorials/gmail-setup.html
- https://github.com/neomutt/neomutt/tree/main/contrib/oauth2
- https://github.com/neomutt/neomutt/raw/refs/heads/main/contrib/oauth2/mutt_oauth2.py
- https://github.com/google/gmail-oauth2-tools/raw/refs/heads/master/python/oauth2.py

```
mutt_oauth2.py userid@myschool.edu.tokens \
    --verbose \
    --authorize \
    --provider [google|microsoft] \
    --encryption-pipe "gpg --encrypt --recipient <gpg-recipient@email.com>" \
    --client-id <id> \
    --client-secret <id> \
    --authflow [authcode|localhostauthcode|devicecode]
```

##### Google

```
.mutt/tools/mutt_oauth2.py .mutt/tokens/<user> \
    --verbose \
    --authorize \
    --provider google \
    --client-id <client_id> \
    --client-secret <client_secret> \
    --authflow localhostauthcode
```

##### Microsoft

```
.mutt/tools/mutt_oauth2.py .mutt/tokens/<user> \
    --verbose \
    --authorize \
    --provider microsoft \
    --client-id <client_id> \
    --client-secret "" \
    --authflow localhostauthcode
```
