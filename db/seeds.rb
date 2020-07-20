# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
title = "How was this blog styled?"
content = "This blog was styled entirely with Bulma.

<strong> What is Bulma?</strong>
Bulma is a free, open source CSS framework based on Flexbox and used by more than 200,000 developers.

<strong> What does the CSS file look like?</strong>
<pre>
 @import 'bulma';

.logo {
   width: 10vw;
   height: auto;
   min-width: 75px;
   max-width: 150px;
}
</pre>
<strong> And a custom scroll bar</strong>
<pre>
::-webkit-scrollbar {
   width: 10px;
 } 
::-webkit-scrollbar-track {
   background: #555; 
}
::-webkit-scrollbar-thumb {
   background: #ffdd57; 
   border-radius: 5px;
}
::-webkit-scrollbar-thumb:hover {
   background: #ffaf24; 
}
</pre>

That is it. This entire application was styled with Bulma."

post = Post.create(title: title, content: content)
Comment.create(name: 'Luke', content: "This is awesome!", post_id: post.id)
Comment.create(name: 'Bob', content: "This was created with 2 CSS lines. Wow!", post_id: post.id)
Comment.create(name: 'Bob', content: "Delete this comment", post_id: post.id)