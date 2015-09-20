# BLOG TEMPLATE REFLECTION QUESTIONS
### By Jeff George, 9.19.15, for DBC Phase 0

#### How was it to wireframe and create an HTML page with a pair?

In all honesty, I am not sure that wireframing and cranking out a basic HTML file benefits greatly from direct pairing. We decided to give pairing our best shot, working on a single wireframe and a single HTML template in a driver/navigator arrangement. Because we are relatively new to web development, working together that closely did have some educational benefit - there were definitely places where one of us knew how to do something that the other one didn't, and that happened in both directions. Yet I am not sure that the benefit of pairing on this sort of task (which consists basically of knowing and applying rules, rather than thinking through processes or algoriths) would carry over for more experienced developers. While we got along fine, and cooperated well, I am unconvinced that experienced developers would have benefitted much from collaborating on a task this basic.

That being said, I don't mean to condemn pair programming in general. I totally see how pairing would be very beneficial for even very experienced developers working on complex or difficult problems and projects. I guess my point is that whatever the experience level of the developers, pairing adds far more value when the developers are working at the edge of their ability. If they are doing fairly routine tasks - like writing a basic HTML template - I don't see that two people working together are even close to twice as effective as one person.

#### Did you find wireframing to be helpful to your development process?

In my work prior to DBC, I would usually scrawl a quick pencil sketch of my general idea for a page on a post-it note, then jump right into the HTML and CSS. I didn't spend more than a few minutes on that sketch, and deferred most of the detailed planning until I was in the editor.

Now that I'm learning a more formal development process, I can see that working with Balsamiq to create a detailed wireframe prior to beginning any work in HTML has significant benefits to quality, efficiency, and especially consistency. Doing so gives you an opportunity to plan out the page element by element, assuring that every single header, link, and icon is accounted for.

#### What did you and your pair decide made a good wireframe?

We didn't talk about "what made a good wireframe" in the abstract, but we called our wireframe done when we were sure we'd included every element we could imagine needing to include on the page, and had agreed on the prominence and position of each element.

#### What new semantic elements did you learn about (if any) ?

In preparing for this challenge, I read up on HTML outlining, and the proper use of the &lt;main&gt;, &lt;article&gt;, &lt;section&gt;, &lt;header&gt; and &lt;footer&gt; elements. For example, I learned that while each page can only have one &lt;main&gt; element, each self-contained block of content, including &lt;body&gt;, &lt;main&gt;, &lt;article&gt;, &lt;section&gt; and &lt;aside&gt; can have a &lt;header&gt; at its beginning, and a &lt;footer&gt; at its end.

I also learned quite a bit about coding headings. For instance, if you are adding a subheading right under a heading, only the heading goes in an &lt;h_&gt; tag; the subheading or byline should be put in a &lt;p&gt; tag and styled with CSS. This is because if you immediately follow one heading, such as an &lt;h1&gt;, with another, smaller heading, such as an &lt;h3&gt;, screenreaders and outliners will be confused because the first heading appears to have no content.

And although I never really used it, I read that the &lt;hgroup&gt; tag is officially not just deprecated, but completely obsolete. In HTML5, you would use the &lt;header&gt; element as an approximate analog for the old &lt;hgroup&gt;.