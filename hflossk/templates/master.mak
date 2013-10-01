<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${self.title()}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="RIT HFOSS course website" />
    <meta name="author" content="RemyD" />

    <!-- Le styles -->
    <link href="/static/css/bootstrap.css" rel="stylesheet" />
    <link href="/static/css/site.css" rel="stylesheet" />
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="/static/css/bootstrap-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="static/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="/static/img/favicon.png" />
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="/">HFOSS@RIT</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Fork me on <a target="_blank" href="http://github.com/decause/hflossk" class="navbar-link">Github</a>
            </p>
            <ul class="nav">
              <li><a href="/">Home</a></li>
              <li><a href="/about">About</a></li>
              <li><a href="/syllabus">Syllabus</a></li>
              <li><a href="/oer">Resources</a></li>
              <li><a href="/lectures">Lectures</a></li>
              <li><a href="/hw">Assignments</a></li>
              <li><a href="/decause">Instructor</a></li>
              <li><a href="/checkblogs">Participants</a></li>
              <li><a class="unstyled" target="_blank" href="http://webchat.freenode.net/?&amp;channels=rit-foss">Instant IRC</a></li>
              <li><a href="mailto:remydcsi@rit.edu">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
            <li class="nav-header"></li>
            <li><i class="icon-calendar"></i>08/26/2013 - 12/14/2013</li>
            <li><i class="icon-bell"></i>Mon &amp; Wed 5:00PM - 6:15PM</li>
            <li><i class="icon-shopping-cart"></i>4085.582.01</li>
            <li><i class="icon-map-marker"></i>Orange Hall (ORN)-1375</li>
            <li><i class="icon-envelope"></i>remydcsi[at]rit[dot]edu</li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class='span9'>
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
    <script src="/static/js/bootstrap-transition.js"></script>
    <script src="/static/js/bootstrap-alert.js"></script>
    <script src="/static/js/bootstrap-modal.js"></script>
    <script src="/static/js/bootstrap-dropdown.js"></script>
    <script src="/static/js/bootstrap-scrollspy.js"></script>
    <script src="/static/js/bootstrap-tab.js"></script>
    <script src="/static/js/bootstrap-tooltip.js"></script>
    <script src="/static/js/bootstrap-popover.js"></script>
    <script src="/static/js/bootstrap-button.js"></script>
    <script src="/static/js/bootstrap-collapse.js"></script>
    <script src="/static/js/bootstrap-carousel.js"></script>
    <script src="/static/js/bootstrap-typeahead.js"></script>

  </body>
</html>

<%def name="title()">HFOSS@RIT</%def>
