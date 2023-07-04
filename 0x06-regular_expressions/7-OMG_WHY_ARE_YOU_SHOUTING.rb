#!/usr/bin/env ruby

regex = /[A-Z]/
input = ARGV[0]

matches = input.scan(regex)
commit_word = matches.join('')

puts commit_word
