<%inherit file="master.mak" />

<div class="hero-unit">
    <h1>First Flight</h1>
</div>

<p>
The purpose of this homework assignment is to introduce students to their first
FLOSS practices. Read it in full, there are a number of graded deliverables.
</p>

The due-date is listed in the Syllabus.

<h2>IRC</h2>

<p>
IRC is one of the primary means of communication for a FOSS community,
particularly for informal communication.
</p>

<p>
There is a course IRC channel on irc.freenode.net. The channel is
#rit-foss. Communicating regularly in IRC factors into the FOSS Dev
Practices component of your final grade.
</p>

<div class="alert alert-success">
<dl>
    <dt><h3 class="label label-success">Tasks:</h3></dt>
    <dd><ul class="first last simple">
        <li>Download and install an IRC client on your development machine.
          <ul>
          	<li>Windows:
          	  <ul>
                <li><a class="reference external" href="http://www.mirc.com/">mIRC</a></li>
                <li><a class="reference external" href="http://hexchat.github.io/">HexChat</a></li>
              </ul>
            </li>
            <li>Mac OS X: <a class="reference external" href="http://colloquy.info/">Colloquy</a></li>
            <li>Linux:
              <ul>
                <li><a class="reference external" href="http://irssi.org/">irssi</a> (Command-line)</li>
                <li><a class="reference external" href="http://hexchat.github.io/">HexChat</a></li>
                <li><a class="reference external" href="http://xchat.org/">XChat</a> (Older version of HexChat)</li>
              </ul>
            </li>
          </ul>
        </li>
        <li>Choose a nick and <a
href="http://freenode.net/faq.shtml#userregistration">register yourself with
the NickServ</a>.</li>
        <li>Connect to <code>#rit-foss</code> on <code>irc.freenode.net</code> and introduce yourself.
          <ul>
            <li>The instructor’s nick is <code>decause</code>.</li>
          </ul>
        </li>
    </ul></dd>
</dl>
</div>

<p>
It is a good practice to “hang out” in IRC channels of projects that you use
and especially of projects that you contribute to. Here you can find early
alerts regarding any upcoming major changes or security vulnerabilities. It is
also the easiest (lowest overhead) method for getting your questions answered.
</p>

<div class="alert alert-info">
<p>
    <span class="label label-info">Note</span>
</p>

<p>
Only for the brave – if you want to be completely awesome, you can setup a
proxy node so you are always logged in. People can leave you messages this way.
</p>

<p>
If you want to be completely <em>completely</em> awesome, you can setup <a target="_blank" href="http://www.bitlbee.org/main.php/news.r.html">BitlBee</a> so you can tweet from your IRC client.
</div>


<h2>Mailman</h2>

<p>
Discussion mailing lists are a more formal mechanism of communication for FOSS
projects. More formal than IRC, less formal than bug trackers. Discussion
mailing lists are often used to ask questions, announce upcoming releases and
beta tests, and to debate redesigns and refactors. The advantage here is that
mailing lists are typically archived and indexed by Google; discussions that
should be preserved for posterity should occur here. Upstream projects usually
have an existing mailing list where messages of these sort are to be posted.
</p>


<h2>Blogging</h2>

    <p>Setup a blog if you don’t have one. Much like mailing lists, blogs are
    archived, indexed by Google, and therefore preserved for posterity. When
    you encounter a technical challenge, typically you google for a solution
    and you typically find that solution in a blog post of some developer who
    has run into a similar situation. Blogging about your attempts, successes
    and failures (and writing tutorials!) is a best practice for increasing the
    general body of searchable knowledge available, for increasing the <code><a class="reference external" href="http://xkcd.com/979/">Wisdom of the Ancients.</a></code></p>

<p>
Blogs around a topic are also typically aggregated by a planet (an RSS feed
aggregator). This way, all developers blogging about Project X can have their
blog posts fast-tracked to a readership subscribed to Planet X. For instance,
here’s a link to <code><a target="_blank" href="http://planet.python.org">Planet Python</a></code>.
</p>

<p>
The Planet for the course <em>may</em> be hosted at some point in the future at
<code><a target="_blank"
        href="http://yacht.rit.edu/planet">http://yacht.rit.edu/planet</a></code>.
</p>


