/*****************************************************************************\
Challenge 9.2.1: JavaScript Grocery List
By Jeff George, 11/4/15
For Dev Bootcamp Phase 0
\*****************************************************************************\

Release 1: Create your user stories
In the previous challenge, you had the following minimum requirements.
You should include (at least) these requirements again.

1. Create a new list
2. Add an item with a quantity to the list
3. Remove an item from the list
4. Update quantities for items in your list
5. Print the list (Consider how to make it look nice!)


Release 2: Pseudocode
Determine which data structure you should use for your grocery list based on
these requirements. Does an array or an object the most sense and why?

Remember to keep your pseudocode in plain English and write it so that it's easy to translate to your initial solution. Identify the input and output. Your pseudocode should also avoid using language-specific words, include proper indentation, and capitalize keywords like IF, WHILE, etc.)


/*****************************************************************************\
                                 PSEUDOCODE
\*****************************************************************************\

CREATE list constructor
list_name: string
list_date: string
method: add item
method: remove item
method: update item qty
method: print list
  method: format header
  method: format list
  method: format footer
    method: sum quantities of all items


/*****************************************************************************\
                               INITIAL SOLUTION
\*****************************************************************************\

function List(name, date) {

  this.name = name;
  this.date = date;
  this.list = {};

  this.addItem = function(item, qty) {
    this.list[item] = qty;
  }

  this.removeItem = function(item) {
    delete this.list[item];
  }

  this.updateItem = function(item, qty) {
    this.list[item] = qty;
  }

  this.sumItems = function() {
    var sum = 0;
    for( var item in this.list) {
      sum += this.list[item]
    }
    return sum;
  }

  this.header = function() {
    var leader = '';
    var space = 24 - (this.name.length + this.date.length);
    for (var i = 0; i < space; i++) {
      leader += " ";
    }
    console.log('List: ' + this.name.charAt(0).toUpperCase() + this.name.slice(1) + leader + this.date);
    filler = "                      ";
    console.log('Items' + filler + 'Qty');
    console.log('------------------------------')
  }

  this.populateList = function() {
    for( var item in this.list ) {
      var leader = '';
      var space = 30 - (item.length + this.list[item].toString().length)
      for( var i = 0; i < space; i++ ) {
        leader += '.';
      }
      console.log(item + leader + this.list[item]);
    }
  }

  this.footer = function() {
    console.log('------------------------------')
    var leader = '';
    var space = 25 - this.sumItems().toString().length;
    for( var i = 0; i < space; i++ ) {
      leader += '.';
    }
    console.log('Total' + leader + this.sumItems().toString() );
  }

  this.printList = function() {
    console.log();
    this.header();
    this.populateList();
    this.footer();
    console.log();
  }

}


/*****************************************************************************\
                            REFACTORED SOLUTION
\*****************************************************************************/

function List(name, date) {

  this.name = name;
  this.date = date;
  this.default_width = 30;
  this.width = this.default_width; // May be altered temporarily by arg to .printList
  this.list = {};

  this.addItem = function(item, qty) {
    console.log( 'Add ' + item + ' * ' + qty + '.');
    this.list[item] = qty;
  }

  this.removeItem = function(item) {
    console.log( 'Cancel ' + item + '.');
    delete this.list[item];
  }

  this.updateItem = function(item, qty) {
    console.log( 'Change ' + item + ' order to ' + qty + '.')
    this.list[item] = qty;
  }

  this.sumItems = function() {
    var sum = 0;
    for( var item in this.list) {
      sum += this.list[item]
    }
    return sum;
  }

// Print List Helper Functions

  this.capitalize = function(word) {
    return word.charAt(0).toUpperCase() + word.slice(1)
  }

  this.line = function( leftCol, separator, rightCol ) {
    var leader = '';
    var space = this.width - (leftCol.length + rightCol.length);
    for( var i = 0; i < space; i++ ) {
      leader += separator;
    }
    return (leftCol + leader + rightCol);
  }

  this.header = function() {
    console.log( this.line( 'List: ' + this.capitalize(this.name), ' ', this.date ) );
    console.log( this.line( 'Items', ' ', 'Qty') );
    console.log( this.line( '', '-', '') );
  }

  this.populateList = function() {
    for( var item in this.list ) {
      console.log( this.line( this.capitalize(item), '.', this.list[item].toString() ) );
    }
  }

  this.footer = function() {
    console.log( this.line( '', '-', '') );
    console.log( this.line( 'Total', ' ', this.sumItems().toString() ) );
  }

  this.printList = function(width) {
    this.width = width || this.default_width;
    console.log();
    this.header();
    this.populateList();
    this.footer();
    console.log();
    this.width = this.default_width;
  }

}


// Driver Code //

var groceryList = new List('groceries', '11/04/15');

groceryList.addItem('banana', 6);
groceryList.addItem('apple', 5);
groceryList.addItem('lobster', 1);

groceryList.printList(25);

groceryList.addItem('egg', 12);
groceryList.addItem('hot dog', 8);
groceryList.removeItem( 'lobster');
groceryList.updateItem( 'apple', 8);

groceryList.printList();


/*****************************************************************************\
                                  REFLECTION
\*****************************************************************************\

#### What concepts did you solidify in working on this challenge? (reviewing
the passing of information, objects, constructors, etc.)

This version of the grocery list challenge really emphasized three skills:
accessing properties and values in a nested-object structure (object within an
object); writing object methods in JavaScript, including "helper" object methods
that are called by other object methods; passing arguments between object
methods (including using instance variables to avoid having to pass an
argument through two- or three-method-deep stack of helper methods); setting
and maintaining a default value for an parameter; and of course, writing a
JavaScript object-constructor function that includes methods among its
properties.


#### What was the most difficult part of this challenge?

The thing that I had the most trouble wrapping my mind around was how to
access the property names of the inner object in my nest-object data
structure. I had no problem getting to the _values_ of the inner object, but
I couldn't figure out how to make the for-in loop in my .populateList method
(lines 167-168) print the names of the properties (which were the item names).
Jack H. sat down with me and helped me figure it out at the onsite study session;
without his help, I might have wasted an hour or more before guessing that all
I needed was the was parameter name (which happened to be "item").


#### Did an array or object make more sense to use and why?

I started with an object, because I knew I'd need to keep my list of items and
quantities as key-value pairs. But because I wanted also to be able to add
"meta-data" for the list (a list name and date), as well as write the functions
for creating, editing, and printing the list as object methods, I wasn't able
to use a simple object. If I included all those properties and methods in the
object along with the items and their quantities, it threw off the for-in loops
necessary in the .sumItems and .populateList methods.

In order to make this more advanced list work, I needed to include _another_
object, to hold the actual item-quantity data, as a property of the outer list.
So in the end, my data structure consists of an outer object, containing all the
meta-data, methods, and the "actual" list, which is an object itself.

\*****************************************************************************/
