GLPM
====

A responsive view of GLP geared for mobile devices.

![Screenshot](https://raw.github.com/archaisch/glpm/master/public/images/glpm_screenshot.png)

About
-----

The thread listing pages of GLP are not comfortable to view on phones. This project is a very simple attempt to provide a minimalist responsive design for viewing on mobile devices. This project is not affiliated with Godlike Productions, GLP or Zero Point Ltd. Discussed on GLP in this [thread](http://www.godlikeproductions.com/forum1/message2381751/pg1).

Technical
---------

GLPM is a simple web application built with Ruby, HTML, JavaScript, and CSS. Since there isn't a published API, GLPM parses and renders the RSS feed content to render the mobile views.  Specifically, GLPM uses the following open source technologies:

- [Sinatra](http://www.sinatrarb.com/)
- [Nokogiri](http://nokogiri.org/)
- [jQuery](http://jquery.com/)
- [Bootstrap](http://getbootstrap.com/)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)

Usage
-----

You need Ruby and RubyGems installed. Only tested on *nix based systems.

Install the gems:

``` shell
gem install sinatra
gem install nokogiri
gem install sanitize
```

And run with:

``` shell
ruby main.rb
```

TODO
----

- Implement ability to view threads (possibly with pagination)
- Implement some type of caching mechanism for front and new thread pages