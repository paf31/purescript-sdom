# purescript-sdom

An experiment in replacing the virtual DOM and avoiding diffing.

- [Counter Example](examples/counter)
- [Select Example](examples/select)
- [Task List Example](examples/todo)
- [Module Documentation](generated-docs/)

## Motivation

The virtual DOM (VDOM) has become a very popular approach to developing applications
in the browser, popularized by libraries like React. A simplified VDOM approach can be
summarized briefly as follows:

- Choose a type `state` of _application states_.
- Write a function `state -> VDOM` from application states to a virtual DOM
  representation of the UI.
- Each time we reach a new state, use a function `diff :: VDOM -> VDOM -> Patch` to
  compute the changes to the rendered virtual DOM.
- Use a function `Patch -> Eff (dom :: DOM) Unit` to _apply_ those changes to
  the real DOM.

The VDOM approach has many benefits. However, many web apps which use a
VDOM don't actually require one.

Consider something like a web form which might contain text inputs and validation
messages. If you didn't have a virtual DOM, you would just lay out the form statically,
set the initial attributes and text values, and add event handlers to update them.
The elements themselves would never change.

A VDOM approach in this case might be considered overkill - why should I have to
diff two trees of components in order to update a simple label, when I can always
easily figure out which label to update.

A key benefit of the VDOM is that it hides the complexity of the DOM API behind
a simpler API with a clean denotation: an application is a function from states
to a conceptual representation of the UI. However, operationally it is very heavy.
The potential problem is that the `diff` function above might be quite expensive
to compute. With well-chosen keys on every node, it might be possible to tune this
computation, but there are other options available.

This library introduces the SDOM, or "static DOM". The idea is that by restricting
components so that the "shape" of the UI becomes static, we can keep the clean
denotation of the VDOM approach, but simplify the operational side dramatically.
The SDOM consists of a static tree of components, with only the leaves (text nodes and
attributes) changing over time. The SDOM approach also allows for limited forms of dynamic
behavior, such as a component which renders a (uniform) array of subcomponents.

In practice, this is not so much of a restriction, and the limited form of dynamic behavior
is enough to emulate most common UI patterns. Indeed, working with the SDOM is quite
reminiscent of template-based approaches to UI development, but keeping the "one
way binding" approach which is commonly associated with the VDOM.
