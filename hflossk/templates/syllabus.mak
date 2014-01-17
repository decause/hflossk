<%inherit file="master.mak"/>

<%def name="title()">
    Syllabus &mdash; The RIT HFOSS Development Course documentation
</%def>

<%def name="doc_toc()">
  <div class='affix well'>
    <ul class="list-unstyled">
      <li><span class='glyphicon glyphicon-info-sign'></span> <a href="#course-info">Course Information</a></li>
      <li><span class='glyphicon glyphicon-book'></span> <a href="#text-books">Text Books</a></li>
      <li><span class='glyphicon glyphicon-tasks'></span> <a href="#what-you-ll-do">What You'll Do</a></li>
      <li><span class='glyphicon glyphicon-heart'></span> <a href="#the-spirit-of-the-course">The spirit</a></li>
      <li><span class='glyphicon glyphicon-briefcase'></span> <a href="#licensing">Licensing</a></li>
      <li><span class='glyphicon glyphicon-calendar'></span> <a href="#schedule">Schedule</a></li>
      <li><span class='glyphicon glyphicon-check'></span> <a href="#grading">Grading</a></li>
      <li><span class='glyphicon glyphicon-flash'></span> <a href="#lightning-talks-extra-credit">Lightning Talks</a></li>
    </ul>
  </div>
</%def>

<div class="jumbotron" id="syllabus">
    <h1>Syllabus</h1>
</div>
<div class="section">
  <a class="headerlink" name="course-info"></a>
  <h2>${course['desc']}</h2>
  <blockquote>
    <div>
      <ul class="list-unstyled">
        <li>Instructor - ${instructor['name']} &lt;<a class="" href="mailto:${instructor['email']}">${instructor['email']}</a>&gt;</li>
            <li>Office: ${instructor['office']['location']}</li>
            <li>Office Hours: ${instructor['office']['hours']}</li>
        <li>Teaching Assistant - TBA 
        <!--&lt;<a href="mailto:daw4475&#37;&#52;&#48;rit&#46;edu">daw4475<span>&#64;</span>rit<span>&#46;</span>edu</a>&gt;.  <span class="docutils literal" style="font-family: monospace;"><span class="pre">DAWacker</span></span> in IRC.</li>-->
        <li>IRC - irc.freenode.net, <span class="docutils literal" style="font-family: monospace;"><span class="pre">#rit-foss</span></span></li>
        <li>Blog Planet - <a class="" href="http://foss.rit.edu/planet">http://foss.rit.edu/planet</a></li>
        <li>The source for this syllabus can be found at
        <a href="http://github.com/decause/hflossk">http://github.com/decause/hflossk</a></li>
      </ul>
    </div>
  </blockquote>
</div>
<div class="section">
  <a class="headerlink" name="text-books"></a>
  <h2>Text Books</h2>
  <p>There are a number of textbooks we&#8217;ll be referencing throughout the quarter. You can
  find these books/texts/articles here <a href="/oer">on the resources page</a></p>
</div>
<div class="section">
  <a class="headerlink" name="what-you-ll-do"></a>
  <h2>What You&#8217;ll Do</h2>
  <p>This course will introduce students to the Free and Open Source Software (FOSS)
  and Open Content movements, to the open source development process,
  and to the open questions of the efficacy of technology in the classroom.</p>
  <p>Students will learn FOSS process and Tools with class projects that
  support the One Laptop Per Child community by creating content and
  software for free distribution to students and teachers around the world.
  The OLPC project is driven by a world-wide community&#8211;one that students
  in HFOSS will become part of.</p>
  <p>For this course students will be expected to attend and make final
  presentations to the RIT and Rochester FOSS communities via the regular
  Rochester Pythonistas meet-ups and FOSSBox hack-a-thons when possible.
  Students will also become members of the Sugar and OLPC international
  communities. Local FOSS community members may join us in class sessions as
  well.  Treat them as you would another instructor, but they’re also your
  peers in moving this innovative project forward.</p>
</div>
<div class="section">
  <a class="headerlink" name="the-spirit-of-the-course"></a>
  <h2>The spirit of the course</h2>
  <p>While still a course where you will receive a letter grade, the spirit of the
  course is intended to be both <cite>open</cite> and <cite>fun</cite>.</p>
  <p>An <cite>open</cite> course &#8211; students will have access to the &#8216;document source&#8217; for the
  syllabus. While you are reading <cite>the syllabus</cite> right now,
  as a student of the class you have a right to <a class="" href="http://github.com/decause/hflossk">fork the upstream repository</a>, make modifications, and submit patches for review. Barring a troll festival, this can create a fun,
  dynamic environment in which the course curriculum can develop by the very same
  mechanism being taught during the quarter (community-driven).</p>
</div>
<div class="section">
  <a class="headerlink" name="licensing"></a>
  <h2>Licensing</h2>
  <p>All code developed by students in the course must be licensed (by the student)
  under any one of the <a class="" href="http://www.opensource.org/licenses/category">licenses approved by the open source initiative</a>.</p>
  <p>Your code that you write is your <strong>code</strong>, with which you can do what you will;
  true. However, if you&#8217;re unwilling to license code you write for an open source
  course with an open source license, you may be in the wrong course.</p>
