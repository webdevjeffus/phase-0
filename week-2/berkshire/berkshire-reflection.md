#Reflection Questions
### By Jeff George, 9.17.15, for DBC Phase 0

#### What was it like to translate your previous learning with HTML into an actual site?

This was a pretty straight-forward challenge for me, as I have a fair amount of HTML experience before coming to DBC, and the site we were assigned to replicate was not at all complex. My partner for the challenge was a little less experienced with HTML than me, so we decided to let him drive while I navigated, to be sure we were both fully involved in the work, and to maximize our learning. To me, the hardest part for me was *not* applying at least minimal CSS to the page, and leaving it unfinished.

#### How was it researching and using semantic HTML5 elements?

Our intent on this project was to use semantic tags as much as possible, and to avoid <div> tags except when absolutely necessary to group elements into stylable blocks. We set the file up using <header>, <main>, and <footer> tags to separate major semantic sections of the page. During our pair session, we used <div> tags to group elements within the <main> and <footer> in anticipation of styling with CSS. For example, we divided the list of links into to <ul> unlinked lists, each in a separate <div>, so that we could style them with floats to display as two columns.

After the session, upon reviewing the file, I realized that in most cases, we could logically use <section> tags in place of the <div> tags we had originally used. For example, again in the two-column list of links, I replaced the <div> tags with <section> tags, as it made sense to me that we were dividing the list into two "sections." (I will send a copy of this file, with my post-session changes, to my partner, so that he can decide for himself whether to make similar changes in his own version.)

I drank the semantic Kool-Aid months ago, and I'm very firmly in the camp that believes that HTML should focus on document structure, and include no styling instructions at all. Ideally, if we've handled the semantic tagging in this document properly, we should be able to apply a variety of CSS stylesheets to it, to produce working web pages with wildly different appearances, without making any further changes to the HTML file (besides adding some class attributes). And if we've done it perfectly, we won't even have to change class names when we change stylesheets - we'll just have to change the stylesheet called for in the <link> tag.

#### How did you do at keeping to best practices (i.e. no formatting in the HTML)

I think we did a pretty thorough job of keeping styling out of the HTML document, and using the mark-up solely to define its semantic structure. At the same time, I think we managed to construct the HTML in such a way that it can be styled with CSS using relatively few classes. The only tag we used that might be considered a "styling" tag is the <b> tag around "Berkshire Hathaway Inc." in the copyright message, and I justify that on the basis that no matter how you style the page with CSS, those words will still need to be emphasized. (The case for using <b> and <i> was made in a blog post I read in CSS-Tricks sometime back; I don't have the link handy.)

#### What seems good and bad about HTML?

What's good about HTML, and especially HTML5, is that when a document is written using semantic tags to properly structure, it should be easy to completely re-design the look of the site by switching out CSS files. Similarly, when HTML is semantically structured, it should be much easier to use media queries and relative sizing to make the site fully responsive to widely varying display sizes.

The thing that I've found most frustrating about vanilla HTML in the past didn't even come up in this challenge, and that is that HTML by itself is a straight-through, top-to-bottom scripting language, not a programming language. This means that if you want certain content on the page, you *must* type it (or copy-paste it) explicitly onto that page. And if you want it on *every* page in a website, like a consistent, site-wide header, nav bar, or footer, you have to explicitly include it in the HTML doc for every single page. This violates the DRY principle of "true" programming, whereby anything that is done over and over should be done just once, in one place, and "called" as a function or method every time it needs to be repeated. I fully expect to learn how to use an HTML pre-processor, Javascript, or some other tool to add this functionality to my HTML websites in the course of the curriculum at DBC, though.

#### What tricks do you have for remembering how to write HTML?

**_A few tips, in no particular order:_**
* Template whatever you can. (For example, you can pull most of your <head> from a similar document.)
* Look for content that groups together logically, and use appropriate semantic tags to put them into blocks to facilitate later styling.
* In Sublime, pressing TAB *before* you add the closing angle-bracket to an open tag will tell Sublime to automatically enter the closing tag *and* position the cursor between the open and close tags, so you can enter the content right away.
* Don't use the horizontal rule tag <hr>. Set up your sections (or divs, if you must) to let you use border-top or border-bottom in the CSS to create dividers on your page. This will make the HTML page more friendly to future style revisions.
* Use relative links for resources within the website, like media files, so that the entire website is more portable. You don't want to have to re-write the links when you upload the site to a server with a different URL and directory structure than your development system.
* Save early and often. Look at it in a browser from time to time as you work, to be sure you haven't broken it somehow.
* Use an HTML validator to find your errors quickly.
* Every <img> needs an alt attribute.