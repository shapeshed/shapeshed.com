+++
date = "2007-04-18T00:00:00+01:00"
description = "Allowing sites to be updated by non-technical staff is essential. WYSIWYG editors are a must in Content Management Systems, but can cause frustration too."
tags = ["Typography", "CSS", "XHTML"]
title = "The joy and curse of WYSIWYG"
+++

## HTML for everyone

WYSIWYG editors allows anyone to write and publish HTML without even knowing it.
The beauty is that in no time you are writing HTML, you don't even have to care.
It looks like Word and it feels like word. I've used a couple of these editors
in [TinyMCE][1] and [FCKeditor][2] and both of them do an excellent job. For
anyone that has used Office there should be no problem in using them. Problem
solved - it is HTML for everyone isn't it?

## The problem

On almost every project I have worked on WYSIWYG editors have caused problems
with the display of the site. The problem lies with the HTML that is generated
by the editors. You can tweak the configuration of editors to your heart's
desire but in my experience it is never bulletproof. Editors might paste
directly from Word, hit too many carriage returns or make subsequent changes
that leave invalid empty tags.

If you have created a site that is carefully crafted with typographic rules set
in CSS for each element, WYSIWYG editors are like a sledgehammer. They are
difficult to predict and unless you train editors in how to hack the WYSIWYG
editor, or even some basic HTML, your typography can fall to pieces.

## The solution

Frankly I don't know that there is a solution, until the WYSIWYG editors mature.
They have made great strides since I first started using them but it is
annoyance that however well the configuration is set they still fail.

You can try splitting the content on your page into separate database fields and
removing the ability to add formatting but this removes control from the user
and puts maintenance back on the developer of the site.

With Content Management Systems having been around for so long now it seems
perplexing that this should cause so many difficulties on a continuing basis.
For all the hype of web 2.0 HTML is still the lifeblood of the web and it seems
that unless you can write HTML by hand there isn't a reliable way of passing
that responsibility to non-technical editors without risking broken typography
or invalid code.

I'm wondering if I'm the only one who feels this way..

[1]: http://tinymce.moxiecode.com/
[2]: http://www.fckeditor.net/
