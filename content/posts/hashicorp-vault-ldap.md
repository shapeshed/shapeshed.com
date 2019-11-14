{
  "slug": "hashicorp-vault-ldap",
  "title": "Using HashiCorp Vault with LDAP",
  "date": "2017-09-13T00:00:00+01:00",
  "description": "How to use HashiCorp Vault to setup an LDAP backed secret store with read-only access for users in groups and read-write access for specific users",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

## Introduction

Vault is an excellent tool for managing secrets. It can be used by both machines and humans and has a modular design and strong security models. Some of the secrets it can store include. 

* Service tokens
* Certificates
* Website passwords

In this article Vault will be used to set up a secret store and will be integrated with LDAP, providing read-only access to groups and read-write access for certain users. The advantages of using LDAP are that there is a single source of truth for identity and that access can easily be revoked. Combined with Vault's ability to seal the secret store it represents a highly secure system.

## Server Setup 

This article assumes you have a working installation of Vault and that it is initialized and unsealed. The design of the setup will map policies to LDAP groups, giving most users read-only access and a few users read-write access. First enable LDAP as an authentication backend and configure Vault to point at your LDAP instance. 

    vault auth-enable ldap

    vault write auth/ldap/config \
      url="ldaps://ldap01.foo.net" \
      binddn="cn=readonly,dc=foo,dc=net" \
      bindpass="098765432" \
      userdn="ou=people,dc=foo,dc=net" \
      userattr="uid" \
      groupdn="ou=group,dc=foo,dc=net" \
      groupattr="cn" \
      insecure_tls=false

The configuration options here will depend on your LDAP setup 

Next we will create two policies for users in the systems group. The first is read-only access to secrets in the systems path.

    
    path "secret/systems/*" {
      capabilities = ["read", "list"]
    }

The second is read-write and this will be applied to specific users.

    path "secret/systems/*" {
      capabilities = ["create", "read", "update", "delete", "list"]
    }

These policies are stored in `hcl` files and can be written to the server as follows.

    vault policy-write systems systems.hcl
    vault policy-write systems_rw systems_rw.hcl

These read-only policy can be applied to the LDAP systems group. This means that anyone in the systems LDAP group will have read access to secrets in the `systems/` path. 

    vault write auth/ldap/groups/systems policies=systems

For users that need to manage the secrets additional policies can be applied under their user namespace. 

    vault write auth/ldap/users/go policies=systems_rw

## Client setup  

### Installation

Users should download the Vault binary from the [Vault website][1]. It is
recommended that the SHA256 checksums of the binary are verified prior to
installation. 

Unzip the downloaded file.

    $ unzip vault_0.8.2_linux_amd64.zip

Move the executable to a folder within your PATH.

    $ sudo mv vault /usr/local/bin/

Point vault to the vault server.

    $ export VAULT_ADDR=https://vault.foo.net

It is recommended that a [permanent environment][3] variable is created to avoid having to set this each time you use vault. 

That's it. Test everything went ok by running.

    $ echo $VAULT_ADDR
    https://vault.clearmatics.net
    $ vault -v
    Vault v0.8.2 ('9afe7330e06e486ee326621624f2077d88bc9511')

### Authentication

Authentication to vault is using your LDAP credentials. 

    vault auth -method=ldap username=go

You will see some output to the console. This grants time based access to the password store. 

    Password (will be hidden):
    Successfully authenticated! You are now logged in.
    The token below is already saved in the session. You do not
    need to "vault auth" again with the token.
    token: 979e4b44-c4e2-b9b2-4f76-c3784bf84174
    token_duration: 2764799
    token_policies: [default systems]

Once authenticated the final line will show that you have access to certain policies. To see the grants that you have with a policy run the following. 

    vault capabilities secret/[policy_name_here]/
    Capabilities: [create delete list read update]

Once authenticated you will be able to access secrets in the vault until your token expires. At this point you will need to authenticate again. 

### Listing secrets

If you have permission to list secrets you may do so as follows. Note the `/` at the end. 

    vault list secret/systems/
    Keys
    ----
    example

### Creating a secret

If you have permission to create a secret you may do so as follows

    vault write secret/systems/example username=systems@foo.net password=foobarbaz
    Success! Data written to: secret/systems/example
  

### Reading secrets

If you have permission to read a secret you may do so as follows.

    vault read secret/systems/example
    Key                     Value
    ---                     -----
    refresh_interval        768h0m0s
    password                foobarbaz
    username                systems@foo.net

### Update a secret

If you have permission to update a secret you may do so as follows. 

    vault write secret/systems/example username=go@foo.net

This updates only the key value combinations that you give it.  

### Delete a secret

If you have permission to delete a secret you may do so as follows

    vault delete secret/systems/example
    Success! Deleted 'secret/systems/example' if it existed.

## Conclusion

Vault is a high quality Open Source project with an excellent architecture that allows multiple backends and authentication methods to be plugged in. For organisations that use LDAP it represents an excellent way to manage access to secrets. The bonus is that via the REST API, Vault also plays nice with machines needing to read secrets. 


## Further reading

* [Vault Homepage][4]
* [Vault Security Model][2]
* [Vault LDAP Auth Backend documentation][5]  

[1]: https://www.vaultproject.io/downloads.html
[2]: https://www.vaultproject.io/docs/internals/security.html
[3]: https://unix.stackexchange.com/questions/117467/how-to-permanently-set-environmental-variables
[4]: https://www.vaultproject.io/
[5]: https://www.vaultproject.io/docs/auth/ldap.html
