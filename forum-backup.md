---
layout: page
title: Forum Backup
permalink: /forum-backup/
---

{% assign threads = site.forum-backup | sort: 'date' %}
{% for thread in threads %}
{% assign discussion = thread.thread %}
  <div>
    <a href="{{ thread.url }}">{{ discussion.title }}</a> ({{ discussion.comments.size }} Comments)
  </div>
{% endfor %}
