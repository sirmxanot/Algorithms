// notice: function* instead of function
function* values() {
  for (var i = 0; i < arguments.length; i++) {
    yield arguments[i];
  }
}

var o = values(1, 2, 3);  // => [object Generator]

console.log(o.next());