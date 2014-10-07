<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${self.title()}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="RIT HFOSS course website" />
    <meta name="author" content="RemyD" />

    <!-- Le styles -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/site.css" rel="stylesheet" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="static/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="${url_for('static', filename='img/favicon.png')}">
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">${course['name']}@${course['place']}</a>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li><a href="/syllabus">Syllabus</a></li>
          <li><a href="/resources">Resources</a></li>
          <li><a href="/lectures">Lectures</a></li>
          <li><a href="/assignments">Assignments</a></li>
          <li><a href="/instructor">Instructor</a></li>
          <li><a href="/participants">Participants</a></li>
          <li><a target="_blank" href="http://webchat.freenode.net/?&amp;channels=rit-foss">Instant IRC</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </nav>
    <!-- Fork me on GitHub Banner -->
    <a href="https://github.com/decause/hflossk">
      <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a6444d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png">
    </a>

    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="well">
            <ul class="list-unstyled">
              <li><span class="glyphicon glyphicon-calendar"></span> ${course['start']} &mdash; ${course['end']}</li>
              <li><span class="glyphicon glyphicon-bell"></span> ${course['times']}</li>
              <li><span class="glyphicon glyphicon-shopping-cart"></span> ${course['course']}</li>
              <li><span class="glyphicon glyphicon-map-marker"></span> ${course['location']}</li>
              <li><span class="glyphicon glyphicon-envelope"></span>
                <a href="mailto:${instructor['email']}">${instructor['email']}</a>
              </li>
            </ul>
          </div>
          ${self.doc_toc()}
        </div><!--/span-->
        <div class='col-md-9'>
          ${self.body()}
        </div>
      </div><!--/row-->

      <hr />

      <footer>
      </footer>

    </div><!--/.fluid-container-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/fxos.js"></script>

  </body>
</html>

<%def name="title()">${course['name']}@${course['place']}</%def>

<%def name="doc_toc()"></%def>
