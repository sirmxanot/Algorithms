// Non-destructively reverses a linked list
var LinkedList = require('./LinkedList');

function TestData() {
  this.a = new LinkedList([1,2,3,4,5,6]);
  this.b = new LinkedList(["a",1,2,-3,54.5]);
  this.c = new LinkedList([0,1,2,2,1,0]);
  this.d = new LinkedList([]);
}

console.log(new TestData());