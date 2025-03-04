#!/usr/bin/env ruby
# frozen_string_literal: true

require 'mechanize'

HOME = File.expand_path('~')
LOGIN, PASSWORD = File.readlines("#{HOME}/sint.txt").map(&:strip)

agent = Mechanize.new
login_page = agent.get('https://lk.mysint.ru/login.php?in=1&page=10&rs_uri=')
login_form = login_page.form_with(action: '/login.php?in=1')
login_form.field_with(name: 'login').value = LOGIN
login_form.field_with(name: 'pass').value = PASSWORD
home_page = agent.submit(login_form)

def tag_content(page, tag, title)
  elements = page.search(tag)
  ind = elements.find_index { |el| el.content.eql?(title) }
  elements[ind.next].content
end

puts tag_content(home_page, 'td', 'Баланс:') if __FILE__ == $PROGRAM_NAME
