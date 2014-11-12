deincrement
===========

An Emacs Lisp script for easily incrementing or decrementing numeric identifiers.

In some situations when I write code I find good use of identifiers like: aGoodNameForThing1. However, sometime it happends that I hit the wrong key. Then I need to correct it, which involves hitting the backspace key and then the right number key.

In other situations I need to go back to code an increment or decrement the value of the identifier. This is in particular tedious.

To make life a little easier I wrote this little Lisp script. What is does is to bind an increment function to ALT + UP Arrow and a decrement function on the ALT + DOWN Arrow. The script works for a range of values:

* increment "x123" becomes "x124" 
* increment "x123x" becomes "x124x" 
* increment "123x" becomes "124x"
* increment "x-123x" becomes "x-122x"
* decrement "100" becomes "99"
* increment "99" becomes "100" 

It could potentially also be extended to work on alphabetic characters making increment "A" become "B".