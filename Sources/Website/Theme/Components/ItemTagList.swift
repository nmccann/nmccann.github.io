import Foundation
import Publish
import Plot

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

