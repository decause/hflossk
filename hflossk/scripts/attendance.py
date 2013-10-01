import sys
import urllib2
from BeautifulSoup import BeautifulSoup

# List of the default months the HFOSS course runs
months = ["09", "10", "11", "12"]

# Scrape the whole page
page = urllib2.urlopen("http://yacht.rit.edu/meetings/rit-foss/2013/")
bigSoup = BeautifulSoup(page)

# Find all of the links
links = bigSoup.findAll('a')
html = []

# Add only the links that end in .html to a list
for link in links:

    type1 = link.getText().split('.')[-1]
    type2 = link.getText().split('.')[-2]

    # Filters out *.log.html links
    if "html" in type1 and "log" not in type2:

        # Gather date information about the log
        date = link.getText().split('.')[1]
        year = date.split('-')[0]
        month = date.split('-')[1]
        day = date.split('-')[2]

        # No user input
        if len(sys.argv) == 1:
            html.append(link)

        # Check user input for a specific year
        if len(sys.argv) == 2:
            if sys.argv[1] in year:
                html.append(link)

        # Check user input for a specific year and month
        elif len(sys.argv) == 3:
            if sys.argv[1] in year:
                if sys.argv[2] in month:
                    html.append(link)

        # Check user input for a specific year, month, and day
        elif len(sys.argv) == 4:
            if sys.argv[1] in year:
                if sys.argv[2] in month:
                    if sys.argv[3] in day:
                        html.append(link)

# Scrape each link for the attendance
for link in html:
    page = urllib2.urlopen("http://yacht.rit.edu/meetings/rit-foss/" +
                           str(link.getText().split('.')[1].split('-')[0]) +
                           "/" + str(link.getText()))
    smallSoup = BeautifulSoup(page)

    # Find all the people who attended the meeting (class)
    people = smallSoup.findAll('h3')[-1].findAllNext('li')
    present = []

    # Populate a list of people who were present during rollcall
    for name in people:
        present.append(name.getText().split()[0])

    # List of students in the class
    class_list = ["AgitatedBadger", "Akaleth", "ArcticSphinx", "Fangy",
                  "BeruBeruFunBot", "ChrisKnepper", "Consuuume",
                  "Destroyer675000", "dudeman514", "ExplosiveHippo",
                  "Grub0", "LinkSlayer64", "Nolski", "Obliv|class",
                  "Spectralshadow5", "TheOnlyTaters", "Waterseas", "Xethik",
                  "edwfoss", "emmix", "gecko_", "h2g2guy", "valeatory",
                  "zanarama1"]

    date = link.getText().split('.')[1]
    year = date.split('-')[0]
    month = date.split('-')[1]
    day = date.split('-')[2]

    # Display the date
    print("\n###### Attendance for {0}-{1}-{2} ######".format(
        year, month, day))

    # Print out each student's status that day
    for student in class_list:
        if student in present:
            print("%s was present!" % student)
        else:
            print("%s was not in class." % student)
