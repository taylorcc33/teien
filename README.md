## Teien 　庭園

[Teien 庭園](https://ja.wikipedia.org/wiki/%E5%BA%AD%E5%9C%92) is one of several
Japanese words for "garden". Teien specifically connotes a kind of garden that
is conciously designed to be looked at, walked in, and generally enjoyed. They
will often have areas that mimic trees, ponds, and mountains as they occur
in nature. They are spaces created for meditation and solace.

This piece of software is meant to be a small digital haven of sorts,
specifically designed to suit my personal needs and whims. It is a static site
generator to craft a personal wiki of sorts. However, it could be modified and
in any number of ways to contain numerous additional features that are simply
extraneous to my wants.

## Installation

- Run `bundle install` to install necessary gems.
- Run `./bin/setup` to generate an html template

## Usage

The site content is written in basic markdown files, but with the addition of
a piece of meta information contained in frontmatter. These markdown files
are stored in the markdown directory.

After writing your markdown, simply run `./bin/gen` to convert your markdown
content files into html files. You can then run `rackup` to start a Rack
server to view your page.
