# lexile_atos

`lexile_atos` is a Ruby Gem, as well as a CLI program to fetch the Lexile level, AR Reading Level, and AR points for a book from the ISBN.
This allows you to simply scan the barcode of a book and search for both in a single place!

## CLI

The CLI is very simple to use, with the only argument being the ISBN number.
If the first argument is `--help` or `-h`, a help message will be displayed,
otherwise the Lexile and Accelerated Reader databases will be searched for the provided ISBN.


[![lexile_atos CLI demo](https://asciinema.org/a/7YmVFJ9EpyTXU3FvZZsaeXaKf.svg)](https://asciinema.org/a/7YmVFJ9EpyTXU3FvZZsaeXaKf?autoplay=1)

## Gem

The `lexile_atos` Gem contains two modules, `Lexile` and `Atos`.
Each module consists of a single function: `search`.

The `search` function in the `Atos` module returns `nil` if nothing is found,
otherwise a `Book` object is returned with the following fields:

* `:level`: The ATOS Reading Level
* `:points`: The number of AR points

The `search` function in the `Lexile` module returns `nil` if nothing is found,
otherwise a hash is returned with information about the book.
This information is directly parsed from the Lexile schema:

* `"published_work"`: (Hash)
  * `"isbn"`: ISBN of the searched work (Int)
  * `"english_language_learner"`: Whether the book is for english language learners (Boolean)
  * `"copyright"`: Copyright year (Int)
  * `"published_work_id"`: Internal ID (String)
  * `"page_count"`: Number of pages in the book (Int)
  * `"binding"`: Way the book is bound (String, `"Trade Cloth"` for hardcover, `"Trade Paper"` for paperback, `"E-Book"` for an E-Book, and `"Library Binding"` for ???)
  * `"cover_art_url"`: Link to a cover art image (String)
* `"work"`: (Hash)
  * `"canonical_isbn"`: Canonical ISBN of the work (Int)
  * `"subcategories"`: Subcategories the book falls into (Array(String))
  * `"measurements"`: (Hash)
    * `<language>`: (Hash)
      * `"lexile"`: Lexile level of the book (Int)
      * `"lexile_code"`: ??? (String)
      * `"measurable"`: ??? (Boolean)
      * `"msl"`: ??? (Float)
      * `"mlf"`: ??? (Float)
      * `"structure_demand_percentile"`: ??? (???, nillable)
      * `"semantic_demand_percentile"`: ??? (???, nillable)
      * `"decoding_demand_percentile"`: ??? (???, nillable)
      * `"syntactic_demand_percentile"`: ??? (???, nillable)
  * `"max_age"`: Maximum age to recommend the book to (Int)
  * `"canonical_published_work_id"`: Internal ID (String)
  * `"title"`: Book title (String)
  * `"subject_tags"`: Tags applied to the work (Array(String))
  * `"vocab_words"`: Vocab words found within the work (Array(String))
  * `"has_vocab"`: Whether the book contains any high level vocabulary (Boolean)
  * `"chapter_measurements"`: ??? (Array(???))
  * `"series_name"`: Name of the series the book belongs to (String)
  * `"awards"`: ??? (Array(???))
  * `"authors"`: List of authors of the work (Array(String))
  * `"categories"`: Categories the work falls into (Array(String))
  * `"language"`: Language the work is written in (String)
  * `"summary"`: Summary of the work (String)
  * `"work_id"`: Internal ID (String)
  * `"additional_isbns"`: (Array)
    * `"isbn"`: ISBN of the additional work (Int)
    * `"copyright"`: Copyright year of the work (Int, nillable)
    * `"binding"`: Way the book is bound (String, same as above)
  * `"foundational_reading"`: (Hash)
    * `"token_count"`: ??? (???, nillable)
    * `"word_count"`: ??? (???, nillable)
    * `"unique_word_count"`: ??? (???, nillable)
    * `"sight_words"`: ??? (Array(???))
    * `"contractions"`: ??? (Array(???))
    * `"vowel_labels"`: ??? (???, nillable)
    * `"single_syllable"`: ??? (???, nillable)
    * `"multi_syllable"`: ??? (???, nillable)
    * `"oov"`: ??? (Array(???))
    * `"uncategorized"`: ??? (Array(???)
    * `"api_version"`: ??? (???, nillable)
    * `"chapters"`: ??? (Array(???))
  * `"recommended_books"`: ??? (Array(???))
  * `"author_storefront_url"`: ??? (???, nillable)
