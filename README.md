# StringSource

## Usage

1. Put your string resource file named as `strings.csv` into `tmp/` dir.
2. Execute `ruby -rbundler/setup -rstring_source -e 'StringSource.exec'`
3. Then you can use strings in `android/` and `ios/`

`strings.csv` should be like follows

```
name,ja,en
empty_search_items,キーワードを入れてください,Search articles with keywords
hint_search,キーワードを入力,Enter keyword
no_results_search,検索に一致する記事は見つかりませんでした,No results found
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
