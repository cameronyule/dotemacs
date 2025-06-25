# dotemacs

## Setup

### Magit Forge

Forge [requires a GitHub access token](https://magit.vc/manual/forge/Setup-for-Githubcom.html#Create-and-Store-an-Access-Token-1) to function.

Doom ships with Keychain integration enabled by default for macOS hosts, so we can use that and avoid fiddling with GPG. Doom helpfully [documents the format](https://github.com/doomemacs/doomemacs/tree/313e8fb48be6381aac7b42c6c742d6d363cc7d35/modules/os/macos#open-with-x) required, which can be created from the command line as follows:

``` shell
security add-internet-password -a "{username}^forge" -r htps -s api.github.com -w "{key}"
```

### org-gcal

Similarly to Forge, org-gcal [requires access an OAuth access token](https://github.com/kidd/org-gcal.el?tab=readme-ov-file#installation) to access the Google Calendar API.

There are two distinct uses of secrets with org-gcal: storing a client secret which is used  to obtain the access token, and then storing the access token itself. org-gcal uses GPG for the latter in a non-configurable fashion, so I've used GPG for the former as well for consistency. This is mostly abstracted through Emacs' [AuthSource library](https://www.gnu.org/software/emacs/manual/html_mono/auth.html) and the password for the GPG key itself is handily stored in the macOS Keychain.

Creating the secret uses the ["netrc" file syntax](https://www.gnu.org/software/emacs/manual/html_node/auth/Help-for-users.html) as follows:

``` shell
echo "machine org-gcal-secret login client password PASS" > oauth-client-secret.txt
gpg --encrypt --recipient KEYID --output org-gcal-secret.gpg org-gcal-secret.txt
```
