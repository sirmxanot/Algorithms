// Define an Element Class
function Element(value){
  this.next = null;
  this.value = value;
}

// Define a LinkedList Class
function LinkedList(){
  this.head = null;
  this.tail = null;
}

// Puts an element at the beginning of the LinkedList (ptq)
LinkedList.prototype.unshift = function(element) {
  if (this.head == null) 
  {
    this.head = element;
    this.tail = element;
  }
  else
  {
    element.next = this.head;
    this.head = element;
  }
  return this
}

function test() {
  var ll = new LinkedList();
  var e1 = new Element(1);
  var e2 = new Element(2);

  ll.unshift(e1);
  ll.unshift(e2);
  console.log(ll);
}
test();
