<%inherit file="master.mak"/>

<div class="hero-unit">
<h1>Student Blogs</h1>
<p>Wanna know your participation grade?</p>
<p><a href="#" class="btn btn-primary btn-large">Generate Report&raquo;</a></p>
</div>

<div class="row-fluid">
  %for student in student_data:
    <div class="span6">
    <h2>${student['irc']}</h2>
    <p>${student_posts[student['irc']]}</p>
    <p>${student['blog']}</p>
    <p>${student['forges']}</p>
    <p><a class="btn" href="#">View details &raquo;</a></p>
    </div><!--/span-->
  %endfor
</div><!--/row-->
