import Foundation
import Publish
import Plot

struct ItemList: Component {
  var items: [Item<Website>]
  var site: Website

  var sortedItems: [Item<Website>] {
    items.sorted {
      return ($0.metadata.priority ?? 0) > ($1.metadata.priority ?? 0)
    }
  }

  var body: Component {
    List(sortedItems) { ItemCard(item: $0, site: site) }
    .class("item-list")
  }
}

