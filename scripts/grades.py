import yaml
import feedparser
from datetime import datetime, timedelta
import time
import urllib2
import glob



def checkblogs():
    try:
        urllib2.urlopen("http://foss.rit.edu", timeout=15)
    except:
        # TODO: fix this right
        # timed out or otherwise couldn't reach foss.rit,
        # so bail for now.
        return render_template('ohno.mak', name='mako')
    else:
        student_data = []
        for fname in glob.glob(yaml_dir + "*.yaml"):
            with open(fname) as students:
                contents = yaml.load(students)

                if not isinstance(contents, list):
                    raise ValueError("%r is borked" % fname)

                student_data.extend(contents)
                #print gravatar(contents[0]['rit_dce'] + "@rit.edu")

        student_posts = {}
        target = datetime(2013, 8, 25)
        for student in student_data:
            when = []
            if student.get('feed'):
                print('Checking %s' % student['irc'])

                feed = feedparser.parse(student['feed'])
                #print feed.version

                for item in feed.entries:
                    #from pprint import pprint
                    #pprint(item)
                    #if 'published' in item:
                    #    print student['name'], item.published
                    ##if 'summary' in item:
                    ##    print item.summary
                    publish_time = datetime.fromtimestamp(time.mktime
                                                         (item.updated_parsed))
                    if publish_time < target:
                        #print('%s is older than %s, ignoring' % (publish_time,
                        #                                         target))
                        continue
                    when.append(item.updated)
            else:
                print('No feed listed for %s!' % student['irc'])

            student_posts[student['irc']] = len(when)

        average = sum(student_posts.values()) / float(len(student_posts))
        #print('Average of %f posts' % average)
        target_number = int((datetime.today() - target).total_seconds() /
                            timedelta(weeks=1).total_seconds() + 1)
        #for student, count in student_posts.items():
        #    if count > target_number:
        #        print('+++%d %s' % (count, student))
        #    elif count < target_number:
        #        print('---%d %s' % (count, student))
        #    else:
        #        print('===%d %s' % (count, student))
        #for student in student_data:
        #    print student
        return render_template('blogs.mak', name='mako',
                               student_data=student_data,
                               student_posts=student_posts,
                               gravatar=gravatar, average=average,
                               target_number=target_number)
