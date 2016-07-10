{
  "title": "My web typography is awful",
  "date": "2007-01-16T00:00:00+00:00",
  "description": "Inpired by Robert Bringhurst's \"Elements of Typographic Style\" I decided to explore the typographic capabilities of CSS further. What I found was that browser support is much better than thought and that my own approach to Typography is woefully lacking.",
  "tags": [
    "Typography"
  ]
}

## Everyone knows web typography is lacking

I am not the first to notice that Typography on the web is generally terrible. Many designers overlook the importance of Typography and leave text at default settings, using the safe but not so inspiring Arial. Textual layout is often an afterthought. Reading <a href="https://shapeshed.com/journal/elements_of_typographic_style_bringhurst/">Bringhurst's</a> book I realised there is an entire craft that is generally being overlooked. Devoting time to typography is an essential part of design and moreover legibility. Usability is rightly being seen as a key driver for successful websites, so whey isn't typography being mentioned more often?

## CSS does allow text to be styled extensively

Reading the CSS 2.1 Spec I rediscovered some properties that had been pushed aside because there I thought (wrongly) that there were cross browser issues. There are some properties that are not well supported but there are many that have excellent support and are, in my opinion, being underused. With some sound knowledge of CSS and XHTML there is no reason why typographic layouts should be limited to default settings.

The following properties are cross browser friendly for example:

*   [text-indent][1]
*   [text-align][2]
*   [letter-spacing][3]
*   [word-spacing][3]
*   [text-transform][4]
*   [first-letter][5]
*   [line-height][6]

Have a look at [the example page][7] to see these properties in action

Granted typography on the web is not an easy environment to operate in. There are a limited number of fonts available, browser support for some typography-related CSS is poor. But after reading the spec and testing a few properties I felt empowered rather than depressed.

## Useful resources

*   [The Elements of Typographic Style - Robert Bringhurst][8]
*   [The Elements of Typographic Style Applied to the Web - Richard Rutter][9]
*   [Five simple steps to better typography - Mark Boulton][10]
*   [Dave Shea - Fine Typography For the Web][11]
*   [Windows Font Survey Results][12]
*   [Mac Font Survey Results][13]

## A resolution

I'm resolved to improve my typography after reading Bringhurst's book and the work of a couple of pioneers in Richard Rutter and Mark Boulton. I hope others will follow and help improve typography on the web.

 [1]: http://www.w3.org/TR/CSS21/text.html#indentation-prop
 [2]: http://www.w3.org/TR/CSS21/text.html#alignment-prop
 [3]: http://www.w3.org/TR/CSS21/text.html#spacing-props
 [4]: http://www.w3.org/TR/CSS21/text.html#propdef-text-transform
 [5]: http://www.w3.org/TR/REC-CSS2/selector.html#first-letter
 [6]: http://www.w3.org/TR/REC-CSS2/visudet.html#propdef-line-height
 [7]: https://shapeshed.com/examples/typography-css
 [8]: http://www.amazon.com/Elements-Typographic-Style-Robert-Bringhurst/dp/0881791326
 [9]: http://webtypography.net/toc/
 [10]: http://www.markboulton.co.uk/journal/comments/five_simple_steps_to_better_typography/
 [11]: http://www.mezzoblue.com/presentations/2005/wdw/type/slides.html
 [12]: http://www.codestyle.org/css/font-family/sampler-WindowsResults.shtml
 [13]: http://www.codestyle.org/css/font-family/sampler-MacResults.shtml
