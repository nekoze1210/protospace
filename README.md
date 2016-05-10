Protospace
====

##Overview
> User posts on prototype description with images, and other users put LIKE & TAGS

## Tables

### Prototypes
|title|catch_copy|concept|user_id|
|:---:|:--------:|:-----:|:-----:|
|string|string   |  text |reference|

### Users
|nickname|profile|position|occupation|
|:---:|:--------:|:-----:|:-----:|
|string|string   |  text |string|


### Images
|imageable_id|imageable_type|url |
|:----------:|:------------:|:--:|
|string      | string       |text|

### Comments
|text|user_id|prototype_id|
|:---:|:--------:|:-----:|
|text|reference|reference|

### Tags
- use gem ‘acts-as-taggable-on’

### Likes
|prototype_id|user_id|
|:-----:|:-----:|
|reference|reference|

## Asociation

### prototype
- belongs_to :user
- has_many :images, as: :imageable
- has_many :likes
- has_many :tags, through: :prototypes_tags


### user
- has_many :prototypes
- has_many :likes
- has_many :comments
- has_many :images, as: :imageable

### images
- belongs_to :resource, polymorphic: true

### comments
- belongs_to :prototype
- belongs_to :user

### likes
- belongs_to :prototype
- belongs_to :user


## Author
[daiki nagaoka](https://github.com/nekoze1210)