import Foundation
import Publish
import Plot

struct ImageLink: Component {
  /// The URL of the image to render.
  var url: URLRepresentable

  /// The URL that the image should link to
  var destinationUrl: URLRepresentable

  /// Desired width for image
  var width: Int

  /// Desired height for image
  var height: Int

  /// An alternative text that describes the image in case it couldn't be
  /// loaded, or if the user is using a screen reader.
  var description: String

  var body: Component {
    Link(url: destinationUrl) {
      Image(url: url, description: description)
        .attribute(named: "width", value: String(width))
        .attribute(named: "height", value: String(height))
    }
  }
}

