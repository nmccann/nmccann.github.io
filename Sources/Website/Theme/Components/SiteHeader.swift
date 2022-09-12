import Foundation
import Publish
import Plot

struct SiteHeader<Site: Publish.Website>: Component {
  var context: PublishingContext<Site>
  var selectedSectionID: Site.SectionID?
  @ComponentBuilder var trailingContent: ContentProvider

  var body: Component {
    Header {
      Wrapper {
        Div {
          Div {
            Div {
              Link(context.site.name, url: "/")
                .class("left")
                .class("site-name")

              trailingContent().class("right")
            }
            .class("splitscreen")
          }.class("left")
          Div {
            if Site.SectionID.allCases.count > 0 {
              navigation
            }
          }.class("right")
        }.class("splitscreen")
      }
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
          .class(sectionID == selectedSectionID ? "selected" : "")
      }
    }
  }
}
