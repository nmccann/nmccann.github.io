import Foundation
import Publish
import Plot

struct SiteHeader<Site: Publish.Website>: Component {
  var context: PublishingContext<Site>
  var selectedSelectionID: Site.SectionID?

  var body: Component {
    Header {
      Wrapper {
        Div {
          Div {
            Div {
              Link(context.site.name, url: "/")
                .class("left")
                .class("site-name")

              socialLinks.class("right")
            }
            .class("splitscreen")
          }.class("left")
          Div {
            if Site.SectionID.allCases.count > 0 {
              navigation
            }
          }.class("right")
        }.class("splitscreen")
      }.class("something")
    }
  }
}

private extension SiteHeader {
  var allSectionsAndHome: [Site.SectionID?] {
    var items: [Site.SectionID?] = [nil]
    items += Site.SectionID.allCases.map { .some($0) }
    return items
  }

  var navigation: Component {
    Navigation {
      List(allSectionsAndHome) { sectionID in
        let title: String
        let url: URLRepresentable

        switch sectionID {
        case let sectionID?:
          let section = context.sections[sectionID]
          title = section.title
          url = section.path.absoluteString

        case nil:
          title = "Home"
          url = "/"
        }

        return Link(title, url: url)
          .class(sectionID == selectedSelectionID ? "selected" : "")
      }
    }
  }

  @ComponentBuilder
  var socialLinks: Component {
    let iconSize = 44
    let items = [("/images/social/github.svg", "https://github.com/nmccann", iconSize, "GitHub"),
                 ("/images/social/linkedin.svg", "https://www.linkedin.com/in/noahmccann", iconSize, "LinkedIn"),
                 ("/images/social/stackoverflow.svg", "https://stackoverflow.com/users/1718458/arkcann", iconSize, "StackOverflow")]

    List(items) {
      ImageLink(url: $0.0, destinationUrl: $0.1, width: $0.2, height: $0.2, description: $0.3)
    }
    .class("social-list")
  }
}
