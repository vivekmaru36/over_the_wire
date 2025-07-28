# [root@Maru ~]# ssh -vvv -p 2220 bandit0@bandit.labs.overthewire.org
# OpenSSH_8.7p1, OpenSSL 3.2.2 4 Jun 2024
# debug1: Reading configuration data /etc/ssh/ssh_config
# debug3: /etc/ssh/ssh_config line 55: Including file /etc/ssh/ssh_config.d/50-redhat.conf depth 0
# debug1: Reading configuration data /etc/ssh/ssh_config.d/50-redhat.conf
# debug2: checking match for 'final all' host bandit.labs.overthewire.org originally bandit.labs.overthewire.org
# debug3: /etc/ssh/ssh_config.d/50-redhat.conf line 3: not matched 'final'
# debug2: match not found
# debug3: /etc/ssh/ssh_config.d/50-redhat.conf line 5: Including file /etc/crypto-policies/back-ends/openssh.config depth 1 (parse only)
# debug1: Reading configuration data /etc/crypto-policies/back-ends/openssh.config
# debug3: gss kex names ok: [gss-curve25519-sha256-,gss-nistp256-sha256-,gss-group14-sha256-,gss-group16-sha512-]
# debug3: kex names ok: [curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512]
# debug3: /etc/ssh/ssh_config line 55: Including file /etc/ssh/ssh_config.d/overthewire.conf depth 0
# debug1: Reading configuration data /etc/ssh/ssh_config.d/overthewire.conf
# debug1: /etc/ssh/ssh_config.d/overthewire.conf line 1: Applying options for bandit.labs.overthewire.org
# debug3: kex names ok: [diffie-hellman-group1-sha1,diffie-hellman-group14-sha1]
# debug1: configuration requests final Match pass
# debug1: re-parsing configuration
# debug1: Reading configuration data /etc/ssh/ssh_config
# debug3: /etc/ssh/ssh_config line 55: Including file /etc/ssh/ssh_config.d/50-redhat.conf depth 0
# debug1: Reading configuration data /etc/ssh/ssh_config.d/50-redhat.conf
# debug2: checking match for 'final all' host bandit.labs.overthewire.org originally bandit.labs.overthewire.org
# debug3: /etc/ssh/ssh_config.d/50-redhat.conf line 3: matched 'final'
# debug2: match found
# debug3: /etc/ssh/ssh_config.d/50-redhat.conf line 5: Including file /etc/crypto-policies/back-ends/openssh.config depth 1
# debug1: Reading configuration data /etc/crypto-policies/back-ends/openssh.config
# debug3: gss kex names ok: [gss-curve25519-sha256-,gss-nistp256-sha256-,gss-group14-sha256-,gss-group16-sha512-]
# debug3: kex names ok: [curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512]
# debug3: /etc/ssh/ssh_config line 55: Including file /etc/ssh/ssh_config.d/overthewire.conf depth 0
# debug1: Reading configuration data /etc/ssh/ssh_config.d/overthewire.conf
# debug1: /etc/ssh/ssh_config.d/overthewire.conf line 1: Applying options for bandit.labs.overthewire.org
# debug3: kex names ok: [diffie-hellman-group1-sha1,diffie-hellman-group14-sha1]
# debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts' -> '/root/.ssh/known_hosts'
# debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts2' -> '/root/.ssh/known_hosts2'
# debug2: resolving "bandit.labs.overthewire.org" port 2220
# debug3: ssh_connect_direct: entering
# debug1: Connecting to bandit.labs.overthewire.org [13.48.176.69] port 2220.
# debug3: set_sock_tos: set socket 3 IP_TOS 0x48
# debug1: Connection established.
# debug1: identity file /root/.ssh/id_rsa type -1
# debug1: identity file /root/.ssh/id_rsa-cert type -1
# debug1: identity file /root/.ssh/id_dsa type -1
# debug1: identity file /root/.ssh/id_dsa-cert type -1
# debug1: identity file /root/.ssh/id_ecdsa type -1
# debug1: identity file /root/.ssh/id_ecdsa-cert type -1
# debug1: identity file /root/.ssh/id_ecdsa_sk type -1
# debug1: identity file /root/.ssh/id_ecdsa_sk-cert type -1
# debug1: identity file /root/.ssh/id_ed25519 type -1
# debug1: identity file /root/.ssh/id_ed25519-cert type -1
# debug1: identity file /root/.ssh/id_ed25519_sk type -1
# debug1: identity file /root/.ssh/id_ed25519_sk-cert type -1
# debug1: identity file /root/.ssh/id_xmss type -1
# debug1: identity file /root/.ssh/id_xmss-cert type -1
# debug1: Local version string SSH-2.0-OpenSSH_8.7
# kex_exchange_identification: read: Connection reset by peer
# Connection reset by 13.48.176.69 port 2220

tried even changing the crypto policy and also tried from host machine still same error

need to figure out why connection is getting closed by 13.48.176.69