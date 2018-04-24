---
layout: page
title: Guides
permalink: /guides/
---

{% assign rows = site.guides.size | divided_by: 3.0 | ceil | minus: 1 %}
{% for i in (0..rows) %}
{% assign start = i | times: 3 %}
{% assign end = start | plus: 3 %}
  <div class="card-wrapper">
    {% assign guides = site.guides | slice:start,end %}
    {% for guide in guides %}
      <div class="card">
        <a href="{{ guide.url }}" title="{{ guide.title }}"></a>
        <img src="{{ guide.image }}">
        <div class="card__content">
          <h3 class="card__title">{{ guide.title }}</h3>
          <p class="card__text">{{ guide.summary }}</p>
        </div>
      </div>
    {% endfor %}
  </div>
{% endfor %}