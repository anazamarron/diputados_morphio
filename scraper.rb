# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

# require 'scraperwiki'
require 'mechanize'

# Creamos un mechanize
agent = Mechanize.new
#
# # Read in a page
page = agent.get("http://www.congreso.es/portal/page/portal/Congreso/Congreso/Diputados?_piref73_1333056_73_1333049_1333049.next_page=/wc/menuAbecedarioInicio&tipoBusqueda=completo&idLegislatura=10")

page.links.each do |link|
 puts link.text
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



