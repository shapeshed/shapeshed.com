{
  "slug": "ie8-the-good-the-bad-and-the-ugly",
  "title": "IE8 - The Good, The Bad and The Ugly",
  "date": "2008-01-22T00:00:00+00:00",
  "description": "The news that IE8 is considering using meta tags to determine rendering modes is a bad idea from everyone's perspective and Microsoft should reconsider.  ",
  "tags": [
    "Browsers",
    "Microsoft",
    "Opinion"
  ]
}
## IE8 - The Good

Encouraging news has been coming out of the IE camp recently. After the vastly improved support for standards in IE7, news emerged that IE8 [renders the Acid2 test][1] in standards mode. This is indeed a giant leap forward for IE which has been an underperforming browser in terms of the product for a number of years.

## IE8 - The Bad

[News emerged yesterday][2] that the development team have been working hard [on a key issue][3]. The IE8 team are keen to avoid sites that have been built for the IE6 interpretation of standards breaking in the new improved IE8. OK - there are a large number of sites out there that are poorly built or take account of IE6 broken rendering engine. Most of these sites are not built by professionals and the question is then really should IE8 take account of these? In my view the answer is no. 

I've used standards for around five years. I understand the benefits and have carefully kept hacks for IE in separate files using [conditional comments][4]. I'd be confident that if the IE8 rendering engine follows the specs then my sites should render ok in IE8. What's more I expect Microsoft to release a beta with advice in much the same way they did with IE7. 

Here is the key point for me. It is one of responsibility. I accept responsibility for my sites based on the information available to me. IE7 Beta warned me of potential issues, I acted on them and all was fine. If the same cycle happens for IE8 then I see no reason to offer a regressive option for sub-standard developers. With news that Microsoft is going to push [IE7 to corporate users on Feb 12][5] why do we even care about IE6? Drop support for it and people will upgrade. 

## IE8 - The Ugly

The ugly part of all of this is the proposal to use a meta tag to push IE8 into "Super Standards Mode."

The idea is that you would use 

    <meta http-equiv="X-UA-Compatible" content="IE=8" />

to tell IE8 that the code is compatible. For me this is a bad idea and is introducing User Agent specific code at a time when we are getting close to being able to create websites using standards alone. It is in everyone's interest to support and adhere to a defined set of standards. For Microsoft it puts the emphasis on developers to follow agreed standards and for developers it allows them to follow one methodology to create sites on multiple platforms and browsers. Opting out of the methods that browsers and developers use to determine rendering mode is not a good approach. 

The message from IE8 would seem to be that the upgrade must be compatible with the sub-standard IE6. I'm afraid I don't agree and seriously hope they reconsider. IE6 should be allowed to die a death; IE7 is available and is being actively pushed to users.

A return to browser-specific code is a seriously bad idea.

 [1]: http://blogs.msdn.com/ie/archive/2007/12/19/internet-explorer-8-and-acid2-a-milestone.aspx
 [2]: http://blogs.msdn.com/ie/archive/2008/01/21/compatibility-and-ie8.aspx
 [3]: http://alistapart.com/articles/beyonddoctype
 [4]: http://msdn2.microsoft.com/en-us/library/ms537512(VS.85).aspx
 [5]: http://blogs.zdnet.com/microsoft/?p=1114
