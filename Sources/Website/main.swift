import Foundation
import Publish
import Plot

struct Website: Publish.Website {
  enum SectionID: String, WebsiteSectionID {
    case projects
  }

  struct ItemMetadata: WebsiteItemMetadata {
  }

  var url = URL(string: "https://noahmccann.com")!
  var name = "Noah McCann"
  var description = "Noah McCann – Father, iOS Developer, Gamer and More"
  var language: Language { .english }
  var imagePath: Path? { "images/logo.png" }
  var favicon: Favicon? { .init() }
}

try Website().publish(withTheme: .noah,
                      deployedUsing: .gitHub("nmccann/nmccann.github.io",
                                             branch: "gh-pages",
                                             useSSH: true))
