import Foundation
import Publish
import Plot

struct ItemList<Site: Publish.Website>: Component {
  var items: [Item<Site>]
  var site: Site

  var sortedItems: [Item<Site>] {
    items.sorted { left, right in
      guard let leftMetadata = left.metadata as? Website.ItemMetadata,
              let rightMetadata = right.metadata as? Website.ItemMetadata else {
        return true
      }

      return (leftMetadata.priority ?? 0) > (rightMetadata.priority ?? 0)
    }
  }

  var body: Component {
    List(sortedItems) { item in
      let metadata = item.metadata as? Website.ItemMetadata

      return Article {
        Div {
          H1(Link(item.title, url: item.path.absoluteString)).class("left")
          if let url = metadata?.gitHubLink {
            Link("View On GitHub", url: url).class("right")
          } else if let url = metadata?.officialLink {
            Link("View Official Site", url: url).class("right")
          }
        }.class("splitscreen")
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
