---
layout: post
title: Tech Stuff example
color: rgb(250, 50, 50)
feature-img: "assets/img/feature-img/circuit.jpeg"
thumbnail: "assets/img/thumbnails/feature-img/circuit.jpeg"
tags: [example]

---

Let's demo some code snippet, with some mermaid diagrams.
Because if you put some code in your blog, you would at least make it:
1. Searchable
2. Good-looking

## Search on code

Search should be working even for complicated escape symbols.

```bash
sed -i 's/\"hostname\"\:.*$/\"hostname\"\: \"'$IPADDR'\"\,/g' open-falcon/agent/config/cfg.json
```

Or try searching for partial of a command, like this article should be returned when looking for "find grep"

```bash
find /etc -type f -exec cat '{}' \; | tr -c '.[:digit:]' '\n' | grep '^[^.][^.]*\.[^.][^.]*\.[^.][^.]*\.[^.][^.]*$'
```

## Code highlighting examples

Because you might put code in your blog post, and you want to make sure it will look good in here. Plus that the search
function will still be working!

### XML

Example from [W3C]
```xml
<part number="1976">
  <name>Windscreen Wiper</name>
  <description>The Windscreen wiper
    automatically removes rain
    from your windscreen, if it
    should happen to splash there.
    It has a rubber <ref part="1977">blade</ref>
    which can be ordered separately
    if you need to replace it.
  </description>
</part>
```

### Java

java example

```java
import java.util.*;

@Example
public class Demo {
  private static final String CONSTANT = "String";
  private Object o;
  /**
   * Creates a new demo.
   * @param o The object to demonstrate.
   */
  public Demo(Object o) {
    this.o = o !== null ? o : new Object();
    String s = CONSTANT + "Other example of text";
    int i = 123 - 33 % 11;
  }
  public static void main(String[] args) {
    Demo demo = new Demo();
    System.out.println(demo.o.toString())
  }
}
```

### Javascript

```javascript
/**
 * Does a thing
 */
function helloWorld(param1, param2) {
    const example = `hello ${param1}`
    var something = {
        key: "value",
        number: 1
    };

    // Do something
    if (2.0 % 2 == something) {
        console.log('Hello, world!');
    } else {
        return null;
    }

    // TODO comment
}
```

### JSON

```json
{
  "animals": {
    "tiger": {
      "name": "tiger",
      "images": ["🐯", "🐅", "⻁"]
    },
    "turtle": {
      "age": 126,
      "image": "🐢"
    },
    "unicorn": {
      "doesExist": true,
      "image": "🦄"
    }
  }
}
```

### Python

```python
import os


def some_function(param_one="", param_two=0):
    r'''A docstring'''
    if param_one > param_two:  # interesting
        print("Greater")
    return (param_two - param_one + 1 + 0b10) or None


class SomeClass:
    """ dunno what I am doing """

    def __init__(self):
        pass
```

### YAML

You can also render some yaml, like this `_config.yml`:

```yml

# Welcome to Jekyll!
#
# This config file is meant for settings that affect your whole blog, values
# which you are expected to set up once and rarely edit after that. If you find
# yourself editing this file very often, consider using Jekyll's data files
# feature for the data you need to update frequently.
#
# This file, "_config.yml" is *NOT* reloaded automatically when you use
# 'bundle exec jekyll serve'. If you change this file, please restart the server process.

# Site settings
# These are used to personalize your new site. If you look in the HTML files,
# you will see them accessed via {{ site.title }}, {{ site.email }}, and so on.
# You can create any custom variable you would like, and they will be accessible
# in the templates via {{ site.myvariable }}.

# SITE CONFIGURATION
baseurl: "/Type-on-Strap"
url: "https://sylhare.github.io"

# THEME-SPECIFIC CONFIGURATION
title: Type on Strap                                    # site's title
description: "A website with blog posts and pages"      # used by search engines
avatar: assets/img/triangle.png                         # Empty for no avatar in navbar
favicon: assets/favicon.ico                             # Icon displayed in the tab

remote_theme: sylhare/Type-on-Strap                     # If using as a remote_theme in github
```

[W3C]: https://www.w3.org/standards/xml/core
