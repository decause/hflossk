<%inherit file="master.mak" />

<div class='hero-unit'>
  <h1>Course Texts</h1>
</div>
<ul>
  %for book in books:
    <li><a href="/static/books/${book}">${book}</a></li>
  %endfor
</ul>
