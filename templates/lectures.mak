<%inherit file="master.mak" />

<div class='hero-unit'>
  <h1>LN</h1>
  <p>Lecture Notes: Agenda-y type things to keep the train on the tracks</p>
</div>
<div class="row-fluid">
    <div class="span4">
        <ul class="unstyled">
            <h2>Notes</h2>
            %for lecture in lectures:
                <li><a href="/static/lectures/${lecture}">${lecture}</a></li>
            %endfor
        </ul>
    </div>
</div>
