---
layout: page
excerpt_separator: ''
---

<style>
.changelog-breaking { color: #FF9800; font-weight: bold; }
</style>

{% assign years = site.data.changelog | group_by_exp:"item", "item.date | date: '%Y'" %}

{% for changelog in years %}
## {{ changelog.name }}

{% for entry in changelog.items %}
### {{ entry.date | date_to_long_string }}
{{ entry.text | markdownify }}
<ul>
    {% for change in entry.changes %}
        <li>
            {% if change.endpoint %}
                {% for endpoint in change.endpoint %}<strong>{{ endpoint }}</strong>{% unless forloop.last %}, {% endunless %}{% endfor %}:
                {% if change.breaking %}
                    <span class="changelog-breaking">Breaking Change</span>  
                {% endif %}
                {{ change.text | markdownify }}
            {% else %}
                {{ change | markdownify }}
            {% endif %}
        </li>
    {% endfor %}    
</ul>
{% endfor %}
{% endfor %}
    