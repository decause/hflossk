<%inherit file="master.mak" />

<div class='jumbotron'>
    <h1>${participant_data['irc']}</h1>
    <p>${participant_data['name']}</p>
</div>
<div class="row">
    <div class="col-md-4">
        <img width="132" height="132" alt="${participant_data['name']}'s avatar" src="${gravatar(participant_data['rit_dce'] + '@rit.edu')}"/>
        <p>
            <h3><a href="${participant_data['blog']}"> Blog</a></h3>

            <h3>Forges</h3>
            <ul>
            %for forge_name in participant_data['forges']:
                <li><a href="${forge_name}">${forge_name}</a></li>
            %endfor
            </ul>
    </div>
</div>