</div>
<div class="section">
  <a class="headerlink" name="schedule"></a>
  <h2>Schedule</h2>
  <%
    from datetime import datetime, timedelta
  %>
  <table border="1" class="docutils">
    <colgroup>
      <col style="width: 2%;" />
      <col style="width: 2%;" />
      <col style="width: 4%;" />
      <col style="width: 38%;" />
      <col style="width: 26%;" />
      <col style="width: 26%;" />
    </colgroup>
    <tbody style="vertical-align: top;">
      <tr>
        <th colspan='2'>Week</td>
        <th>Day</td>
        <th>Topic</td>
        <th>Assigned</td>
        <th>Due</td>
      </tr>
      % for week_no, week in enumerate(schedule):
        <tr>
          <td rowspan="${len(week['week'])}">${week_no+1}</td>
          % for day_no, _class in enumerate(week['week']):
            % if not day_no == 0:
              </tr><tr>
            % endif
            % if _class.get('class'):
              <td class="sessionnumber">${day_no+1}</td>
            % else:
              <td>***</td>
            % endif
            % if _class.get('date'):
              <td>${datetime.strftime(_class['date'], '%m/%d')}</td>
            % elif _class.get('class'):
              <td>${datetime.strftime(course['start'] + timedelta(weeks=week_no, days=day_no*2), '%m/%d')}</td>
            % else:
              <td>***</td>
            % endif
            ${topic_block(_class.get('topics', []))}
            ${topic_block(_class.get('assign', []))}
            ${topic_block(_class.get('due', []))}
          % endfor
        </tr>
      % endfor
    </tbody>
  </table>
</div>
<div class="section">
    <a class="headerlink" name="attendance"></a>
    <h2>Attendance</h2>
    <p>Attendance is <em><strong>required</strong></em> for this course. Students are allotted <span class="label label-danger">2</span> <strong><u>excused</u></strong> absences per semester.</p>
    <p>Subsequent absences will result in a <span class="label label-danger">10%</span> reduction of your final letter grade <strong><em>for each</em></strong> class missed.</p>
</div>
<div class="section">
  <a class="headerlink" name="grading"></a>
  <h2>Grading</h2>
<p>Assignments are due at 4:59pm of the day they are marked as due, to be useful in class.</p>
<p>Late submissions will be deducted <span class="label label-danger">10%</span> per day they are late.</p>
<hr class="docutils" />
<p>Your final grade for the quarter will be derived from the following weights.</p>
<table border="1" class="docutils">
<colgroup>
<col style="width: 80%;" />
<col style="width: 20%;" />
</colgroup>
<thead>
<tr><th class="head">Component</th>
<th class="head">Weight</th>
</tr>
</thead>
<tbody>
<tr><td>In-Class Participation</td>
<td class="center padded"><span class="label label-warning">10%</span></td>
</tr>
<tr><td>Quizzes</td>
<td class="center padded"><span class="label label-warning">10%</span></td>
</tr>
<tr><td>Literature Reviews</td>
<td class="center padded"><span class="label label-warning">10%</span></td>
</tr>
<tr><td>Team Peer Assessment</td>
<td class="center padded"><span class="label label-info">15%</span></td>
</tr>
<tr><td>Completed Project</td>
<td class="center padded"><span class="label label-info">15%</span></td>
</tr>
<tr><td>Final Presentation</td>
<td class="center padded"><span class="label label-success">20%</span></td>
</tr>
<tr><td>FOSS Dev Practices (Blog posts, commits, tickets, IRC)</td>
<td class="center padded"><span class="label label-success">20%</span></td>
</tr>
</tbody>
</table>
<hr class="docutils" />
<p><em>Blog updates</em> &#8211; students are required to keep a blog to which they post updates
about their investigations, progress, success, and pitfalls. This blog can be
hosted anywhere, but must be added to the course <a href="/checkblogs">participant page</a> (there are instructions on how to do this
in <a class="" href="/hw/firstflight"><em>Homework - First Flight</em></a>).</p>
<blockquote>
<div><ul class="simple">
<li>You must make at least one blog post per week to receive full credit. A week Ends on Sunday at 11:59pm.</li>
<li>You must participate regularly in the course&#8217;s IRC channel: asking and answering questions.</li>
<li>Contributions to the course curriculum, syllabus, and rubric are factored in here as well.</li>
</ul>
</div></blockquote>
<p>Blogging is good for you and good for the <a href="http://xkcd.com/979/">FLOSS community at large</a>.</p>
<p>The details for the final can be found at <a href="/hw/final"><em>Final</em></a>.</p>
</div>
<div class="section">
  <a class="headerlink" name="lightning-talks-extra-credit"></a>
  <h2>Lightning Talks - Extra Credit</h2>
<p>Every Wednesday for the first portion of class, any student has the opportunity
to give a <code><a href="http://en.wikipedia.org/wiki/Lightning_Talk">lightning talk</a></code> on a
topic of their chosing. Your lightning talk must be less than 5 minutes in
length and must be at least remotely related to the course material.</p>
<p>You will receive +1 extra credit points towards your final grade for every
lightning talk you give. Only the first <span class="label
label-success">2</span> lightning talks offered will be allowed during a given
class. Talks will be chosen from among those offered by students on a <code><a
target="_blank" href="http://en.wikipedia.org/wiki/FIFO">FIFO</a></code>
basis.</p> </div>

<%def name='topic_block(section)'>
  <td>
   % for topic in section:
      <p class="topic ${topic.get('special', '')}">
        % if topic.get('link'):
          <a target="_blank" href="${topic['link']}">${topic['name']}</a>
        % else:
          ${topic['name']}
        % endif
      </p>
    % endfor
  </td>
</%def>
