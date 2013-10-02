import yaml
import feedparser
from datetime import datetime, timedelta
import time

yaml_file = 'people.yaml'

def check_blogs():
    with open(yaml_file) as students:
        student_data = yaml.load(students)

    student_posts = {}
    target = datetime(2013, 06, 02)
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
                #if 'summary' in item:
                #    print item.summary
                publish_time = datetime.fromtimestamp(time.mktime(item.updated_parsed))
                if publish_time < target:
                    #print('%s is older than %s, ignoring' % (publish_time, target))
                    continue
                when.append(item.updated)

        else:
            print('No feed listed for %s!' % student['irc'])

        student_posts[student['irc']] = len(when)

    average = sum(student_posts.values()) / float(len(student_posts))
    print('Average of %f posts' % average)
    target_number = (datetime.today() - target).total_seconds() /\
        timedelta(weeks=1).total_seconds()
    for student, count in student_posts.items():
        if count > target_number:
            print('+++%d %s' % (count, student))
        elif count < target_number:
            print('---%d %s' % (count, student))
        else:
            print('===%d %s' % (count, student))


#ini_to_yaml()
check_blogs()
