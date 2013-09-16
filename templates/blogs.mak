<%inherit file="master.mak" />

<div class="hero-unit">
<h1>Participants</h1>
<p>Should have ${int(target_number)} blog posts</p>
<p>
<!--<p><a href="#" class="btn btn-primary btn-large">Generate Report&raquo;</a></p>-->
</div>

<div class="row-fluid">
  %for student in student_data:
    <div class="span4 shadowcard padded">
    % if student.get('gravatar_email'):
    <img class="uglymug" src="${gravatar(student['gravatar_email'])}" alt="${student['irc']}'s Avatar" />
    % else:
    <img class="uglymug" src="${gravatar(student['rit_dce'] + '@rit.edu')}" alt="${student['irc']}'s Avatar" />
    % endif
    <h4 class="irc_nick">${student['irc']}</h4>
    <div class="sticky padded ${'good' if student_posts[student['irc']] >= target_number else 'bad'}">
    <i class="icon-pencil"></i>
    <span>${student_posts[student['irc']]}</span></div>
    <p><a target="_blank" href="${student['blog']}">${student['blog']}</a></p>
    <ul class="unstyled cardlist">
    % for geordi in student['forges']:
    <li><a target="_blank" class="reference external" href="${geordi}">${geordi}</a></li>
    %endfor
    </ul>
    <p><a class="btn" href="#">View details &raquo;</a></p>
    </div><!--/span-->
    %if (loop.index + 1) % 3 == 0:
        </div>
        <div class="row-fluid">
    %endif
  %endfor
</div><!--/row-->
