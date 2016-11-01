# ansible-role-resolver

Configures `/etc/resolv.conf`.

## Notes

This role modifies `/etc/dhclient.conf`. If you manage `/etc/dhclient.conf`
with `ansible`, the role might break your configuration.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| resolver\_nameservers | a list of resolvers | [] |
| resolver\_dhclient\_enabled | whether dhclient is enabled | false |
| resolver\_dhclient\_interface | the interface dhclient is enabled (CentOS and FreeBSD only) | "" |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-resolver
  vars:
    resolver_dhclient_enabled: true
    resolver_nameservers:
      - 192.168.1.1
      - 192.168.1.2
      - 192.168.1.3
    resolver_dhclient_interface: "{% if ansible_os_family == 'RedHat' %}eth0{% elif ansible_os_family == 'FreeBSD' %}em0{% endif %}"
```

# License

```
Copyright (c) 2016 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [ansible-role-init](https://gist.github.com/trombik/d01e280f02c78618429e334d8e4995c0)
