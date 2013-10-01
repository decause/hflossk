<%inherit file="master.mak" />

<div class='jumbotron'>
  <h1>OER FTW</h1>
  <p>Open Educational Resources (For the Win)</p>
</div>
<div class="row">
    <div class="col-md-4 padded">
        <h2>Books</h2>
        <ul class="unstyled">
            %for book in books:
                <li><a href="/static/books/${book}">${book}</a></li>
            %endfor
        </ul>
    </div>
    <div class="col-md-4 padded">
        <h2>Decks</h2>
        <ul class="unstyled">
            %for deck in decks:
                <li><a href="/static/content/${deck}">${deck}</a></li>
            %endfor
        </ul>
    </div>
    <div class="col-md-4 padded">
        <h2>Challenges</h2>
        <ul class="unstyled">
            %for challenge in challenges:
                <li><a href="/static/challenges/${challenge}">${challenge}</a></li>
            %endfor
        </ul>
    </div>
</div>
