{
  "layout": "post",
  "title": "Basics of Objective-C",
  "date": "2010-04-30T00:00:00+01:00",
  "description": "My notes from working through Assignment 1B of the Stanford iPhone development course",
  "tags": [
    "Objective-C"
  ]
}

## Objective-C 101

The second Stanford iPhone development course assignment focusses on understanding more Objective-C. At the time of writing the PDF is still available from the [Stanford CS193P][1] website.

## A simple command line script

The assignment is to create a simple command line script to make an introduction to Objective-C.

The first thing that was a little bit different for me was understanding main which basically functions a bit like a constructor class in PHP (excuse my Objective-C ignorance if this is totally wrong). Objective C is also upside down from what I'm used to so main comes at the end. 

    #import <Foundation/Foundation.h>
    - void PrintPathInfo() {
      // Code from path info section here
    }
    int main (int argc, const char * argv[]) { 
      NSAutoreleasepool * pool = [[NSAutoreleasePool alloc] init];
      PrintPathInfo(); 
      PrintProcessInfo(); 
      PrintBookmarkInfo(); 
      PrintIntrospectionInfo(); 

Syntax is more verbose from say Ruby so declaring a string is 

    NSString *path = @"~";

instead of 

    path = "~"

The whole NS thing relates to [NeXTSTEP][2], an operating system that Apple bought back in the day. The NS prefix has stuck around (I'm not really sure why) so pretty NS is everywhere in Objective C - NSLog, NSAutoreleasepool etc. 

## Creating the project

I'm on the iPhone 4.0 SDK and the menus had moved around a bit. To create a Foundation Command Line Tool go to Mac OSX > Application > Command Line tool and then select Foundation from the Type dropdown. 

![Creating a Foundation Command Line Tool][3] 

When you run the application you want the console up so you can see what's happening. You can access this via Run > Console

## Working through the tasks

There are four tasks in the assignment which relate to the functions in the code above. I found the following documentation really useful in understanding the requirements:

* [NSString documentation][4], especially [stringByExpandingTildeInPath][5] for the first task.
* [NSProcessInfo documentation][6] for the second task
* [NSMutableDictionary][7] for the third task
* [NSObject Protocol Reference][8] for the final task especially [isMemberOfClass][9], [isKindOfClass][10], [respondsToSelector][11] and [conformToProtocol][12]

## Outputting to the console

The task isn't sexy but helped me to understand Objective-C a lot more 

![Objective-C console][13]

## Source code

I've made the source code for my working through the examples available on [Github][14]. Bear in mind I'm starting out so I'm not suggesting this is best practice code.

[1]: http://www.stanford.edu/class/cs193p/cgi-bin/drupal/system/files/assignments/Assignment1B_0.pdf
[2]: http://en.wikipedia.org/wiki/NeXTSTEP
[3]: /images/articles/creating_a_foundation_command_line_tool.jpg
[4]: http://developer.apple.com/mac/library/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html
[5]: http://developer.apple.com/mac/library/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByExpandingTildeInPath
[6]: http://developer.apple.com/mac/library/documentation/Cocoa/Reference/Foundation/Classes/NSProcessInfo_Class/Reference/Reference.html
[7]: http://developer.apple.com/mac/library/documentation/Cocoa/Reference/Foundation/Classes/NSMutableDictionary_Class/Reference/Reference.html
[8]: http://developer.apple.com/mac/library/documentation/cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html
[9]: http://developer.apple.com/mac/library/documentation/cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/isMemberOfClass:
[10]: http://developer.apple.com/mac/library/documentation/cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/isKindOfClass:
[11]: http://developer.apple.com/mac/library/documentation/cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/respondsToSelector:
[12]: http://developer.apple.com/mac/library/documentation/cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/conformsToProtocol:
[13]: /images/articles/xcode_console.png
[14]: http://github.com/shapeshed/StanfordExamples
