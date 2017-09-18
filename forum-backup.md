---
layout: page
title: Forum Backup
permalink: /forum-backup/
---

Guild Wars 2 switched to a new forum software on September 12, 2017 and didn't migrate the old threads.
Since some of the discussions contained valuable information you can find a backup of the API Development forum here:

<style>
  .thread-table {
    width: 100%;
  }

  .thread-table td:nth-child(n+2) {
    text-align: right;
  }
</style>

{% assign threads = site.forum-backup | sort: 'date' %}
<table class="thread-table">
{% for thread in threads %}
{% assign discussion = thread.thread %}
  <tr class="forum-thread">
    <td><a href="{{ thread.url }}">{{ discussion.title }}</a></td>
    <td>{{ discussion.comments.size }} Comments</td>
    <td>{{ discussion.pubDate | date_to_string }}</td>
  </tr>
{% endfor %}
</table>
