<%inherit file="master.mak" />

<div class='jumbotron'>
  <h1>Slide Decks</h1>
</div>
<div class="row">
    <div class="col-md-4">
    <ul class="unstyled">
    %for deck in decks:
        <li><a href="/static/content/${deck}">${deck}</a></li>
    %endfor
    </ul>
    </div>
</div>