<p>
You must create a blog (if you don’t have one already) and <strong>write at least one
post per week</strong> about your progress, attempts, successes, failures, reflections,
and/or all of the above.
</p>

<div class="alert alert-success">
<h3 class="label label-success">Tasks:</h3>

    <ol>
        <li>
        Create a blog if you don’t already have one. There are lots of free
        services available. You might try <code><a target="_blank" href="http://wordpress.com">http://wordpress.com</a></code> or
        <code><a target="_blank"
                href="http://blogspot.com">http://blogspot.com</a></code>, or
        even <code><a target="_blank"
        href="http://foss.rit.edu">http://foss.rit.edu</a></code>.
        </li>
        <li>Write an introductory post, detailing the process you went through
        to complete the <em>FirstFlight</em> assignment.</li>
    </ol>
</div>


<h2>Github</h2>

<p>
Code forges are service sites around which FOSS development orbits, some of
the more popular sites are github, bitbucket, sourceforge, and launchpad.
</p>

<p>
For your own enlightenment, review the following comparisons of the different
forges:
</p>

<ul>
    <li><a href="http://flossmole.org/content/when-were-forges-established">Timeline</a></li>
    <li><a href="http://flossmole.org/content/project-metadata-matrix-june-2011">Metadata</a></li>
    <li><a href="http://flossmole.org/content/artifacts-matrix-code-forges-june-2011">Artifacts</a></li>
    <li><a href="http://flossmole.org/content/feature-matrix-code-forges-june-2011">Features</a></li>
    <li><a href="http://flossmole.org/content/revision-control-matrix-june-2011">Revision control</a></li>
    <li><a href="http://flossmole.org/content/forge-policy-matrix-june-2011">Policies</a></li>
</ul>

<p>
You’ll need to create your own account on github.com. All development for this
course should be tracked on that forge. Github is, after all, the most popular
forge.
</p>
<div class="alert alert-success">
<h3 class="label label-success">Tasks:</h3>
    <ol>
        <li>Create a <code><a target="_blank" href="http://github.com">Github</a></code> account if you don’t already have one.</li>
    </ol>
</div>
<div>
    <h2>Patch the Course Project</h2>
    <p>Check out the source repository for this course; it’s hosted at
    <a class="reference external" href="https://github.com/decause/hflossk">https://github.com/decause/hflossk</a>.</p>
    <p>Inside the repository, we’ll keep an index of all the students in the course and metadata about them (you!).</p>
    <dl class="alert alert-success">
        <dt><h3 class="label label-success">Tasks:</h3></dt>
        <dd><ul>
            <li>Load up the git cheatsheet at <a
                href="http://zrusin.blogspot.com/2007/09/git-cheat-sheet.html"><em>Zack
            Rusin's blog</em></a> and keep it nearby.</li>
            <li>Work through this <a
                href="http://gitimmersion.com/index.html">git tutorial</a> if
            you don’t have any experience with git.</li>
            <li>Fork <a href="https://github.com/decause/hflossk">the
                repository</a> (link to <a
            href="http://help.github.com/fork-a-repo/">github help</a> on
        this).</li>
            <li>Clone a local copy.</li>
            <li>Add a file in the <code>/scripts/people</code> folder titled <code>$YOUR_IRC_NICK.yaml</code>. Perhaps obviously, it is
            a <a href="http://www.yaml.org/">YAML</a> file. You can use the <code>rjbpop.yaml</code> file as an example.
            </li>

            <div class="alert alert-warning">
            <strong>BE WARNED</strong>: Your .yaml file must match the format *exactly* (meaning it is case and whitespace sensitive.)
            </div>
            <div class="alert alert-warning">
            <strong>CRUFTY</strong>: There is a <code>people.yaml</code> file in that directory.  It is a legacy hangover from older code.  Do not bother editing it.  It will actually make merges more difficult.
            </div>

            <li>Once you've confirmed your .yaml file matches exactly, commit and push your changes to github, and issue a pull request.</li>
            <li>Once the patch is accepted upstream and pushed to production, this
            should add your blog feed to the <a href="http://hfoss-fossrit.rhcloud.com/checkblogs">Participants</a> page.)</li>
            </ul>
            </li>
        </ul>
        </dd>
    </dl>
</div>
