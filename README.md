Protospace
====

##Overview
> User posts on prototype description with images, and other users put LIKE & TAGS


> #### ※About Tag function
>This project will use gem ‘acts-as-taggable-on’


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
|prototype_id|   user_id    |url |
|:----------:|:------------:|:--:|
|reference   | reference    |text|

### Comments
|text|user_id|prototype_id|
|:---:|:--------:|:-----:|
|text|reference|reference|

### Likes
|prototype_id|user_id|
|:-----:|:-----:|
|reference|reference|

## Asociation

### prototype
- belongs_to :user
- has_many :images
- has_many :likes


### user
- has_many :prototypes
- has_many :likes
- has_many :comments
- has_many :images

### image
- belongs_to :prototype
- belongs_to :user

### comment
- belongs_to :prototype
- belongs_to :user

### like
- belongs_to :prototype
- belongs_to :user


## Author
[daiki nagaoka](https://github.com/nekoze1210)