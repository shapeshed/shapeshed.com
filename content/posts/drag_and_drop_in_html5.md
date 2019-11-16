+++
date = "2009-07-02T00:00:00+01:00"
description = "HTML 5 has the ability to create drag and drop events. This example only works in Firefox 3.5 and Safari 4 but here's a quick tour of how it works. "
tags = ["HTML5"]
title = "Drag and drop in HTML5"

+++

Not interested in the explanation? Go straight to the [demo page][1] or [download the source code][2] from Github

## Browser based computing

The more I explore HTML5 the more I feel that a browser based Operating System is coming sooner rather than later. Drag and drop is another important feature that will make this happen. Granted the spec is still work in progress but in Firefox 3.5 there is a workable API that developers can use and build UIs with. For this simple example I'm proposing that a user will want to drag a file to the trash. Later on I might take this further and implement a light client-side database using [storage][3], but for now you can only drag a file to the trash. This example only works in Firefox 3.5

## Creating the drag

To make an element draggable you can do this. 

    <li draggable="true" id="file1" ondragstart="drag(this, event)"><span>filename.txt</span></li>  

To create a draggable area you can do this. 

    <div id="trash" ondrop="drop(this, event)" ondragenter="return false" ondragover="return false"></div>    

Then you just need a bit of JavaScript to hook it all up 

    function drag(target, e) {
        e.dataTransfer.setData('Text', target.id);
    }
    function drop(target, e) {
        var id = e.dataTransfer.getData('Text');
        target.appendChild(document.getElementById(id));
        e.preventDefault();
    } 

## A dose of CSS3

[The example][1] also features CSS3 (border-radius, box-shadow, text-shadow, rgba) and @font-face embdding with the excellent [open source Junction font][4].

## Reservations

Because I'm a standards zealot I'm not sure about the inline javascript proposed in the spec. There is also a big issue about what happens for users who cannot use the mouse. These are all expected issues though that I hope will be ironed out. Great progress has been made already.

## Further reading

* [HTML5 Drag and Drop Working Draft][5]
* [Drag and Drop - MDC][6]

 [1]: /examples/drag-and-drop/
 [2]: http://github.com/shapeshed/HTML-5/tree/master
 [3]: http://dev.w3.org/html5/webstorage/#storage-0
 [4]: http://www.theleagueofmoveabletype.com/fonts/1-junction
 [5]: http://www.whatwg.org/specs/web-apps/current-work/#dnd
 [6]: https://developer.mozilla.org/En/DragDrop/Drag_and_Drop
