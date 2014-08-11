<%inherit file="master.mak" />

<div class='jumbotron'>
    <h1>${participant_data['irc']}</h1>
    <p>${participant_data['name']}</p>
</div>
<div class="row">
    <div class="col-md-4">
        <img width="132" height="132" alt="${participant_data['name']}'s avatar" src="${gravatar(participant_data['rit_dce'] + '@rit.edu')}"/>
        <h2><a href="${participant_data['blog']}"> Blog</a></h2>
        <p>
            %if 'github' in participant_data:
            <h2><a href="https://github.com/${participant_data['github']}">GitHub</a></h2>
            <iframe src="http://githubbadge.appspot.com/${participant_data['github']}" style="border: 0;height: 142px;width: 200px;overflow: hidden;" frameBorder="0"></iframe>
            %endif
            <h2>Forges</h2>
            <ul>
            %for forge_name in participant_data['forges']:
                <li><a href="${forge_name}">${forge_name}</a></li>
            %endfor
            </ul>
        </p>
    </div>
    <div class="col-md-8">
        <p>
            <h2>Bio</h2>
            %if 'bio' in participant_data:
            ${participant_data['bio']}
            %endif
        %if 'twitter' in participant_data:
        <h2>Twitterverse</h2>
        <a class="twitter-timeline"  href="http://twitter.com/${participant_data['twitter']}"  data-widget-id="369925299250544640" data-screen-name=${participant_data['twitter']}>Tweets by @${participant_data['twitter']}</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        %endif
        </p>
    </div>
</div>
