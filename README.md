
# blog_api

Blog_API is a simple api backend that allows for blog posts, blog post authors, and blog comments. Authentication is not provided so anyone, or anything, can use the available CRUD endpoints :scream: .

Below outlines how to use the CRUD endpoints for blog_api.

Try blog_api out using the link below:

[https://serene-woodland-61626.herokuapp.com/](https://serene-woodland-61626.herokuapp.com/)

Link to retrieve all blog posts:

```
https://serene-woodland-61626.herokuapp.com/api/v1/blog_posts
```

Example JSON data is available within the postman_logs folder. **For both PUT and DELETE, a no response code is returned**. Logs are not provided for those endpoints. There are mixed suggestions regarding is an 200 response status needs to be sent back upon success.

Considerations:

 Due to lack of support from gem authors, ActiveModel::Serializer and gems like it were not used for blog_api.


Installation
------------

 RSpec request test have been broken into separate spec files. What's important, tests have been written.

```bash
git clone https://github.com/curatingbits/blog_api.git
```

```bash
cd blog_api
```

```bash
bundle install
```

```bash
rake db:create
```

```bash
rake db:migrate
```

**optional**
```bash
To seed the database, use `rake db:seed`.
```

### Tests

To run the RSpec test suite use the following command:

```bash
rspec spec
```

Rubocop linter has been configured.

```bash
gem install rubocop
```

```bash
bundle exec rubocop
```

### Blog Post Endpoints

**`GET` - all BlogPost records**

 > Send a GET request to the below endpoint to retrieve all BlogPost.

 ```
 /api/v1/blog_posts
 ```

**`GET` - show BlogPost record**
```ruby
/api/v1/blog_posts/:id
```

**GET - show BlogPost and all associated BlogPostComments**

> This is a non CRUD action, retrieves a single BlogPost and all BlogPostComments

```
/api/v1/blog_comments/:blog_post_id/blog_post_comments
```


**`POST` - create BlogPost record**

```
/api/v1/blog_posts
```

> Authentication has not been implemented, you must supply blog_post_author_id of current author or blog_post_author_attributes to create a new author. If the author exists, the post will find and associate the new post to the author. Authors example parameters are listed below.

```
{ blog_post: { title: 'test_title', body: 'test_body', blog_post_author_attributes: { name: "Duggan Roberts" } } }
```

**`PUT` - update BlogPost record**

```ruby
/api/v1/blog_posts/:id
```

```
 { { blog_post: { title: 'updated title for post } } }
```
 **DELETE - BlogPost record**

 ```ruby
 /api/v1/blog_post/:id
 ```

## BlogPostAuthor endpoints

**`GET` - all BlogPostAuthor records**

```
/api/v1/blog_post_authors
```

**`GET` - show BlogPostAuthor record**

```
/api/v1/blog_post_authors/1
```

**`GET` - show BlogPost pertaining to BlogPostAuthor**

> **This is a non CRUD action that's available to retrieve a blog post pertaining to BlogPostAuthor**

```
/api/v1/blog_post_authors/:author_id/author_blog_posts
```

**`GET` - list all BlogPostAuthor and the most current BlogPost record**

> **This is a non CRUD action, retrieves a list of BlogPostAuthor and the most recent BlogPost**

```
/api/v1/blog_post_authors/authors_latest_post
```


**`POST` - create BlogPostAuthor record**

```
/api/v1/blog_post_authors
```

Example parameters:

```
{ blog_post_author: { name: 'Duggan Roberts' } }
```

**`PUT` - update BlogPostAuthor record**

```
/api/v1/blog_post_authors
```

Example parameters:

```
{ blog_post_author: { name: 'Duggan Roberts' } }
```

**`DELETE` - BlogPostAuthor record**

```
/api/v1/blog_post_authors/:id
```

## BlogComments enpoints

**`GET` - list of all BlogComment records**

```
/api/v1/blog_comments
```

**`GET` - show BlogComment record**

```
/api/v1/blog_comments/:id
```

**`POST` - create new BlogComment record**

```
/api/vi/blog_comments
```
> Example parameters:
> Because comments are associated with a blog post, you need to supply a blog_post_id.


```
{ blog_comment: { name: 'test_name', body: 'test_body', blog_post_id: post_id } }
```

**`PUT` - update BlogComment record**

`/api/v1/blog_comments/:id`

Example parameters provided below:

 ```
 { { blog_comment: { name: 'updated author name', body: 'updated body', blog_post_author_id: author.id } } }
 ```

 **`DELETE` - BlogComment record**

 ```
 /api/v1/blog_comments/:id
 ```
