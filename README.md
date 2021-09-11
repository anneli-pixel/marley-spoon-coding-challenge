# Marley Spoon Coding Challenge

- My submission for Marley Spoon's [Coding Challenge](https://gist.github.com/carpodaster/446e53d4a4b727f3fce1dfabe1f70967).
- A simple web application that consumes data from Contentful and displays it in two views.
- Build with Sinatra.

### Running the app

Clone the repository and run `bundle install`.
To access Contentful set an environment variable with `export CONTENTFUL_ACCESS_TOKEN=add-access-token-here`.
Then run `bundle exec ruby app.rb` to start a local server on [http://localhost:4567](http://localhost:4567).

### Notes

I assumed that all recipe entries have titles, descriptions and images, and therefor don't check for their existence.

If there was more time I would have added tests to make sure that:

- `build_recipe_from_contentful_entry(entry)` can build a recipe from valid JSON
- `get_all_recipes` returns an array of Recipe objects
- `find_recipe_by(id)` returns a single Recipe object when given the id

Also due to time constraints I didn't move the `apply_markdown(text)` method into its own helper, as this would have required further refactoring.
