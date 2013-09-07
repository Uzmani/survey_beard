thomas = User.create(username: "thomas", password: "thomas")
george = User.create(username: "george", password: "george")

george_post = george.posts.create(title: "George's Post", url: "www.google.com")
george_post.comments.create(user: george, text: "i'm george")
george_post.comments.create(user: thomas, text: "i'm thomas")

thomas_post = thomas.posts.create(title: "Thomas' Post", url: "www.facebook.com")
thomas_post.comments.create(user: george, text: "i'm george")
thomas_post.comments.create(user: thomas, text: "i'm thomas")

#test