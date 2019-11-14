---
title: Encryption climate shows the value of Open Source
date: '2014-01-10T12:22:00+00:00'
tags: []
author: George Ornbo
original: http://pebblecode.com/blog/encryption-climate-shows-the-value-of-open-source/
---
<p>The <a href="http://www.theguardian.com/world/edward-snowden">Snowden revelations</a> have thrown the surveillance climate wide open and some have suggested that the behaviour of the NSA has <a href="http://arstechnica.com/tech-policy/2013/11/schneier-tells-washington-nsa-broke-internets-security-for-everyone/">broken the web&rsquo;s security model</a> for everyone.</p>

<p>At the 30th Chaos Communication Congress [30c3] <a href="https://www.cis.upenn.edu/~nadiah/">Nadia Heninger</a>, <a href="http://cr.yp.to/djb.html">djb</a>  and <a href="http://www.hyperelliptic.org/tanja/">Tanja Lange</a> delivered a brilliant talk about The Year in Crypto. Although there are some very technical sections I highly recommend that you watch it.</p>

<iframe width="560" height="315" src="//www.youtube.com/embed/HJB1mYEZPPA" frameborder="0" allowfullscreen></iframe>

<p>They cover a lot here.</p>

<ul><li>In 2013 TLS was compromised meaning attackers could steal cookies over https.</li>
<li>RSA keys were factored because of bad random number generators</li>
<li>There were 8 submissions of papers to the <a href="http://www.hyperelliptic.org/tanja/">Fast Software Encryption Workshop</a> on NSA Ciphers with the tacit suggestion that the NSA did this to distract the community.</li>
<li>Lavabit received a Grand Jury Summons to hand over the encryption keys for Lavabit. The suggestion is that the Government can request private keys from an internet provider at will. Once Government Organisations have the keys they can decrypt any traffic either now or in the past for traffic they have collected for everyone.</li>
<li>It was revealed that the random number generator in Intel Chips could have a backdoor.</li>
<li>The NSA Bullrun programme suggests that commercial encryption software can have backdoors inserted </li>
<li><a href="http://www.nist.gov/">NIST</a> standards in general are thrown into question including SHA-3.</li>
<li>Bad randomness in bitcoin transactions can allow bitcoins to be stolen</li>
<li>NSA&rsquo;s MUSCULAR programme allowed the NSA to remove the SSL layer from Google&rsquo;s Front End granting them access to clear text traffic.</li>
<li>The XCB standard for encrypting hard drives was suggested as being not secure as a Disk Encryption System. </li>
<li>Acoustic attacks allowed an attacker to <a href="http://tau.ac.il/~tromer/acoustic/">steal private keys via listening to audio signals</a>. They also achieved this with a smartphone microphone.</li>
<li>RSA <a href="https://www.computerworld.com/s/article/9244952/Report_on_NSA_39_secret_39_payments_to_RSA_fuels_encryption_controversy">accepted a payment of $10 million</a> around 2004 in order to implement a random number generator with a backdoor.  </li>
</ul><h2>Where open source wins</h2>

<p>In this talk it is clear that Commercial encryption software has become generally less secure in the current climate. The strength of open source encryption is that because it is open source many developers can review the code and find any backdoors that anyone is trying to add.</p>

<h2>Better Encryption</h2>

<p>The <a href="https://bettercrypto.org/">bettercrypto.org</a> site has a paper outlining practical ways to improve the way you use crypto both personally and in the software you create. It has recommendations and configuration for major web servers and best practice for using software.</p>

<p>If you are developing software for the web or value your privacy you should read it.</p>
