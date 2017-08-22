import Vapor
import Meow

final class Post: Model {
    var _id = ObjectId()
    
    /// The content of the post
    var content: String

    /// Creates a new Post
    init(content: String) {
        self.content = content
    }
}
