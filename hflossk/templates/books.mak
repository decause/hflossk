<%inherit file="master.mak" />

<div class='jumbotron'>
  <h1>Course Texts</h1>
</div>
<div class="row">
    <div class="col-md-4">
        <ul class="unstyled">
            <h2>Books</h2>
            %for book in books:
                <li><a href="/static/books/${book}">${book}</a></li>
            %endfor
        </ul>
    </div>
</div>
