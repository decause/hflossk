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
IRC is one of the primary means of communication for a FLOSS community,
particularly for informal communication.
</p>

<p>
There is a course IRC channel on irc.freenode.net. The channel is
#rit-foss. Communicating regularly in IRC factors into the FLOSS Dev
Practices component of your final grade.
</p>

<h3>Tasks:</h3>

<dl>
    <dt><em>Tasks</em>:</dt>
        <dd><ul class="first last simple">
            <li>Download and install an IRC client on your development machine.<ul>
            <li>Windows: <a class="reference external" href="http://www.mirc.com/">mIRC</a></li>
            <li>Mac OS X: <a class="reference external" href="http://colloquy.info/">Colloquy</a></li>
            <li>Linux: <a class="reference external" href="http://irssi.org/">irssi</a></li>
            </ul>
        </li>
        <li>Choose a nick and <a
href="http://freenode.net/faq.shtml#userregistration">register yourself with
the NickServ</a>.</li>
        <li>Connect to <span class="pre">#floss-seminar</span> on <span class="pre">irc.freenode.net</span> and introduce yourself.
        <ul>
        <li>The instructor’s nick is <span class="pre">decause</span>.</li>
    </ul>
        </li>
    </ul>
    </dd>
</dl>

<p>
It is a good practice to “hang out” in IRC channels of projects that you use
and especially of projects that you contribute to. Here you can find early
alerts regarding any upcoming major changes or security vulnerabilities. It is
also the easiest (lowest overhead) method for getting your questions answered.
</p>

<p>
    <strong>Note</strong>
</p>

<p>
Only for the brave – if you want to be completely awesome, you can setup a
proxy node so you are always logged in. People can leave you messages this way.
</p>

<p>
If you want to be completely completely awesome, you can setup BitlBee so you can tweet from your IRC client.
Mailman
</p>

<p>
Discussion mailing lists are a more formal mechanism of communication for FLOSS
projects. More formal than IRC, less formal than bug trackers. Discussion
mailing lists are often used to ask questions, announce upcoming releases and
beta tests, and to debate redesigns and refactors. The advantage here is that
mailing lists are typically archived and indexed by Google; discussions that
should be preserved for posterity should occur here.
</p>



Blogging

    <p>Setup a blog if you don’t have one. Much like mailing lists, blogs are
    archived, indexed by Google, and therefore preserved for posterity. When
    you encounter a technical challenge, typically you google for a solution
    and you typically find that solution in a blog post of some developer who
    has run into a similar situation. Blogging about your attempts, successes
    and failures (and writing tutorials!) is a best practice for increasing the
    general body of searchable knowledge available, for increasing the Wisdom
    of the Ancients.  </p>

<p>
Blogs around a topic are also typically aggregated by a planet (an RSS feed
aggregator). This way, all developers blogging about Project X can have their
blog posts fast-tracked to a readership subscribed to Planet X. For instance,
here’s a link to Planet Python.
</p>

<p>
The Planet for the course is hosted at http://threebean.org/floss-planet/.
There are instructions for how to subscribe your blog to it in the Patch the
Course Project section below.
</p>


<p>
You must create a blog (if you don’t have one already) and write at least one
post per week about your progress, attempts, successes, failures, reflections,
and/or all of the above.
</p>

<h2>Tasks:</h2>

    <ol>
        <li>
        Create a blog if you don’t already have one. There are lots of free
        services available. You might try http://wordpress.com or
        http://blogspot.com, or foss.rit.edu.
        </li>
        <li>Write an introductory post, detailing the process you went through
        to complete the <em>FirstFlight</em> assignment.</li>

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

<h2>Tasks:</h2>
    <ol>
        <li>Create a github account if you don’t already have one.</li>
    </ol>

<h2>Patch the Course Project</h2>

Check out the source repository for this course; it’s hosted at https://github.com/decause/hflossk.

Inside the repository, we’ll keep an index of all the students in the course and metadata about them (you!).

<h2>Tasks:</h2>

<ol>
        <li>Load up the git cheatsheet listed at Helpful Hints – A list of
        external resources and keep it nearby.</li>

        Work through this git tutorial if you don’t have any experience with git.

        Fork the repository (link to github help on this).

        Clone a local copy.

        Follow the instructions in README.rst to setup your environment.

        Edit the file data/students.yaml. Perhaps obviously, it is a YAML file. Add yourself to the file with the necessary keywords.

        Verify that you added yourself correctly by running the script located at lib/hfoss/model/validate.py

        Edit the file planet/config.ini. Look at the very bottom of the file and there will be the beginnings of a list of subscribed blogs. Add your blog’s RSS feed (or a topical sub-feed) to this list. Make sure its a working RSS URL! (Once the patch is accepted upstream and pushed to production, this should add your blog feed to the course planet.)

        If everything checks out, then
            Commit your change
            Push to your github repository
            Issue a pull request through the web interface.
</ol>


