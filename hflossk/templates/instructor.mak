<%inherit file="master.mak" />

<div class='jumbotron'>
    <h1>Teh Prof</h1>
    <p>Failing early and often, so you won't have to</p>
</div>
<div class="row">
    <div class="col-md-4">
        <h2>Elsewhere</h2>
        <img width="132" height="132" alt="${instructor['name']}'s avatar" src="${instructor['avatar']}"/>
        <ul class="list-unstyled">
        %for link in instructor['links'].values():
            <li><a href="${link}">${link}</a></li>
        %endfor
        </ul>
        % if instructor.get('openhub'):
          <a href="https://www.openhub.net/accounts/${instructor['openhub']}?ref=Tiny" target="_blank">
            <img alt="OpenHub profile for ${instructor['openhub']}" width="80" height="15" src="https://www.openhub.net/accounts/${instructor['openhub']}/widgets/account_tiny.gif" style="border: 0;" />
          </a>
        % endif
        % if instructor.get('coderwall'):
          <a href="https://coderwall.com/${instructor['coderwall']}"><img alt="Endorse ${instructor['coderwall']} on Coderwall" src="https://api.coderwall.com/${instructor['coderwall']}/endorsecount.png" /></a>
        % endif
    </div>
    <div class="col-md-8">
        <h2>Twitterverse</h2>
        <a class="twitter-timeline"  href="http://twitter.com/${instructor['twitter']}"  data-widget-id="369925299250544640" data-screen-name=${instructor['twitter']}>Tweets by @${instructor['twitter']}</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
    </div>
</div>
