import datetime


def season():
    if datetime.date.today().month > 6:
        return "fall"
    return "spring"


def year():
    return str(datetime.date.today().year)
