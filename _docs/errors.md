---
layout: page
---

Errors `4xx`

{% raw %}
```json
{
    "text": "{{text}}"
}
```
{% endraw %}


## List of errors
<dl>
    {% for error in site.data.errors %}
        <dt>{{error.text}} <code>{{error.code}}</code></dt>
        <dd><p>{{error.description}}</p></dd>
    {% endfor %}
</dl>