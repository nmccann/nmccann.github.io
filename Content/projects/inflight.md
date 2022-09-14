---
priority: 0
tags: Enterprise, Internal, iPhone, iPad, Objective-C
title: InFlight
description: Airline Point Of Sale
start: 2012
end: 2013
---

InFlight was an early iOS application that gave flight attendants Point of Sale capabilities even when in the air. This required offline functionality and a novel bluetooth syncing mechanism that ensured one particular device collected all of the relevant information from the many that might be used on a single plane. This particular device was then tasked with uploading that information once connected to the internet (at the time, internet connectivity on board was rare and expensive, nowadays it's seemingly just expensive).

I joined the InFlight team (at the time, just 2-3 developers) relatively late in it's development, and was initially tasked with bug fixes and minor UI updates. As time progressed however, we were given the opportunity to port the application to iPads which involved a fairly substantial UI redesign to make better use of the available space. 

While the iPad redesign had it's challenges, it was largely cosmetic. The largest functional improvement I contributed to was the implementation of "combos" within the app. A combo was defined as a set of "combo categories" each with it's own list of compatible products, as well as a price for the fully configured combo. 

To demonstrate the combo functionality, an example would help. Consider a "Chips and Drink" combo - the app would allow users to choose one of many types of chips to complete the "Chips" combo category, while also allowing the selection of one of many types of drinks. Even if the individual items had different prices, the overall combo would always have the same price. This functionality required a number of changes to our existing CoreData model, as well as improvements to our syncing capabilities to maintain the relationships between the "combo" and the items that it contained (which were synced via a separate API). On top of those functional changes, the feature required an intuitive UI that worked well with our existing product selection screens. It was a challenging feature to implement, but one that helped to solidify my understanding of many development concepts (particularly CoreData, and concepts like cascade deletes).

### Technologies Used

**iOS**

* Objective-C (UIKit)
* NSOperations/Grand Central Dispatch
* CoreData

**Backend**

* Java (Spring Framework)
