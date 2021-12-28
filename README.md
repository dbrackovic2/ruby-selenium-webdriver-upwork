### Ruby automation testing framework for Upwork task 2
Automated tests for Upwork.com using Ruby + SeleniumWebdriver.

## Prerequisites
- ruby installed
- selenium-webdriver gem installed
- chromedriver and geckodriver added to system PATH

## How to check if browser drivers are in PATH
```
$ chromedriver --version
ChromeDriver 94.0.4606.61 (418b78f5838ed0b1c69bb4e51ea0252171854915-refs/branch-heads/4606@{#1204})
$ geckodriver --version
geckodriver 0.30.0 (d372710b98a6 2021-09-16 10:29 +0300)
$ whereis chromedriver
chromedriver: /usr/bin/chromedriver
$ whereis geckodriver
geckodriver: /usr/bin/geckodriver
```

## Run the tests
Test accepts two parameters:
1. driver - needs to be either "chrome" or "firefox"
2. keyword - can be whatever

Run tests in firefox with keyword c#:
```
ruby src/tests/test_case.rb_2 "firefox" "ruby"
```

Run tests in chrome with keyword ruby:
```
ruby src/tests/test_case_2.rb "chrome" "ruby"
```

## NOTE

