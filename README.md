# blog_api
---
Blog API is a simple rails blog engine that allows for blog posts, blog post authors, and blog comments. Below documents the current endpoints and how to use basic CRUD endpoints to interact with the api.

### Blog Post Endpoints

**GET all blog posts**

Send a GET request to the below endpoint to retrieve all blog posts

`/api/v1/blog_posts`

**GET one blog posts**

`/api/v1/blog_posts/:id`

**GET a blog post and all associated comments**

`/api/v1/blog_comments/:blog_post_id/blog_post_comments`


**POST to create a new blog post**

`/api/v1/blog_posts`

Because this particular application doesn't use authentication, you must supply blog_post_author_id of current author or blog_post_author_attributes to create a new author. Example parameters are listed below.

`{ blog_post: { title: 'test_title', body: 'test_body', blog_post_author_attributes: { name: "Duggan Roberts" } } }`

**PUT to update a blog post**

`/api/v1/blog_postsi/:id`

 { { blog_post: { title: 'updated title for post } } }

 **DELETE blog post**

 `/api/v1/blog_post/:id`

## BlogPostAuthor endpoints

**GET all authors**

`/api/v1/blog_post_authors`

**GET one author**

`/api/v1/blog_post_authors/1`

**GET all blogs pertaining to author**

`/api/v1/blog_post_authors/:author_id/author_blog_posts`

This will return all blog post that are associated to a particular author

**GET a list of all authors and their latest blog post**

`/api/v1/blog_post_authors/authors_latest_post`


**POST to create new author**

`/api/v1/blog_post_authors`

Example parameters:

`{ blog_post_author: { name: 'Duggan Roberts' } }`

**PUT to update an author**

`/api/v1/blog_post_authors/:id`

Same params as POST

**DELETE blog post author**

`/api/v1/blog_post_authors/:id`

## BlogComments enpoints

**GET all comments**

`/api/v1/blog_comments`

**GET one comment**

`/api/v1/blog_comments/:id`

**POST to create a new comment**

Because comments are associated with a blog post, you need to supply a blog_post_id within the params.

`/api/vi/blog_comments`

Example parameters:

` { blog_comment: { name: 'test_name', body: 'test_body', blog_post_id: post_id } }`

**PUT to update a comment**

`/api/v1/blog_comments/:id`

Example parameters provided below:

 `{ { blog_comment: { name: 'updated author name', body: 'updated body', blog_post_author_id: author.id } } }`

 **DELETE blog comment**

 `/api/v1/blog_comments/:id`
















