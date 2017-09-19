module Jekyll

  class ForumPage < Page
    def initialize(site, base, dir, thread)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'forum.html')
      self.data['thread'] = thread
      self.data['title'] = thread['title']
      self.data['date'] = thread['pubDate']
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if Jekyll.env == 'production'
        threads = Dir.glob('_forum-backup/*.json').map do |json_file|
          JSON.parse(File.read(json_file))
        end

        threads.each do |thread|
          filename = File.join('forum-backup', Utils::slugify(thread['title']))
          site.collections['forum-backup'].docs << ForumPage.new(site, site.source, filename, thread)
        end
      end
    end
  end

end
