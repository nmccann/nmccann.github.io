import Foundation
import Publish
import Plot

struct ItemDetail: Component {
  var item: Item<Website>
  var site: Website

  var body: Component {
    Article {
      title
      subtitle
      content

      ItemTagList(item: item, site: site)
    }
  }
}

private extension ItemDetail {
  var title: Component {
    Div {
      Div {
        H1(Link(item.title, url: item.path.absoluteString))
      }

      externalLink
    }.class("item-title")
  }

  var subtitle: Component {
    Div {
      H4(item.description)
      H4 { range }
    }.class("item-title")
  }

  var content: Component {
    Div(item.content.body).class("content")
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
