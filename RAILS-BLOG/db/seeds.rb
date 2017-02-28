moderator = Moderator.create(
    fullname: "Shivam Goel",
    username: "shivamgoel1008@gmail.com",
    password: "vaibhavgl")
20.times do 
    post = Post.create(
        title: Faker::Lorem.sentence(20),
        content: Faker::Lorem.paragraph,
        publish: true,
        moderator: moderator
    )

    tag = Tag.create(name: Faker::Lorem.word)

    post_tag = PostTag.create(post: post, tag: tag)

    visitor = Visitor.create(fullname: Faker::Name.name, email: Faker::Internet.email)

    comment = Comment.create(message: Faker::Lorem.paragraph, status: [true,false].sample, post: post, visitor: visitor)

    message = Message.create(
        content: Faker::Lorem.paragraph,
        status: [true,false].sample,
        visitor: visitor
    )

    notifiable = [visitor,comment].sample

    notification = Notification.create(
        notifiable_id: notifiable.id,
        notifiable_type: notifiable.class.name
    )
end