# Quick localhost HSTS Expire

Because sometimes Safari's HSTS gets set for localhost and makes you cry.

```
bundle
CRT_FILE=/path/to/server.crt KEY_FILE=/path/to/server.key ruby quick-hsts-expire.rb
```
