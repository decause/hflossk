<%inherit file="master.mak" />

<div class='hero-unit'>
  <h1>Course Texts</h1>
</div>
<div class="row-fluid">
    <div class="span4">
        <ul class="unstyled">
            <h2>Books</h2>
            %for book in books:
                <li><a href="/static/books/${book}">${book}</a></li>
            %endfor
        </ul>
    </div>
</div>
