# Pushtalk

Pushtalk is a small command-line utility for drawing data from a Google Sheets CSV and sending it to the Talkpush API

## Installation

It depends on gems `httparty` and `redis`, therefore they need to be installed using the `bundle` command before use.

## Usage

For use, it's only necessary to execute the main program entry point, as such:

`$ ruby program.rb`

It'll print regular logging output on STDOUT and fatal issues on STDERR. For continuous operation, it's recommended to use `crontab`, such as:

`0 5 * * 1 ruby ${ROUTE}/program.rb`

For executing the script every Monday at 5 am.
