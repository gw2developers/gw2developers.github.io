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
      threads = Dir.glob("_forum-backup/*.json").map do |json_file|
        JSON.parse(File.read(json_file))
      end

      threads.each do |thread|
        site.collections['forum-backup'].docs << ForumPage.new(site, site.source, File.join('forum-backup', Utils::slugify(thread['title'])), thread)
      end
    end
  end

end
