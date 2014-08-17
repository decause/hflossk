import os
import time
import feedparser
from datetime import datetime

base_dir = os.getcwd()
if os.path.isdir(os.path.join(os.getcwd(), "app-root", "repo")):
    base_dir = os.path.join(os.getcwd(), "app-root", "repo")


def app_path(*args):
    return os.path.join(base_dir, *args)


def count_posts(feed, start_dt):
    """
    Return the number of entries on this blog feed since a
    start date.

    :param feed: the url to the RSS or Atom feed for the blog
    :type feed: str

    :param start_dt: the start date after which posts will be counted
    :type start_dt: datetime

    :returns: the count of posts in the RSS feed after the start date
    :rtype: int

    """

    count = 0
    feed = feedparser.parse(feed)
    for item in feed.entries:
        publish_time = datetime.fromtimestamp(time.mktime(item.updated_parsed))
        if publish_time < start_dt:
            continue
        count += 1
    return count
