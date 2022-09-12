import Publish
import Plot

extension Theme where Site == Website {
  static var noah: Self {
    Theme(
      htmlFactory: ThemeHTMLFactory(),
      resourcePaths: ["Resources/Theme/styles.css"]
    )
  }

  private struct ThemeHTMLFactory: HTMLFactory {
    func header(for section: Website.SectionID?, in context: PublishingContext<Site>) -> Component {
      SiteHeader(context: context, selectedSectionID: section) {
        Div {
          List(context.site.socialItems) {
            ImageLink(url: $0.icon, destinationUrl: $0.destination, width: 44, height: 44, description: $0.name)
          }.class("social-list")

          Link("Download Resume", url: context.site.resumePath)
            .class("resume-link")
        }
      }
    }

    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
      HTML(
        .lang(context.site.language),
        .head(for: index, on: context.site),
        .body(
          .class("item-page"),
          .components {
            header(for: nil, in: context)
            Wrapper {
              Article {
                Div(index.content.body).class("content")
              }
            }
            SiteFooter()
          }
        )
      )
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
      HTML(
        .lang(context.site.language),
        .head(for: section, on: context.site),
        .body {
          header(for: section.id, in: context)
          Wrapper {
            Div(section.body).class("content")
            ItemList(items: section.items, site: context.site)
          }
          SiteFooter()
        }
      )
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
      HTML(
        .lang(context.site.language),
        .head(for: item, on: context.site),
        .body(
          .class("item-page"),
          .components {
            header(for: item.sectionID, in: context)
            Wrapper {
              Article {
                Div(item.content.body).class("content")
                ItemTagList(item: item, site: context.site)
              }
            }
            SiteFooter()
          }
        )
      )
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
      HTML(
        .lang(context.site.language),
        .head(for: page, on: context.site),
        .body {
          header(for: nil, in: context)
          Wrapper(page.body)
          SiteFooter()
        }
      )
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
      HTML(
        .lang(context.site.language),
        .head(for: page, on: context.site),
        .body {
          header(for: nil, in: context)
          Wrapper {
            H1("Browse all tags")
            List(page.tags.sorted()) { tag in
              ListItem {
                Link(tag.string,
                     url: context.site.path(for: tag).absoluteString
                )
              }
              .class("tag")
            }
            .class("all-tags")
          }
          SiteFooter()
        }
      )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
      HTML(
        .lang(context.site.language),
        .head(for: page, on: context.site),
        .body {
          header(for: nil, in: context)
          Wrapper {
            H1 {
              Text("Tagged with ")
              Span(page.tag.string).class("tag")
            }

            Link("Browse all tags",
                 url: context.site.tagListPath.absoluteString
            )
              .class("browse-all")

            ItemList(
              items: context.items(
                taggedWith: page.tag,
                sortedBy: \.date,
                order: .descending
              ),
              site: context.site
            )
          }
          SiteFooter()
        }
      )
    }
  }
}
