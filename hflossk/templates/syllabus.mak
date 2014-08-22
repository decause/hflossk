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
        <li><b>Instructor</b> - ${instructor['name']} &lt;<a class="" href="mailto:${instructor['email']}">${instructor['email']}</a>&gt;</li>
            <li><b>Office:</b> ${instructor['office']['location']}</li>
            <li><b>Office Hours:</b> ${instructor['office']['hours']}</li>
        % if assistant:
        <li><b>Teaching Assistant</b> - ${assistant['name']} &lt;<a class="" href="mailto:${assistant['email']}">${assistant['email']}</a>&gt;</li>
        % endif
        <li><b>IRC</b> - irc.freenode.net, <span class="docutils literal" style="font-family: monospace;"><span class="pre">#rit-foss</span></span></li>
        <li><b>Blog Planet</b> - <a class="" href="http://foss.rit.edu/planet">http://foss.rit.edu/planet</a></li>
      </ul>
        The source for this syllabus can be found at
        <a href="http://github.com/decause/hflossk">http://github.com/decause/hflossk</a>

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
  under any one of the <a class="" href="http://www.opensource.org/licenses/category">licenses approved by the Open Source Initiative</a>.</p>
  <p>Code that you write is <strong>your</strong> code, with which you can do what you will;
  true. However, if you&#8217;re unwilling to license code you write for an Free/Open Source
  course with a Free/Open Source license, you may be in the wrong course.</p>
