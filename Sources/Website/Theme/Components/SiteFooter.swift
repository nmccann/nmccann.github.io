import Foundation
import Publish
import Plot

struct SiteFooter: Component {
  var body: Component {
    Footer {
      Paragraph {
        Text("Generated using ")
        Link("Publish", url: "https://github.com/johnsundell/publish")
      }
    }
  }
}
