# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

# require 'scraperwiki'
require 'mechanize'

# Creamos un mechanize
agent = Mechanize.new
#
# # Read in a page
page = agent.get("http://www.congreso.es/portal/page/portal/Congreso/Congreso/Diputados?_piref73_1333056_73_1333049_1333049.next_page=/wc/menuAbecedarioInicio&tipoBusqueda=completo&idLegislatura=10")

diputados_link = []

while true
  diputados_link.concat(page.links_with(href: /fichaDiputado/))
  next_page_link = page.link_with(text: /Siguiente/)
  break if next_page_link == nil
  page = next_page_link.click
end

diputados_link.each do |diputado|
  page = diputado.click
  nombre_dip = page.search('div.nombre_dip').text
  curriculum = page.search('div#curriculum')
  
  twitter_dip = curriculum.links_with(href: /twitter/)
  twitter = twitter_dip ? twitter_dip.href : '-'
  email_dip = curriculum.search('a[href*=mailto]')
  email = email_dip ? email_dip.text.strip : '-'

  puts "nombre: '#{nombre_dip}', email: '#{email}' , twitter: '#{twitter}'"
end
#
# # Find somehing on the page using css selectors
#p page.at('div.listado1')
#
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "Perry", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries. You can use whatever gems are installed
# on Morph for Ruby (https://github.com/openaustralia/morph-docker-ruby/blob/master/Gemfile) and all that matters
# is that your final data is written to an Sqlite database called data.sqlite in the current working directory which
# has at least a table called data.



