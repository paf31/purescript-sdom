# purescript-static-dom

An experiment in replacing the virtual DOM and avoiding diffing.

## Motivation

Many web apps which use a virtual DOM don't actually require one (and might actually be faster without one).

Think about something like a typical web form. If you didn't have a virtual DOM, you would just lay out the form statically, set the initial attributes and text values, and add event handlers to update them. But the elements themselves wouldn't change. But this pattern works for a LOT of apps. The shape is static and only attributes and text change. Using CSS we can turn entire sections of the page off and on using classes, so that's covered too.

This library implements this idea.

## Limitations

The idea only falls apart when we need containers such as lists, but only if our lists are unbounded. For lists of known length, or even lists of bounded length, we can lay out the elements statically, and just hide the ones we don't need. Then we're back to simply updating attributes and text.

However, _if_ we really need lists of unbounded length - e.g. infinite scrolling - then we can recover it by diffing only the list length, and then reverting to a static shape per list element.

