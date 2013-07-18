<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>My Webpage</title>
</head>
<body>
    {{ seq['one', 'two', 'three'] }}
    <ul>
    {% for item in seq %}
        <li>{{ item }}</li>
    {% endfor %}
    </ul>
</body>
</html>
