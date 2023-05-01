+++
author = "George Ornbo"
date = "2014-01-10T12:22:00+00:00"
original = "http://pebblecode.com/blog/encryption-climate-shows-the-value-of-open-source/"
tags = []
title = "Encryption climate shows the value of Open Source"
+++

The [Snowden revelations](http://www.theguardian.com/world/edward-snowden) have
thrown the surveillance climate wide open and some have suggested that the
behaviour of the NSA has
[broken the web’s security model](http://arstechnica.com/tech-policy/2013/11/schneier-tells-washington-nsa-broke-internets-security-for-everyone/)
for everyone.

At the 30th Chaos Communication Congress [30c3]
[Nadia Heninger](https://www.cis.upenn.edu/~nadiah/),
[djb](http://cr.yp.to/djb.html) and
[Tanja Lange](http://www.hyperelliptic.org/tanja/) delivered a brilliant talk
about The Year in Crypto. Although there are some very technical sections I
highly recommend that you watch it.

<iframe src="//www.youtube.com/embed/HJB1mYEZPPA" allowfullscreen="" width="560" height="315"></iframe>

They cover a lot here.

- In 2013 TLS was compromised meaning attackers could steal cookies over https.
- RSA keys were factored because of bad random number generators
- There were 8 submissions of papers to the
  [Fast Software Encryption Workshop](http://www.hyperelliptic.org/tanja/) on
  NSA Ciphers with the tacit suggestion that the NSA did this to distract the
  community.
- Lavabit received a Grand Jury Summons to hand over the encryption keys for
  Lavabit. The suggestion is that the Government can request private keys from
  an internet provider at will. Once Government Organisations have the keys they
  can decrypt any traffic either now or in the past for traffic they have
  collected for everyone.
- It was revealed that the random number generator in Intel Chips could have a
  backdoor.
- The NSA Bullrun programme suggests that commercial encryption software can
  have backdoors inserted
- [NIST](http://www.nist.gov/) standards in general are thrown into question
  including SHA-3.
- Bad randomness in bitcoin transactions can allow bitcoins to be stolen
- NSA’s MUSCULAR programme allowed the NSA to remove the SSL layer from Google’s
  Front End granting them access to clear text traffic.
- The XCB standard for encrypting hard drives was suggested as being not secure
  as a Disk Encryption System.
- Acoustic attacks allowed an attacker to
  [steal private keys via listening to audio signals](http://tau.ac.il/~tromer/acoustic/).
  They also achieved this with a smartphone microphone.
- RSA
  [accepted a payment of $10 million](https://www.computerworld.com/s/article/9244952/Report_on_NSA_39_secret_39_payments_to_RSA_fuels_encryption_controversy)
  around 2004 in order to implement a random number generator with a backdoor.

## Where open source wins

In this talk it is clear that Commercial encryption software has become
generally less secure in the current climate. The strength of open source
encryption is that because it is open source many developers can review the code
and find any backdoors that anyone is trying to add.

## Better Encryption

The [bettercrypto.org](https://bettercrypto.org/) site has a paper outlining
practical ways to improve the way you use crypto both personally and in the
software you create. It has recommendations and configuration for major web
servers and best practice for using software.

If you are developing software for the web or value your privacy you should read
it.
