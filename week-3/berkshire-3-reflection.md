# Berkshire CSS Reflection
### By Jeff George, 9.23.15, for DBC Phase 0

#### What is important to know when linking an external file (like a stylesheet) to an HTML file?

Obviously, you need to know the type of file you're linking, and you have to have the exact file name, with the right extension for the purpose of the file. Just as important, and perhaps slightly trickier, is getting the path to the file right. It is also essential to use a relative URL to locate the file, instead of an absolute URL, so that the site doesn't ahve to be corrected before it can be branched by another collaborator or pushed live to the web.

#### What tricks did you use to help you with positioning? How hard was it to get the site as you wanted it?

For most of the positioning, we were able to get what we wanted done with simple margins and padding. As we started, we "reset" the margins of **p**, **h1**, and **h2** to 0 all around, so we'd be working on a known foundation; we later pushed the top margin only of the generic **p** element back up to 0.75em, to put space between paragraphs by default.

Since we did _not_ use lists in our table (separate, single item lists in each table cell seemed like an ugly hack to us) we had to insert the bullets by hand as entities. This pushed the first line of text in each cell, the link, back from the margin. At first, we compensated for this by adding padding-left to the class for the underline in the cells that had subscript descriptions, adjusting the amount of padding until the two lines of text aligned.

After our pair session ended, however, I noticed that when the link line wrapped, the left margin became ragged, as the three lines of text (two lines of link, one of description) didn't align. To fix this, I put an n-space entity after the bullet in the link, and added a negative text-indent to the class for the link. By adjusting the size of the negative index to match the width of the bullet plus the n-space (using ems instead of pixels, for resizability), I was able to make the second line of links that wrapped align with the first. Then I removed the padding on the description line, and all three lines of text aligned properly. Using a negative text indent in this way might be a hack, but I think it would be a fairly durable one - since it's all done with ems and font characters, it ought to scale smoothly. And it's certainly less trouble and less ugly than making every cell in the table contain a single-item list - which turned out to be how Bershire Hathaway did it after all! (I just threw up in my mouth a little...)


#### What CSS did you use to modify the element style (like size, color, etc.)

I _think_ this question is just asking for some of the CSS properties we used. Here's a list:
* **font-size** was used a lot, and always with ems, to adjust the size of the font.
* **font-weight: bold; was used to set the masthead text to bold.
* **margin** and **padding** were also used frequently, with ems; often used to set margin or padding on just one side of an element.
* **text-align: center;** came up often, since much of the text is centered.
* **vertical-align: top;** pushed the table cell contents to the top of each cell, so it would align neatly.
* **text-indent: -0.75em;** was used to place the bullet outside the text margins in each cell.
* **color** was used to set the text color for normal text, links, and visited links.
* **width** was used, again with ems, to control the size of the GEICO logo.
* **height** was used, with ems, to set the height of each table cell.
* **display: block;** was used to force the spans in the masthead to display on separate lines.
* **border** was used to attach a horizontal rule to the bottom of the necessary elements, and to slap a green border around the table cells while we were working out the spacing of the table. The green border was later set to 0px width, so that it wouldn't display on the final website.


#### Did you modify the HTML to include classes or ids? If so, which did you chose and why? If you didn't, how would you know which one to add to your HTML?

We added lots of classes, but we didn't use IDs at all. These days, it's considered bad practice to hang CSS styling on IDs. Doing so not only makes it impossible to re-use the rule, but it also stomps all over specificity, possibly forcing you to make ugly hacks (like **!important**) in your CSS to override some property in a rule attached to an ID. IDs should be reserved for use by JavaScript and to define anchor tags, and never, ever be used for styling.


#### When you compared your site to the actual code base, which do you think had cleaner code that followed best practices and why?

Our code was a thousand times cleaner and "best-practicey" than the original code base, for several reasons. I'll list just a few of them:
* The original code was written in HTML 4.0, as shown in the doctype.
* All the styling in the original code is done with HTML attributes. It doesn't use CSS **at all** -- no stylesheet, no internal styles in the head, not even inline styles in the body! For example, all changes to the font size are done in HTML, using the **font** tag and **size** attribute.
* As mentioned above, the original code includes a single-item unordered list (with all the nested tags that entails) _just_ to add a bullet to the links. We managed this with a lot less trouble (and a lot less nesting) using HTML entities and a negative text-indent. True, this did mean we had to add the bullet and the space explicitly to the HTML, which is sub-optimal; if we'd had more time, we'd have figured out how to put those characters in the CSS using a **::before** selector.
* The original code uses empty **p** elements in the HTML to add vertical space, instead of adding margins or padding in the CSS.
* The original code doesn't follow "best practices" nesting format, and instead stacks up all the closing tags on a single line at the end of each block.
* The original code uses **hr** elements to make horizontal rules, instead of using borders.
* In the footer, the original code inappropriately uses a **dt** tag, nested inside a **dl**, just to make the copyright notice small. This should have been done with a **p** tag and either a CSS class that adjusts the **font-size** property (if you're doing it the right way), or an HTML **font** tag (if you're doing it how they do things in Omaha).

I'm sure there's more wrong with it, but it's getting late here...