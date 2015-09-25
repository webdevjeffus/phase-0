# Positioning Reflection
### By Jeff George, 9.24.15, for DBC Phase 0

## Exercise screenshots

#### 1. Color

<img src="pp3-4-1-colors.png">

#### 2. Column

<img src="pp3-4-2-column.png">

#### How can you use Chrome's DevTools inspector to help you format or position elements?

DevTools' Elements pane allows you to examine the DOM tree element by element; to see the source and content of all CSS properties applied to each element; and to view the box-model diagram showing the area occupied by the content, padding, border and margin, measured in pixels (which is a useful conversion, if the CSS is written to be fluid, using percentages or ems). You can either click on the element in the DOM tree within the top panel of the Element pane, or right-click and Inspect Element on elements visible within the browser display window. Doing so will give you complete information on the styling rules effecting the element, in the Styles pane, as well as the box-model diagram for that object.

You can use DevTools to format and position elements by editing the DOM tree displayed in the Elements pane, to change the HTML, or by editing the CSS in the Styles pane. You can add or delete elements and styles in these panes, as well as changing their value. For this challenge, we were mostly concerned with adding, deleting, and changing the value of style rules in the Styles panel. When you make a change in the Element or Styles pane, it is instantly reflected in the browser display window.

It is also possible to cut- or copy-and-paste within these panes, or to copy elements or rules out of the Element and Styles panes to paste into your permanent HTML and CSS files.


#### How can you resize elements on the DOM using CSS?

In order to _have_ a size that can be altered, elements must have a display property set to either **block** or **inline-block** (other display settings may also work, but were not covered in this challenge). Some elements are set to **block** by default, but others have to be set manually -- check your docs or experiment to see which is which. In order to change the size of a block element from the default determined by its contents (if any), you must assign either a **width** or **height** property, or both. **Width** and **height** may be set using pixels, percents, ems, or rems.


#### What are the differences between Absolute, Fixed, Static, and Relative positioning? Which did you find easiest to use? Which was most difficult?

* **Static** is the default positioning for HTML elements. An element with **position: static** will appear in its normal location in the document flow, according to it's display type and it's position in the DOM. By default, most **static** elements stack in a column against the left margin.
* **Fixed** position displays the element in a location relative to the edges of the browser window. For example, an image with **position: fixed;**, **top: 25px;** and **right: 50px;** will be displayed with its top, right-hand corner at a spot 25 pixels down from the top edge of the window, and 50 pixels in from the right edge of the window.
* **Relative** positioning will offset the element's position relative to the location where it would have otherwise displayed in the document flow. For example, an image with **position: relative** and **left: 12px** will be nudged 12 pixels to the left of where it would have otherwise appeared on the page.
* **Absolute** is the trickiest position to get a handle on. It is very similar to **relative**, in that it offsets the element from a given point, but how it determines where that starting point is can be confusing. My pair partner and I experimented with this during the challenge, and I will try to explain what we think we discovered: Absolute positioning uses as the point of reference for its offsets position on the page of the first ancestor with a position property other than **static**. If no element in its chain of ancestry has a **position** property other than statis, the reference will cascade up to the window, and the element will be positioned relative to the browser window, just as if it were **position: relative**.

Absolute and relative positioning are better explained through example than explanation. In the final screenshot above, the yellow box is a container, and the other four "card" divs are its children. The container is positioned with offsets (**top** and **left**) from the top left corner of the browser window with **position: absolute**. If it were **position: relative** it would land in the same spot, but it would cast a sort of shadow margin to its right, visible in DevTools, which would likely affect the position of subsequent elements in the DOM.

The "card" divs within the container all have **position: absolute**, which bases their offsets on the position of the yellow container div, which is their parent div having non-**static** positioning. If one of these cards is changed to **relative** position, _that_ div doesn't move, but the card div that _follows_ it in the DOM changes its offset-reference point to the bottom-left corner of the div with **relative** position, effectively pushing it down and to the right, out of the container. If _all_ the card divs are set to **relative** position, they no longer stack up, but are displayed down the page, extending beyond the container and off the bottom of the screen. Again, this is better understood by playing with the settings in DevTools than by reading an explanation.


#### What are the differences between Margin, Border, and Padding?

The CSS box model determines the size of elements on the browser page. It consists of four nested rectangles surrounding any CSS element. The innermost rectangle is the _content_; the dimensions of this box will default to hold whatever text, image, or other content is held by the element, and can be changed using the **width** and **height** properties. The next rectangle working outward is the _padding_; padding is area between the actual content and the border of the box, which may or may not be visible. The padding _will_ be filled with the element's background color, pattern or image.

The third rectangle working outwards is the _border_. The **border** property defaults to 0 width, so it will be invisible unless changed. Still, even if it's invisible, the border marks the edge of the background of the element. The fourth rectangle is the _margin_. The margin lies outside the border, and is _not_ filled by any background color or graphic. Generally, when two adjacent elements both have margins on their edges that touch, the margins will "share" the white space between the elements, overlapping so that only the wider of the two margins is actually used (there are exceptions to this, where the margins don't share the space, but they are unusual and seemingly arbitrary).

There are two common ways that HTML/CSS and browsers handle sizing elements using the box model, and which one you choose will have a massive impact on your layout. The model is chosen using the **box-sizing** property, and the two options are **content-box** (the default, and the one you _don't_ want, of course), and **border-box** (the good one, but you have to specify it explicitly). With **content-box**, the **width** and **height** of the element set the _content_ rectangle, and any padding, border, and margin are added to the _outside_ that rectangle. Imagine a &lt;div&gt; used to create a box, with **width: 100px** and **height: 100px**. That div is 100 pixels square, right? But if it's using the default, content-box sizing, and you add 8 pixels of padding, a 2-pixel border, and 12 pixels of margin all around, it's suddenly 144 pixels by 144 pixels! (12px margin + 2px border + 8px padding + 100px width or height + 8px padding + 2px border + 12px margin.) That's probably going to break your layout.

If you set that same box to **box-sizing: border-box**, the **width** and **height** set the dimensions of the outside edges of the border, not the content. If you add a 2-pixel border and 8 pixels of padding, those extra ten pixels on each side get pushed _inside_ the 100 pixel square, so the box doesn't change size, and your layout isn't disrupted. This makes it much easier to predict and control the size of your block elements in a complex layout. Of course, margins are outside the box, no matter which version of **box-sizing** you use, so plan around that.

In order to be sure box-sizing is set to content-box on all elements, include this code at the beginning of your CSS (taken from Paul Irish's blog, at http://www.paulirish.com/2012/box-sizing-border-box-ftw/:


html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}


#### What was your impression of this challenge overall? (love, hate, and why?)

We really enjoyed this challenge. Working with the existing document (html+css) in DevTools turned each exercise into a little puzzle. We also stepped beyond the objectives of the exercises as written a few times, and experimented to see if we could accomplish the same effect in more than one way, or to slightly change the parameters and see what happens.