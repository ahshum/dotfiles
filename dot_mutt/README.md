### Init

```sh
mkdir -p .mutt/mail/LOCAL/{cur,new,tmp}
mkdir -p .mutt/cache/messages
mkdir -p .mutt/tools
```

### Example

```
set imap_user = <user>
set imap_pass = <pass>
set folder    = "imaps://${imap_user}@<imap_host>:993/"
set smtp_url  = "smtps://${imap_user}@<smtp_host>:465/"
set smtp_pass = "$imap_pass"

source ~/.mutt/shared.rc
source ~/.mutt/local.rc
```

Gmail

```
set imap_user = <user>
set imap_pass = ""
set folder    = "imaps://${imap_user}@imap.gmail.com:993/"
set smtp_url  = "smtps://${imap_user}@smtp.gmail.com:465/"
set smtp_pass = "$imap_pass"

set imap_authenticators        = "oauthbearer:xoauth2"
set imap_oauth_refresh_command = "~/.mutt/tools/mutt_oauth2.py ~/.mutt/tokens/${imap_user}"
set smtp_authenticators        = ${imap_authenticators}
set smtp_oauth_refresh_command = ${imap_oauth_refresh_command}

source ~/.mutt/shared.rc
set postponed = "+[Gmail]/Drafts"
set record    = "+[Gmail]/Sent Mail"
set trash     = ""

source ~/.mutt/local.rc
```

Outlook

```
set imap_user = <user>
set imap_pass = ""
set folder    = "imaps://${imap_user}@outlook.office365.com:993/"
set smtp_url  = "smtp://${imap_user}@outlook.office365.com:587/"
set smtp_pass = "$imap_pass"

set imap_authenticators        = "oauthbearer:xoauth2"
set imap_oauth_refresh_command = "~/.mutt/tools/mutt_oauth2.py ~/.mutt/tokens/${imap_user}"
set smtp_authenticators        = ${imap_authenticators}
set smtp_oauth_refresh_command = ${imap_oauth_refresh_command}

source ~/.mutt/shared.rc
source ~/.mutt/local.rc
```

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
