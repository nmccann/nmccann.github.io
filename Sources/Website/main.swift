import Foundation
import Publish
import Plot
import CNAMEPublishPlugin
import YoutubePublishPlugin

struct Website: Publish.Website {
  enum SectionID: String, WebsiteSectionID {
    case projects
  }

  struct ItemMetadata: WebsiteItemMetadata {
    var gitHubLink: String?
    var officialLink: String?
    var priority: Int?
  }

  struct Social {
    var icon: URLRepresentable
    var destination: URLRepresentable
    var name: String
  }

  var url = URL(string: "https://noahmccann.com")!
  var name = "Noah McCann"
  var description = "Noah McCann – Father, iOS Developer, Gamer and More"
  var language: Language { .english }
  var imagePath: Path? { "images/logo.png" }
  var favicon: Favicon? { .init() }
  let socialItems: [Social] = [.init(icon: "/images/social/github.svg", destination: "https://github.com/nmccann", name: "GitHub"),
                               .init(icon: "/images/social/linkedin.svg", destination: "https://www.linkedin.com/in/noahmccann", name: "LinkedIn"),
                               .init(icon: "/images/social/stackoverflow.svg", destination: "https://stackoverflow.com/users/1718458/arkcann", name: "StackOverflow")]
  let resumePath: URLRepresentable = "/files/Noah-McCann-Resume.pdf"
}

try Website().publish(withTheme: .noah,
                      rssFeedConfig: .none,
                      deployedUsing: .gitHub("nmccann/nmccann.github.io",
                                             branch: "gh-pages",
                                             useSSH: true),
                      plugins: [.addCNAME(), .youtube()])

