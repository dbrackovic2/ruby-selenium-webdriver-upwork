### Ruby automation testing framework for Upwork
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

Run tests in chrome with keyword ruby:
```
ruby src/tests/test_case.rb "chrome" "ruby"
```
Run tests in firefox with keyword c#:
```
ruby src/tests/test_case.rb "firefox" "c#"
```

## NOTE
I had much difficulty with recaptcha, I wasn't able to bypass it at all, even after submitting successful recaptcha verification multiple times, it kept coming back.
Therefore I wasn't able to debug the last steps of the test case.
I tried tricking recaptcha with VPN or different browser size but no success.
Good luck checking my project :)
