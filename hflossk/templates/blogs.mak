<%inherit file="master.mak" />
<head>
    <script src="/pace/pace.js"></script>
  <link href="/pace/themes/pace-theme-barber-shop.css" rel="stylesheet" />
</head>

<div class="jumbotron">
  <h1>Participants</h1>
  <p>Should have ${int(target_number)} blog posts</p>
  <!--<p><a href="#" class="btn btn-primary btn-lg">Generate Report&raquo;</a></p>-->
</div>

<div class="row">
  %for student in student_data:
    <div class="col-sm-4">
      <div class="shadowcard padded">
        <div>
          <img class="uglymug pull-left" src="${gravatar(student['rit_dce'] + '@rit.edu')}" alt="${student['irc']}'s Avatar" />
          <h4 class="item">${student['irc']}</h4>
          <div class="item blog clearfix">
            <a target="_blank" href="${student['blog']}">Blog</a>
            <span class="label label-${'success' if student_posts[student['irc']] >= target_number else 'warning' if student_posts[student['irc']] >= target_number*.8 else 'danger'}">${student_posts[student['irc']]}</span>
          </div>
        </div>
        <ul class="cardlist list-unstyled">
          % for geordi in student['forges']:
            <li><a target="_blank" href="${geordi}">${geordi}</a></li>
          %endfor

          % if student_quizes.get(student['irc']):
            <li><a target="_blank" href="${student_quizes[student['irc']]}">Quiz1</a></li>
          % else:
            <li class="redtext">quiz1?</li>
          % endif

          % if student_litreview1.get(student['irc']):
            <li><a target="_blank" href="${student_litreview1[student['irc']]}">litreview1</a></li>
          % else:
            <li class="redtext">litreview1?</li>
          % endif

          % if student_bugfixes.get(student['irc']):
            <li><a target="_blank" href="${student_bugfixes[student['irc']]}">bugfix</a></li>
          % else:
            <li class="redtext">bugfix?</li>
          % endif

          % if student_commarches.get(student['irc']):
            <li><a target="_blank" href="${student_commarches[student['irc']]}">Commarch Report</a></li>
          % else:
            <li class="redtext">commarch?</li>
          % endif

          % if student_teamproposals.get(student['irc']):
            <li><a target="_blank" href="${student_teamproposals[student['irc']]}">Team Proposal</a></li>
          % else:
            <li class="redtext">Team Proposal?</li>
          % endif

          <!--This block used for quick grading reference ;)
          % if student_names.get(student['irc']):
            <li>${student_names[student['irc']]}</li>
          % endif
          -->
        </ul>
        <p><a class="btn" href="#">View details &raquo;</a></p>
      </div>
    </div><!--/span-->
    %if (loop.index + 1) % 3 == 0:
      </div>
      <div class="row">
    %endif
  %endfor
</div><!--/row-->
