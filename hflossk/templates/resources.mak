<%inherit file="master.mak" />

<div class='jumbotron'>
  <h1>OER FTW</h1>
  <p>Open Educational Resources (For the Win)</p>
</div>
<div class="row">
  % for res_type, res_list in resources.items():
    % if res_type is not 'links':
      <div class="col-sm-4 padded">
        <h2>${res_type}</h2>
        <ul class="list-unstyled">
          %for res in res_list:
            <li>
              <a href="/static/${res_type.lower()}/${res}"> ${res}</a>
            </li>
          %endfor
          %if res_type.lower() in resources['links']:
            %for res_name, res in resources['links'][res_type.lower()].items():
              <li>
                <a href="${res}">${res_name.replace("_", " ")}</a>
              </li>
            %endfor
          %endif
        </ul>
      </div>
    %endif
  % endfor
</div>
