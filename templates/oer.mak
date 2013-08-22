<%inherit file="master.mak" />

<div class='hero-unit'>
  <h1>Course Texts</h1>
</div>
<div class="row-fluid">
    <div class="span4">
        <h2>Books</h2>
        <ul class="unstyled">
            %for book in books:
                <li><a href="/static/books/${book}">${book}</a></li>
            %endfor
        </ul>
    </div>
    <div class="span4">
        <h2>Decks</h2>
        <ul class="unstyled">
            %for deck in decks:
                <li><a href="/static/content/${deck}">${deck}</a></li>
            %endfor
        </ul>
    </div>
    <div class="span4">
        <h2>Challenges</h2>
        <ul class="unstyled">
            %for challenge in challenges:
                <li><a href="/static/content/${challenge}">${challenge}</a></li>
            %endfor
        </ul>
    </div>
</div>
