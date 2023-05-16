# Sales Tax Calculator

This application calculates the sales taxes and generates a receipt for a given list of items. It applies a basic sales tax of 10% on all goods except for books, food, and medical products, which are exempt. Additionally, it applies an import duty sales tax of 5% on all imported goods.

# Requirements
Ruby 3.x

# Usage
1. Clone the repository or download the source code.

2. Open a terminal or command prompt and navigate to the project directory.

3. Run the following command to run the test suite with all the samples outputs:

```bash
bundle install && bundle exec rspec
```

In order to use this gem you need to build and install. To build do:
```bash
gem build tax.gemspec
```

After that you can install it:
```bash
gem install tax-0.1.0.gem
```

4. Run the following command to execute the application:

```bash
ruby sample_application.rb
```

The application will generate the receipts for the provided test inputs and display them in the terminal.

# Input Format
The application accepts input in the following format:

```
<quantity> <item> at <price>
<quantity>: An integer representing the quantity of the item.
<item>: The name of the item.
<price>: The price of the item.
The application supports items with multiple words in their names, such as "imported box of chocolates."
```

# Sample Output
The application produces the following outputs for the provided test inputs:

### Output 1
```yaml
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

### Output 2
```yaml
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

### Output 3
```yaml
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```
Please make sure to provide input in the specified format to get accurate results.

Feel free to modify the test inputs in the source code or add your own inputs to test the application (`sample_application.rb`) with different scenarios.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tax. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tax/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tax project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tax/blob/master/CODE_OF_CONDUCT.md).
