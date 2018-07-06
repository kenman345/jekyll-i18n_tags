# jekyll-i18n_tags

This [Jekyll](https://jekyllrb.com) plugin provides a simple tag for translating templates.

## Installation

Add the `jekyll-i18n_tags` gem to the `:jekyll_plugins` group in your `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll-i18n_tags', '~>1'
end
```

## Usage

Put the configuration and translations in your `_config.yml`:

```yaml
# Source language is optional. If set, translations to it will not be
# performed.
source_lang: en
translations:
  pl:
    Hello, world!: Witaj, świecie!
```

In your templates, use the `t` tag:

```liquid
{% t Hello, world! %}
```

For each page which uses the translation tag, you need to set `lang` variable (you may want to use [front matter defaults](http://jekyllrb.com/docs/configuration/#front-matter-defaults) to faciliate this).

## Advanced Usage

If you wish to separate out the translations from the `_config.yml` file and instead use a file in your `_data` folder, you can do this by adding the following to your `_config.yml` file.

```yaml
translations_source: [name of file without extension]
```

And in your `_data` folder, put move the contents of the `translations:` configuration into the root of the file. 

As an example, if your `_config.yml` file has the configuration `translations_source: languages`, then your `_data/languages.yml` file should like like the following:
```yaml
pl:
  Hello, world!: Witaj, świecie!
```

## Versioning

This project uses [semantic versioning](http://semver.org/).

## License

This software is licensed under [the MIT License](LICENSE).
