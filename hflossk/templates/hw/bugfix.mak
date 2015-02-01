<%inherit file="../master.mak"/>

<div class="jumbotron">
    <h1>HWBF</h1>
    <p>Homework - Bugfix</p>
</div>

    <div class="alert alert-info" id="find-a-bug">
        <h2>WAT? Y?</h2>
        <p>Real learning in computing comes more from <strong>doing</strong> and
        less from studying. Debugging, figuring out how some software works and
        how it doesn't, is an interactive process that develops basic engineering
        practices and, in the open source context, community engagement and
        collaboration.</p>
        <h2>Find a bug</h2>
        <p>A bug can be anything: an unintended side-effect in a low-level
        routine, a user-interface cleanup, a feature enhancement, grammatical
        errors or lack of clarity in the project's documentation.</p>
        <p>Broadly, you have two different options here. You can:</p>
        <div><ul>
                    <li>Find a known bug (or feature enhancement) listed in the project's bug
                    tracker.</li>
                    <li>Find a bug yourself by using the software (this may take a while...)</li>
                </ul>
        </div>
        <p>In the event of the second case, make sure you file the bug in the
        project's tracker before proceeding.</p>
        <p>You can fix a bug in any project you like. The best to pick is
        something you <em>already use</em>, something with which you're already
        familiar. If you can't think of any projects to investigate off the
        top of your head, here's a list of suggestions.</p>
            <div><ul class="simple">
                    <li>Scope the OpenHatch Volunteer Opportunity Finder for
                    <code><a target="_blank" href="http://openhatch.org/search/?toughness=bitesize">Bite-sized Bugs</a></code></li>
                    <li>Check out the "easy-fix" bugs <code><a target="_blank" href="https://fedoraproject.org/easyfix">Listed by the Fedora Project</a></li></code>
                    <li>Use the search function at <code><a target="_blank" href="http://github.com/">http://github.com/</a></code> and filter by language (to a language that you know).</li>
                    <li>You could even look up some of the bounties (AKA Bugs that you get paid to squash) at <code><a target="_blank" href="https://www.bountysource.com/trackers">https://www.bountysource.com/trackers</a></code></li>
                </ul>
        </div>
        <p>Really, the sky is the limit here.</p>

        <div class="alert">
            <p class="last">For background, you might want to also check out the project on
            <code><a target="_blank" href="http://openhub.net/">http://openhub.net/</a></code>.
            It can help you characterize what kind of community orbits around
            your choice.</p>
        </div>
    </div>
    <div class="alert alert-info">
    <h2>Use the Source, Luke</h2>
        <p>Once you've identified a bug that needs fixing, you'll need to get
        ahold of the source. In most cases, the code for a project will be
        hosted on a forge and the process of forking and cloning the source
        should be straightforward. If you forget how to do this for <code><a
                class="reference external" href="http://github.com">github</a></code>, you can
    refer to
    <code><a target="_blank" href="/hw/firstflight"><em>Homework - First Flight</em></a></code>.</p>

    <ol>
        <li>
        <p>For whatever project you've chosen, you should ask that project's
        community for help. Look for <strong>IRC</strong> channels and project
        mailing lists. You'll be communicating with developers who have a lot
        on their plate so make sure to <code><a target="_blank" href="http://maymay.net/blog/2009/02/11/how-to-start-contributing-to-open-source-projects/">be polite and leave your ego at the door</a>.</p></code>
        </li>

        <li>
        <p>Find the code related to the bug; use whatever code navigation tools
        you're more familiar with. The instructor's favorite method is:
        <tt><code><span class="pre">$ grep</span> <span class="pre">-inr</span> <span class="pre">"SOMEKEYWORD"</span> <span class="pre">project_src/</span> .</p></tt></code>
        </li>

        <li>
        <p>Fix the bug, this may require some thinking, and some more asking
        around.</p>
        </li>

        <li>
        <p>Test your fix! Project maintainers hate nothing more than receiving
        a patch that breaks every other function of the project. Often,
        projects have built-in test suites. If yours does, run it!</p>
        </li>

        <li>
        <p>Prepare your patch with descriptive commit messages. Follow the
        method for submitting patches recommended by your project and
        submit!</p>
        </li>

        <li>
        <p>Make sure the project community can easily understand what you did
        and why you did it.</p>
        </li>

        <li>
        <p>Make sure there is a reference in the tracked bug ticket to your
        patch (that is, if the project maintains a bug tracker).</p>
        </li>

    </ol>
    </div>
    <div class="alert alert-success">
        <h2>The Deliverable</h2>
        <p>Write a blog post about this process and provide relevant links
        where possible to documentation.</p>
            <div><ol>
                    <li>A link to the patch(es) hosted somewhere on the web, usually forges provide
                    the ability to link to changesets.</li>
                    <li>A link to any mailing list discussions archived on the web.</li>
                    <li>Snippets of any relevant IRC conversations.</li>
                </ol>
            </div>
        <p>You will be graded on your post and the explanation of your process.
        Extra kudos (but not extra credit) for super epic patches. Extra credit
        (actual extra credit) for patches that are actually accepted
        upstream.</p>
        <div class="alert alert-error">
            <h3>Submitting the Deliverable</h3>
            <p>As with <strong>all</strong> of your assignments, you'll be submitting them via your <code>.yaml</code> file through a pull request on Github. Be sure to follow formatting and whitespace, and to name your entry like so <code>bugfix: http://yourblog.blogplace.com/bugfixpost</code>.</p>
        </div>
    </div>
    <div class="alert">
        <h2>An Afterthought (not required)</h2>
        <p>Once your patch has been accepted, mosey on over to <code><a target="_blank" href="http://openhub.net">http://openhub.net</a>.</p></code>
        <blockquote>
            <div><ol>
                    <li>Create an account</li>
                    <li>Find the project you patched<ul>
                        <li>If it doesn't exist, you can add it yourself</li>
                    </ul>
                    </li>
                    <li>"Claim your position" as the author of the commit(s)
                    you sent in to increase your rank among open source
                    developers of the world!</li>
                </ol>
        </div></blockquote>
    </div>
</div>


          </div>
        </div>
      </div>
