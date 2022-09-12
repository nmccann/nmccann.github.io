import Foundation
import Publish
import Plot

struct ItemList: Component {
  typealias Site = Website
  var items: [Item<Site>]
  var site: Site

  var sortedItems: [Item<Site>] {
    items.sorted {
      return ($0.metadata.priority ?? 0) > ($1.metadata.priority ?? 0)
    }
  }

  var body: Component {
    List(sortedItems) { item in
      return Article {
        Div {
          H1(Link(item.title, url: item.path.absoluteString))
            .attribute(named: "style", value: "margin-right:10px;")

          if let url = item.metadata.gitHubLink {
            Span(" – ")
              .attribute(named: "style", value: "margin-right:10px;")
            Link("View On GitHub", url: url)
              .attribute(named: "style", value: "margin-right:10px;")
          } else if let url = item.metadata.officialLink {
            Span(" – ")
              .attribute(named: "style", value: "margin-right:10px;")
            Link("View Official Site", url: url)
              .attribute(named: "style", value: "margin-right:10px;")
          }
        }.attribute(named: "style", value: "display:flex;align-items:center;margin-bottom:20px")

        ItemTagList(item: item, site: site)
        Paragraph(item.description)
      }
    }
    .class("item-list")
  }
}

struct ItemTagList<Site: Publish.Website>: Component {
  var item: Item<Site>
  var site: Site

  var body: Component {
    List(item.tags) { tag in
      Link(tag.string, url: site.path(for: tag).absoluteString)
    }
    .class("tag-list")
  }
}
