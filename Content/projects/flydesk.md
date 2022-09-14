---
priority: 1
tags: Enterprise, Internal, iPad, Objective-C
title: FlyDesk
description: Airline Point Of Sale/Document Storage
start: 2013
end: 2013
--- 

FlyDesk was created as a modular app that was initially comprised of a few components such as document viewing, and digital form management. It eventually gained additional capabilities, including limited messaging, and Point of Sale – based on that used by another project I worked on: [InFlight](/projects/inflight). All with the goal of helping digitize the cumbersome processes that had to be managed by airlines, their flight attendants, and their pilots.

I was heavily involved in many aspects of the app's early development – which included implementing and maintaining sync functionality, CoreData persistence, UI layout, and determining how best to provide PDF capabilities in an iPad application. At the time, Apple's provided libraries were far more limited then they are today, and while we initially tried to build upon them, we eventually opted to incorporate and customize [PSPDFKit](https://pspdfkit.com/).

At the time, logging libraries on iOS were also fairly limited – as such, I implemented a custom logger "plugin" that allowed our existing logging tool to communicate directly with our backend, along with implementing a backend Java REST service and accompanying web page to show the logs. In addition, I worked on bidirectional communication – such that a web admin could dynamically change the log level and log sync interval on a particular enterprise device.

### Technologies Used

**iOS**

* Objective-C (UIKit)
* Autolayout
* MVC
* NSOperations/Grand Central Dispatch for concurrency
* CoreData

**Backend**

* Java (Spring Framework)
