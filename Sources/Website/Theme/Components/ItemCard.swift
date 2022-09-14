import Foundation
import Publish
import Plot

struct ItemCard: Component {
  let item: Item<Website>
  let site: Website

  var body: Component {
    Article {
      Div {
        Div {
          Div {
            H1(Link(item.title, url: item.path.absoluteString))
            range.attribute(named: "style", value: "margin-left:10px")
          }

          externalLink
        }.class("item-title")

        Div {
          Paragraph(item.description)
        }
      }.class("item-card")

      ItemTagList(item: item, site: site)
    }
  }

  @ComponentBuilder
  var range: Component {
    let values = [item.metadata.start, item.metadata.end].compactMap { $0 }.joined(separator: " – ")

    if values.isEmpty {
      EmptyComponent()
    } else {
      Span(values)
    }
  }

  @ComponentBuilder
  var externalLink: Component {
    if let url = item.metadata.gitHubLink {
      Link("View On GitHub", url: url)
    } else if let url = item.metadata.officialLink {
      Link("View Official Site", url: url)
    }
  }
}
