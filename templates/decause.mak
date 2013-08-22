<%inherit file="master.mak" />

<div class='hero-unit'>
    <h1>Teh Prof</h1>
    <p>Failing early and often, so you won't have to</p>
</div>
<div class="row-fluid">
    <div class="span4">
        <h2>Places</h2>
    <img width="132px" height="132px" src="http://www.libravatar.org/user/5d9d0a14af042b2f7877ab58de9b7702ca29bb9d34155dc58eff4ff6509d562c.png"/>
        <ul class="unstyled">
        <%
            links = ['http://foss.rit.edu/blog/decause',
                     'http://linkedin.com/in/decause',
                     'http://github.com/decause',
                     'http://opensource.com/users/remyd',
                    ]
        %>
        %for link in links:
            <li><a href="${link}">${link}</a></li>
        %endfor
        </ul>
    <a href='https://www.ohloh.net/accounts/40757?ref=Tiny' target='_blank'>
        <img alt='Ohloh profile for RemyD' border='0' height='15' src='https://www.ohloh.net/accounts/40757/widgets/account_tiny.gif' width='80' />
    </a>
    <a href="https://coderwall.com/decause"><img alt="Endorse decause on Coderwall" src="https://api.coderwall.com/decause/endorsecount.png" /></a>
    </div>
    <div class="span8">
    <h2>Twitterverse</h2>
    <a class="twitter-timeline"  href="https://twitter.com/Remy_D"  data-widget-id="369925299250544640">Tweets by @Remy_D</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>
