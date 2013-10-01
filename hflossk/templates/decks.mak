<%inherit file="master.mak" />

<div class='hero-unit'>
  <h1>Slide Decks</h1>
</div>
<div class="row-fluid">
    <div class="span4">
    <ul class="unstyled">
    %for deck in decks:
        <li><a href="/static/content/${deck}">${deck}</a></li>
    %endfor
    </ul>
    </div>
</div>
