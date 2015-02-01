<%inherit file="../master.mak" />

<div class='jumbotron'>
  <h1>HW</h1>
  <p>"Work From Home" gets better later, promise.</p>
</div>
<div class="row-fluid">
    <div class="span4">
        <ul class="list-unstyled">
            <li><h2>Tasks</h2></li>
            %for hw in hws:
              % if hw.split('.')[1] == 'mak':
                <li>
                  <a href="/hw/${hw.split('.')[0]}">${hw.split('.')[0]}</a>
                </li>
              % else:
                <li><a href="/static/hw/${hw}">${hw}</a></li>
              % endif
            %endfor
        </ul>
    </div>
</div>
