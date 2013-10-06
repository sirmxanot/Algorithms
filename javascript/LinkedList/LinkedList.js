// Define an Element Class
function Element(value) {
  this.next = null;
  this.value = value;
}

// Define Linked List class. Optionally takes an array of values.
function LinkedList(values) {
  var self = this;
  this.head = null;
  this.tail = null;

  if (values) {
    values.map( function(value) {
      element = new Element(value);
      self.push(element);
    })
  }
  return this;
}

// Puts an element at the beginning of the LinkedList (ptq)
LinkedList.prototype.unshift = function(element) {
  if (this.head === null) {
    this.head = element;
    this.tail = element;
  }
  else {
    element.next = this.head;
    this.head = element;
  }
  return this;
}


// Puts an element at the end of the LinkedList (pbq)
LinkedList.prototype.push = function(element) {
  if (this.head === null) {
    this.head = element;
    this.tail = element;
  }
  else {
    this.tail.next = element;
    this.tail = element;
  }
  return this;
}

// Removes first element from the beginning of the LinkedList and returns it (rtq)
LinkedList.prototype.shift = function() {
  if (this.head === null) return null;
  element = this.head;
  this.head = this.head.next;
  return element;
}

// Removes the last element from the end of the LL and returns it
LinkedList.prototype.pop = function() {
  if (this.head === null) return null;
  element = this.tail;
  this.tail = this.findByNext(element);
  if (this.tail != null) this.tail.next = null;
  return element;
}

// Returns the last element whose next points to the argument element
LinkedList.prototype.findByNext = function(element) {
  var result = null;
  var node = this.head

  while (node !== null) {
    if (node.next === element) result = node;
    node = node.next;
  }
  return result;
}

// Returns each element of a linked list sequentially
// LinkedList.prototype.each = function*() {
//   if (this.head === null) return null;
//   var element = this.head;

//   while (element !== null) {
//     yield element;
//     element = element.next;
//   }
// }

// Displays the contents of a LinkedList as an array
LinkedList.prototype.display = function() {
  if (this.head === null) return [];
  var array = new Array;
  var element = this.head;

  while (element !== null) {
    array.push(element.value);
    element = element.next;
  }

  return array;
}

// Tests array equality
function arraysEqual(a, b) {
  if (a === b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  for (var i = 0; i < a.length; ++i) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}


function TestData() {
  this.a = new LinkedList([1,2,3,4,5,6]);
  this.b = new LinkedList(["a",1,2,-3,54.5]);
  this.c = new LinkedList([0,1,2,2,1,0]);
  this.d = new LinkedList([]);
}

// TestData.prototype.each = function() {

// }

TestData.prototype.testDisplay = function() {
  console.log("Display Tests")
  console.log(this.a.display())
  console.log(arraysEqual(this.a.display(),[1,2,3,4,5,6]));
  console.log(arraysEqual(this.b.display(),["a",1,2,-3,54.5]));
  console.log(arraysEqual(this.c.display(),[0,1,2,2,1,0]));
  console.log(arraysEqual(this.d.display(),[]));
}

TestData.prototype.testUnshift = function() {
  console.log("Unshift Tests")
  console.log(arraysEqual(this.a.unshift(new Element(1)).display(),[1,1,2,3,4,5,6]));
  console.log(arraysEqual(this.b.unshift(new Element(2)).display(),[2,"a",1,2,-3,54.5]));
  console.log(arraysEqual(this.c.unshift(new Element(3)).display(),[3,0,1,2,2,1,0]));
  console.log(arraysEqual(this.d.unshift(new Element(1)).display(),[1]));
  console.log(arraysEqual(this.d.unshift(new Element(2)).display(),[2,1]));
}

TestData.prototype.testPush = function() {
  console.log("Push Tests")
  console.log(arraysEqual(this.a.push(new Element(1)).display(),[1,2,3,4,5,6,1]));
  console.log(arraysEqual(this.b.push(new Element(2)).display(),["a",1,2,-3,54.5,2]));
  console.log(arraysEqual(this.c.push(new Element(3)).display(),[0,1,2,2,1,0,3]));
  console.log(arraysEqual(this.d.push(new Element(1)).display(),[1]));
  console.log(arraysEqual(this.d.push(new Element(2)).display(),[1,2]));
}

TestData.prototype.testShift = function() {
  console.log("Push Tests")
  console.log(this.a.shift().value === 1);
  console.log(this.b.shift().value === "a");
  console.log(this.c.shift().value === 0);
  console.log(this.d.shift() === null);
}

TestData.prototype.testfindByNext = function() {
  console.log("findByNext Tests")
  var element = this.a.head
  while (element !== null) {
    console.log(this.a.findByNext(element.next) === element);
    element = element.next;
  }

  var element = this.b.head
  while (element !== null) {
    console.log(this.b.findByNext(element.next) === element);
    element = element.next;
  }

  var element = this.c.head
  while (element !== null) {
    console.log(this.c.findByNext(element.next) === element);
    element = element.next;
  }

  var element = this.d.head
  while (element !== null) {
    console.log(this.d.findByNext(element.next) === element);
    element = element.next;
  }
}

TestData.prototype.testPop = function() {
  console.log("Pop Tests")
  console.log(this.a.pop().value === 6);
  console.log(this.b.pop().value === 54.5);
  console.log(this.b.pop().value === -3);
  console.log(this.c.pop().value === 0);
  console.log(this.d.pop() === null);
}

//new TestData().testEach();
new TestData().testDisplay();
new TestData().testUnshift();
new TestData().testPush();
new TestData().testShift();
new TestData().testfindByNext();
new TestData().testPop();
