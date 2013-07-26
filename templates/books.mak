<%inherit file="master.mak" />

<ul>
  %for book in books:
    <li><a href="/static/books/${book}">${book}</a></li>
  %endfor
</ul>