</div>
<div class="section">
    <a class="headerlink" name="schedule"></a>
    <h2>Schedule</h2>
    <table class="table table-striped table-bordered">
        <colgroup>
            <col style="width: 2%;">
            <col style="width: 2%;">
            <col style="width: 4%;">
            <col style="width: 38%;">
            <col style="width: 26%;">
            <col style="width: 26%;">
        </colgroup>
        <tbody style="vertical-align: top;">
        <tr>
            <th colspan="2">Week
            </th><th>Day
            </th><th>Topic
            </th><th>Assigned
            </th><th>Due
        </th></tr>
        <tr>
            <td rowspan="2">1</td>
            <td class="sessionnumber">1</td>
            <td>08/26</td>
            <td>
                <p class="topic ">
                Welcome, intro, Syllabus, RTFM
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/static/books/Weber-SuccessofOpenSource-Chap3.pdf">LitReview1: <em>What is Open Source?</em> by Steve Weber</a>
                </p>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>08/28</td>
            <td>
                <p class="topic ">
                <a target="_blank" href="/lectures/w01c2">First Flight</a>
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/hw/firstflight"><em>Homework - First Flight</em></a>
                </p>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">2</td>
            <td class="sessionnumber">1</td>
            <td>09/02</td>
            <td>
                <p class="topic ">
                Formal Introduction to Git and Github
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>09/04</td>
            <td>
                <p class="topic ">
                Writing for HFOSS - litreviews and blog posts
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/static/hw/litreview.txt">grok litreview.txt</a>
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/hw/firstflight"><em>Homework - First Flight</em></a>
                </p>
                <p class="topic ">
                <a target="_blank" href="/static/hw/litreview.txt">grok litreview.txt</a>
                </p>
            </td>

        </tr>
        <tr>
            <td rowspan="2">3</td>
            <td class="sessionnumber">1</td>
            <td>09/09</td>
            <td>
                <p class="topic ">
                Lit Review Discussion: What is Open Source?
                </p>
            </td>

            <td>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/books">LitReview1: <em>What is Open Source?</em> by Steve Weber</a>
                </p>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>09/11</td>
            <td>
                <p class="topic ">
                LIT: 5 Pillars of Opensource.com
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/quiz/quiz1">TOSW Quiz</a>
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/quiz/quiz1">TOSW Quiz</a>
                </p>
            </td>

        </tr>
        <tr>
            <td rowspan="2">4</td>
            <td class="sessionnumber">1</td>
            <td>09/16</td>
            <td>
                <p class="topic cancelled">
                Class CANCELLED. GO TO ROC.py Tuesday!
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/hw/bugfix">Homework - Bugfix</a>
                </p>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>09/18</td>
            <td>
                <p class="topic ">
                OLPC Distribution &amp; Smoke testing
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="http://wiki.laptop.org/go/Smoke_test/10.1.x/1_hour_smoke_test">Smoke Test</a>
                </p>
            </td>

            <td>
            </td>
        <tr>
            <td></td>
            <td>***</td>
            <td>09/20 to<br/>09/21</td>
            <td>
                <p class="topic hackathon">
                <a target="_blank" href="http://sfd14-roc.eventbrite.com">Software Freedom Day 2014</a>
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        </tr>
        </tr>

        <tr>
            <td rowspan="2">5</td>
            <td class="sessionnumber">1</td>
            <td>09/23</td>
            <td>
                <p class="topic ">
                COMMARCH: Git-by-a-bus and CCF: Callaway Coefficient of Fail.
                </p>
                <p class="topic">
                </p>
            </td>

            <td>
                <p class="topic ">
                Commarch Team Formation
                </p>
                <p class="topic ">
                <a target="_blank" href="/static/hw/commarch.txt">Commarch Report</a>
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/hw/bugfix"><em>Homework - Bugfix</em></a>
                </p>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>09/25</td>
            <td>
                <p class="topic ">
                Smoke Testing Results
                </p>
            </td>

            <td>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="http://wiki.laptop.org/go/Smoke_test/10.1.x/1_hour_smoke_test">Smoke Test</a>
                <p>Commarch Team Formation</p>
                </p>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>***</td>
            <td>11/26 <br/>to 11/28</td>
            <td>
                <p class="topic hackathon">
                Hackathon @ Cornell: <a target="_blank" href="http://bigredhacks.com">http://bigredhacks.com</a>
                </p>
            </td>

            <td><a target="_blank" href="http://bigredhacks.com">http://bigredhacks.com</a>
            </td>

            <td>
            </td>
        </tr>
        <tr>
            <td rowspan="2">6</td>
            <td class="sessionnumber">1</td>
            <td>09/30</td>
            <td>
                <p class="topic ">
                Commarch Presentations I
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/static/hw/teamproposal.html"><em>Homework - Team Proposal</em></a>
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/static/hw/commarch.txt">Commarch Report</a>
                </p>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>10/02</td>
            <td>
                <p class="topic guest">
                Guest Lecture: Hudl &amp; FOSS in (SIH) 87-1600
                </p>
            </td>

            <td>
            </td>

            <td>
                <p class="topic ">
                </p>
            </td>

        </tr>
        <tr>
            <td></td>
            <td>***</td>
            <td>10/04 <br/>to 10/05</td>
            <td>
                <p class="topic hackathon">
                Hackathon @ Syracuse: <a target="_blank" href="http://hackupstate.com">http://hackupstate.com</a>
                </p>
            </td>

            <td><a target="_blank" href="http://hackupstate.com">http://hackupstate.com</a>
            </td>

            <td>
            </td>
        </tr>
        <tr>
            <td rowspan="2">7</td>
            <td class="sessionnumber">1</td>
            <td>10/07</td>
            <td>
                <p class="topic ">
                Commarch Presentations II &amp; Project Team Formation
                </p>
            </td>

            <td>
            </td>

            <td>
                <a target="_blank" href="/static/hw/teamproposal.html"><em>Homework - Team Proposal</em></a>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>10/09</td>
            <td>
                <p class="topic guest">
                EDU: Curriculum Exploration. (Tentatively) Remote Lecture via IRC from <a target="_blank" href="http://levelupcon.com">http://levelupcon.com</a></p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/oer"><em>NY &amp; MA 4th Grade Curriculum</em></a>
                </p>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">8</td>
            <td class="sessionnumber">1</td>
            <td>10/14</td>
            <td>
                <p class="topic cancelled">
                No Class: Monday Class Schedule
                </p>
            </td>

            <td>
                <p class="topic ">
                </p>
                <p class="topic ">
                </p>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>10/16</td>
            <td>
                <p class="topic ">
                EDU: Curriculum Discussion
                </p>
            </td>

            <td>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/oer"><em>NY &amp; MA 4th Grade Curriculum</em></a>
                </p>
            </td>

        </tr>
        <tr>
            <td rowspan="2">9</td>
            <td class="sessionnumber">1</td>
            <td>10/21</td>
            <td>
                <p class="topic cancelled">
                No Class: Go To <a target="_blank" href="http://www.meetup.com/Rochester-Python-Meetup/">ROCpy</a>
                </p>
            </td>

            <td><a target="_blank" href="http://www.meetup.com/Rochester-Python-Meetup/">ROCpy on Meetup.com</a>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>10/23</td>
            <td>
                <p class="topic guest">
                Remote Lecture via IRC
                </p>
            </td>

            <td>
            <a target="_blank" href="http://allthingsopen.org">All Things Open Conference</a>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">10</td>
            <td class="sessionnumber">1</td>
            <td>10/28</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>10/30</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        <tr>
            <td></td>
            <td>***</td>
            <td>11/01</td>
            <td>
                <p class="topic hackathon">
                Unnofficial: Tentative Date for <a target="_blank" href="http://barcamproc.org">BarcampROC</a>
                </p>
            </td>

            <td><a target="_blank" href="http://barcamproc.org">BarcampROC</a>
            </td>

            <td>
            </td>
        </tr>

        </tr>
        <tr>
            <td rowspan="2">11</td>
            <td class="sessionnumber">1</td>
            <td>11/04</td>
            <td>
                <p class="topic hackathon">
                Election Night Hackathon: (SIH) 87-1600
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>11/06</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        <tr>
            <td></td>
            <td>***</td>
            <td>11/07<br/>to 11/09</td>
            <td>
                <p class="topic hackathon">
                Hackathon: <a target="_blank" href="http://rit48.com">RIT48</a>
                </p>
            </td>

            <td><a target="_blank" href="http://rit48.com">RIT48</a>
            </td>

            <td>
            </td>
        </tr>
        </tr>
        <tr>
            <td rowspan="2">12</td>
            <td class="sessionnumber">1</td>
            <td>11/11</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>11/13</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">13</td>
            <td class="sessionnumber">1</td>
            <td>11/18</td>
            <td>
                <p class="topic special">
                TUESDAY 7-9pm ROCpy Demos (carpool in parking lot 6:15pm)
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="http://www.meetup.com/Rochester-Python-Meetup/">ROCpy on Meetup.com</a>
                </p>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>11/20</td>
            <td>
                <p class="topic guest">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td></td>
            <td>***</td>
            <td>11/22</td>
            <td>
                <p class="topic hackathon">
                Conference: <a target="_blank" href="http://makerfairerochester.com/">Rochester Mini-Maker Faire</a>
                </p>
            </td>

            <td><a target="_blank" href="http://makerfairerochester.com/">Rochester Mini-Maker Faire</a>
            </td>

            <td>
            </td>
        </tr>
        <tr>
            <td rowspan="2">14</td>
            <td class="sessionnumber">1</td>
            <td>11/25</td>
            <td>
                <p class="topic ">
                Lit Review 2
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>11/27</td>
            <td>
                <p class="topic cancelled">
                No Class: Happy Thanksgiving
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">15</td>
            <td class="sessionnumber">1</td>
            <td>12/02</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>12/04</td>
            <td>
                <p class="topic ">
                TBD
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="4">16</td>
            <td class="sessionnumber">1</td>
            <td>12/09</td>
            <td>
                <p class="topic special">
                Playtesting Session ???
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>12/11</td>
            <td>
                <p class="topic special">
                Playtesting Session ???
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr><tr>
            <td>***</td>
            <td>12/10</td>
            <td>
                <p class="topic special">
                Playtesting Session ???
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr><tr>
            <td>***</td>
            <td>12/12</td>
            <td>
                <p class="topic special">
                Playtesting Session ???
                </p>
            </td>

            <td>
            </td>

            <td>
            </td>

        </tr>
        <tr>
            <td rowspan="2">17</td>
            <td class="sessionnumber">1</td>
            <td>12/16</td>
            <td>
                <p class="topic special">
                Return XO's &amp; Final Presentations (w/ Pizza)
                </p>
            </td>

            <td>
                <p class="topic ">
                <a target="_blank" href="/hw/final">Final Presentation Details</a>
                </p>
            </td>

            <td>
            </td>
        </tr><tr>
            <td class="sessionnumber">2</td>
            <td>12/18</td>
            <td>
                <p class="topic cancelled">
                No Class: &lt;/hfoss&gt;
                </p>
            </td>

            <td>
                <p class="topic ">
                </p>
            </td>
            <td>
            </td>

        </tr>
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

  <table class="table table-striped table-bordered"
   class="docutils">
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
      <li>You must make at least one blog post per week to receive full credit.
      This is in addition to any assignments that are posted to your blog for
      that week. A week Ends on Sunday at 11:59pm.</li>
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
