+++
date = "2014-05-30T11:14:01+01:00"
description = "Passwords continue to harm the web. We need to rethink our approach to authentication."
tags = ["Opinion"]
title = "Passwords are still an anti-pattern"
+++

## We were warned

Nearly seven years ago [Jeremy Keith][1] wrote an eloquent article on why
passwords are an anti-pattern. His argument was predominantly around the need
for OAuth and not entering passwords into third party sites to allow access to
users data. We are through that argument now and for all its faults [OAuth][4]
has been widely adopted.

But passwords are still an anti-pattern that deliver terrible experiences to
users and a poor security model day after day.

## An example

Stuart and Lynne live in Australia and are retired. They use email heavily to
communicate with their family and rely on their ISP to provide their email
service. They use the same password for all of their services. It is a memorable
word mixed up with some numbers. This is what they were advised to do. On
Tuesday they wake up to some emails from friends that they have been hacked and
that they have received spam emails from them. They are immediately very
embarrassed and email all of their contacts to apologise. Later they start to
feel very unsafe and concerned that the contents of their email have been
viewable to a hacker. The word hacker means something close to criminal for
them. They begin to feel scared of technology and question whether they will
ever be safe.

From a customer experience the example is clearly terrible. A [study from
Ofcom][2] suggests that Stuart and Lynne are in the majority in terms of using
the same password for everything. The study notes that one in four use birthdays
or names as passwords.

Do Stuart and Lynne care that they were the victim of a dictionary attack? No.
Do they feel unsafe because of the authentication model they have to use? Yes.

## Handing over your keys

In the physical world setting a password with a service provider would be the
same as handing over the keys to your house to someone you don't know. Every
time you want to go into your house you need to visit this person and get the
keys. When you are finished entering or leaving your house you have to hand the
keys back. The security of everything in your house is the responsiblity of
someone else.

How the third-party manages security around your keys is completely unknown.
They might throw them in a box at the bottom of their garden or store them in a
vault. But you are not able to know that. The third-party is also storing keys
for other people. Occassionally people break in to the third-party and steal
keys. It is then your responsibility to change the locks on your house, get new
keys and give it back to the third-party.

The analogy is a little contrived but the point is that by setting a password
and handing it over you have no way of knowing if the application provider is
using plain text, or encrypting it with an insecure cipher to hash your
password. You have no idea about the security environment around storing the
password.

This might seem like complete insanity but in fact it is accepted behaviour on
the web. Read any Terms of Service.

Google's current [Terms of Service][3] are quite clear about passwords

> To protect your Google Account, keep your password confidential. You are
> responsible for the activity that happens on or through your Google Account.
> Try not to reuse your Google Account password on third-party applications. If
> you learn of any unauthorised use of your password or Google Account, follow
> these instructions.

What this says is that you are responsible any breaches of the account and for
anything that happens afterwards.

## The model is broken

With certainty I can predict that about every other month a major service
provider will have a security breach around passwords. A recent high-profile
breach was [Ebay][5] where a statment noted that encrypted passwords had been
compromised. They were quite clear in their statement about what had been
stolen.

> customers' name, encrypted password, email address, physical address, phone
> number and date of birth

Today another site has announced a breach - [Office][6] a clothes retailer in
the UK. The reaction of customers reflects how broken the current password model
is

> Just got a message from office shoes asking to change me password! These
> hackers are ruining the whole world god dayumn in!!!!!!

<cite>[@MissionD3][7]</cite>

Whilst I respect the sentiment of @MissionD3 hackers are not ruining the world.
The security model powering the web is the problem.

## We need to do better

We have grown up with passwords on the web but it is time to admit that the
model used by the majority of applications does not work. We are humans. We fail
at remembering passwords so we make ones that are easy to remember and we use
the same ones over and over again. We hand passwords over to a third-party
willingly even though there are regular, predictable breaches.

The fact that power users resort to password managers or even use password reset
to access their accounts is a symptom of the problem.

I don't have the answer to where the web goes with security. Private keys,
two-factor authentication would seem to be good starts. But the current model
seems inherently broken and consistently delivers terrible experiences for
users. Enough is enough - we need to rethink this.

[1]: http://adactio.com/journal/1357/
[2]:
  http://media.ofcom.org.uk/2013/04/23/uk-adults-taking-online-password-security-risks/
[3]: https://www.google.com/intl/en-GB/policies/terms/
[4]: http://oauth.net/
[5]: http://www.ebay.com
[6]: http://www.office.co.uk/
[7]: https://twitter.com/MissionD3/
