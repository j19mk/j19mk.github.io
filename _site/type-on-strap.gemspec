# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "Github"
  spec.version       = "2.4.12"
  spec.authors       = ["Jane"]
  spec.email         = ["minkyungpark19@gmail.com"]

  spec.homepage      = "https://github.com/j19mk"
  spec.license       = "MIT"

  spec.rdoc_options            = ["--charset=UTF-8"]
  spec.extra_rdoc_files        = %w(README.md LICENSE)
  spec.metadata["plugin_type"] = "theme"

  spec.files                   = Dir["**/*"].select do |f|
    f.match(%r!^(assets/(js|css|fonts|data)/|_(includes|layouts|sass)/|_data/(icons_builder.yml|language.yml)|(LICENSE|README.md))!i)
  end


  spec.required_ruby_version   = ">= 2.7.2", "< 4.0"

  spec.add_runtime_dependency "jekyll", ">= 3.8", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", ">= 0.15.1", "<= 0.17"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1.0"
  spec.add_runtime_dependency "jekyll-seo-tag", ">= 2.7.1", "<= 2.8"
end
