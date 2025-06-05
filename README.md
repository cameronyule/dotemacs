# dotemacs

## Setup

### Magit Forge

Forge [requires a GitHub access token](https://magit.vc/manual/forge/Setup-for-Githubcom.html#Create-and-Store-an-Access-Token-1) to function.

Doom ships with Keychain integration enabled by default for macOS hosts, so we can use that and avoid fiddling with GPG. Doom helpfully [documents the format](https://github.com/doomemacs/doomemacs/tree/313e8fb48be6381aac7b42c6c742d6d363cc7d35/modules/os/macos#open-with-x) required, which can be created from the command line as follows:

``` shell
security add-internet-password -a "{username}^forge" -r htps -s api.github.com -w "{key}"
```
