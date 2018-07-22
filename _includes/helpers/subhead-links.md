{% comment %}
This file is licensed under the MIT License (MIT) available on
http://opensource.org/licenses/MIT.
{% endcomment %}{% if filename %}<div class="subhead-links sourcefile" data-sourcefile="{{filename|uri_escape}}"
><a href="{{site.repo}}/edit/master/{{filename|uri_escape}}">{% translate subheadlinkedit developer-documentation %}</a>
| <a href="{{site.repo}}/commits/master/{{filename|uri_escape}}">{% translate subheadlinkhistory developer-documentation %}</a>
| <a href="{{site.repo}}/issues/new?body=Source%20File%3A%20{{filename|uri_escape}}%0A%0A">{% translate subheadlinkreport developer-documentation %}</a>
</div>
{% else %}
{% die "source filename not set" %}
{% endif %}
