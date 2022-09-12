---
officialLink: https://www.teesnap.com/
priority: 2
tags: Enterprise, Public, iPad, Swift, Objective-C
---

# Teesnap

To date, Teesnap – a Golf Course Management Application – has been the longest project I was ever involved in – from 2013 to 2020. During this time I helped it grow from a nascent proof of concept, into a full fledged production application that was being used at many locations. 

The purpose of this application was to provide Point of Sale, Teesheet and Customer Management capabilities to golf course operators and employees, in a mobile form factor that would allow for business to be done regardless of physical location across the golf course's grounds. Over time, the application also grew to fulfill additional roles such as Food and Beverage.

Objective-C was used for the first few years of the project, however I pushed hard for the eventual move towards a codebase that largely made use of Swift – partly to leverage Swift's improved type and compile-time safety, but also because over time we were seeing the pool of available Objective-C developers dwindle. This shift also allowed us to start incorporating a Model-View-View-Model (MVVM) architecture, along with Functional Reactive Programming (FRP, using ReactiveObjC and ReactiveSwift). 

The decision to migrate towards MVVM and FRP were not taken lightly. While Objective-C to Swift represented a syntactic change, fundamentally one _could_ write Swift code very similar to it's Objective-C counterpart (though so-called "Swift-y" code is preferred). MVVM and FRP were quite a conceptual leap from the Model-View-Controller architecture we had previously used, and the imperative programming that accompanied it. As a result, I heavily researched the topic and available implementations before migrating a subset of our app's functionality, then frequently discussed the topic with other iOS developers on the project while also providing assistance on code reviews. The shift was complicated, but began to pay off when we were able to greatly simplify our poll-based syncing (and improve it's robustness). I was also incredibly happy with the FRP-based Customer Search functionality, which seamlessly hit a local Realm-persisted customer list for increased responsivenss, before making a REST API-based search that it then used to update both the UI and the Realm-persisted list. These were things that – while possible – were almost always fraught with bugs due to the complexity of the resulting multithreaded code.

To further reap benefits from our move to MVVM, we began to unit test our view model layer – something which was impractical to do with the previous imperative Model-View-Controller approach. This drove great leaps in our already respectable code coverage, and helped to reinforce our understanding of MVVM and FRP, while simultaneously helping mitigate (though not eliminate) the risk of regressions going forward.

One of the last features we were experimenting with during my time on the project, was one made easier by the shift to MVVM/FRP – realtime updates. I was involved in implementing the iOS side of a Firebase proof of concept, which replaced portions of our poll-based syncing with Firebase's realtime updates, with relatively minimal changes we were able to feed these updates into the existing signals and start to provide these immediate updates to the UI.

Outside of the day-to-day programming challenges that I faced, I also took on a leadership role during this project, as well as involvement in the backend development. In addition, we instituted what we termed "Batman and Robin" release roles, which I frequently took on. In these roles (which rotated through many of the team members), the "Batman" was tasked with managing the release, ensuring QA's reports are addressed, and that fixes go into the right places (particularly important as we began to have concurrent releases), all while bringing the "Robin" up to speed, so that they may take on the "Batman" role in the subsequent release.

On the subject of releases, I was responsible for managing our CI pipeline, which made heavy use of Fastlane and Ruby scripts to replace the older (more difficult to maintain) Bash scripts that the project began with. 

Examples of the UI and functionality (much of which is as it was during my time on the project), can be found at the official site [here](https://www.teesnap.com/why-teesnap/point-of-sale/), and [here](https://www.teesnap.com/why-teesnap/tee-sheets/), with the last feature I worked on – Food and Beverage – found [here](https://www.teesnap.com/why-teesnap/food-and-beverage/).
