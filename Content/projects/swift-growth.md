---
gitHubLink: https://github.com/nmccann/swift-growth
priority: 4
tags: Open Source, Mac, Swift
title: Swift Growth
subtitle: Natural Selection Simulator
start: 2021
end: Present
---

I've always had a fascination for neural networks and evolutionary processes in generall, so when I stumbled upon [this video](https://www.youtube.com/watch?v=N3tRFayqVtk) by [David Miller](https://github.com/davidrmiller) and his accompanying [biosim4](https://github.com/davidrmiller/biosim4) project, I was encouraged to finally take the opportunity to understand how these things worked at the implementation level.

The original project puts a number of "individuals" into a grid configured with a predefined challenge. A simple example of a challenge would be a barrier in the form of a vertical wall that slows movement from one side of the grid to another, coupled with a "win" condition that only allows individuals on one side of the grid to contribute their "genes" to the next generation. Natural selection works on initial randomness in the population, as well as random mutations introduced over time, to lead towards a population better suited for the challenge at hand.

My take on the project began as a simple port – the original having been written in C++ – to Swift, my preferred language. My reasoning for this was three-fold: Reading through an existing codebase helps one understand what is going on but that is no substitute for writing it yourself and having to troubleshoot problems along the way. Porting the project gave me an opportunity to grok it in a far deeper way as opposed to just looking through the repository. Secondly, I wanted to add interactivity to the simulation – the best way I knew how to do so was through app development. In this case, a Mac app. Thirdly, I wanted a foundation that would be structured to allow for the introduction of more capabilities over time.

The port was not without it's challenges – I had difficulty running the original project in my environment, and in the interest of time, opted to just start porting it blindly without the output of the original to compare. In hindsight that wasn't the best approach, but it encouraged me to both port the original's (limited) unit tests and to complement them with my own. This in turn encouraged a more testable design, which yielded that strong foundation I was looking for.

Once I had everything working (for the most part), I took the opportunity to "Swiftify" the project. This involved a number of changes, but most notably I did my best to move away from the reference-based, mutation-heavy implementation of the original and instead made use of value types where possible. This had the advantage of making it easy to implement a "history" feature, by keeping track of the values over time, which lets users see how the simulation has progressed. There are still improvements that can be made in that area, but the automatic isolation of one "step" of the simulation from another due to the use of value types has also proved beneficial in limiting bugs that are common when excessive mutation is allowed with reference types. 

## Example

> youtube https://youtu.be/xuBYo07KvsA

The above example challenges each individual to get to the far right quarter of the grid – only those who make it pass their genes to the next generation. At the beginning, they have only a ~20% survival rate, with this stabilizing around a ~30% survival rate. That isn't a great improvement, and illustrates a few things: In this particular challenge, luck is a huge factor. Where an individual spawns has the biggest influence on whether they live or die. This also highlights the impact of initial parameters – if the environment allows for success essentially _at random_, the population will be unlikely to develop complex approaches to overcome the challenges they face. That doesn't mean they don't develop at all – as we see, a gene for "moving right" becomes common in the population, but they don't really learn how to bypass the wall if it's in their way.

One of my big takeaways from working on this project was just how critical the right environment was to developing interesting characteristics in the population. I really enjoy trying to break down "why" they didn't develop in the way I thought that they would.

### Technologies Used

* Swift
* SpriteKit (for rendering of simulation)
* SwiftUI (for UI elements)
* Swift Package Manager
