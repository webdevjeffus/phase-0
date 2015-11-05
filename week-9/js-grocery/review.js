/*****************************************************************************\
Challenge 9.2.1: JavaScript Grocery List
By Jeff George, 11/4/15
For Dev Bootcamp Phase 0

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



PSEUDOCODE

CREATE list constructor
list_name: string
list_date: string
method: add item
method: remove item
method: update item qty
method: print list

\*****************************************************************************/


// INITIAL SOLUTION:

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

  this.sumQty = function() {
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
    var space = 25 - this.sumQty().toString().length;
    for( var i = 0; i < space; i++ ) {
      leader += '.';
    }
    console.log('Total' + leader + this.sumQty().toString() );
  }

  this.printList = function() {
    console.log();
    this.header();
    this.populateList();
    this.footer();
    console.log();
  }

}

var groceryList = new List('groceries', '11/04/15');

groceryList.addItem('banana', 6);
groceryList.addItem('apple', 5);
groceryList.addItem('lobster', 1);
console.log(groceryList);

// groceryList.removeItem('apple');
// console.log(groceryList);

// groceryList.updateItem('banana', 12);
// console.log(groceryList);

//console.log(groceryList.name + '......' + groceryList.date);

groceryList.printList();
