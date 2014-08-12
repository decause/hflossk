<%inherit file="master.mak" />
<head>
    <script src="/static/js/pace.min.js"></script>
    <script src="/static/js/jquery.js"></script>
    <link href="/static/css/pace.css" rel="stylesheet" />
  <script>

    /**
     * getPostCount
     *
     *
     */
    function getPostCount(username) {
      var target = ${int(target_number)};
      $.ajax({
        url: "/blog/" + username,
        method: "GET",
        dataType: "json",
        success: function(data) {
          var count = data['number'];
          $('span#' + username).text(count);
          if (count >= target) {
            $('span#' + username).addClass('label-success');
          } else if (count >= target * 0.8) {
            $('span#' + username).addClass('label-warning');
          } else {
            $('span#' + username).addClass('label-danger');
          }
        }
      });
    }

    $(document).ready(function() {
      $.each($("div.student"), function(index, elem) {
        var username = $(elem).data('student');
        getPostCount(username);
      });
    });

  </script>
</head>

<div class="jumbotron">
  <h1>Participants</h1>
  <p>Should have ${int(target_number)} blog post(s)</p>
  <!--<p><a href="#" class="btn btn-primary btn-lg">Generate Report&raquo;</a></p>-->
</div>

<div class="row">
  %for student in student_data:
    <div class="col-sm-4">
      <div class="student shadowcard padded" data-student=${"../blogs/" + student['participant_page']}>
        <div>
          <img class="uglymug pull-left" src="${gravatar(student['rit_dce'] + '@rit.edu')}" alt="${student['irc']}'s Avatar" />
          <h4 class="item"><a href="${student['participant_page']}">${student['irc']}</a></h4>
          <div class="item blog clearfix">
            <a target="_blank" href="${student['blog']}">Blog</a>
            <span class="label" id=${student['irc']}></span>
          </div>
        </div>
        <ul class="cardlist list-unstyled">
          % for forge_link in student['forges']:
            <li><a target="_blank" href="${forge_link}">${forge_link}</a></li>
          % endfor

          <!--
          % if student.get('litreview1'):
            <li><a target="_blank" href="${student['litreview1']}">Litreview1</a></li>
          % else:
            <li class="redtext">litreview1?</li>
          % endif
          -->

          <% if 'hw' not in student: student['hw'] = [] %>
          % if student['isActive']:
            <% keys = ['quiz1', 'litreview1', 'bugfix', 'commarchpreso', 'commarchreport', 'teamprop1', 'teamprop2', 'litreview2', 'quiz2'] %>
            % for key in keys:
                % if key in student['hw']:
                  <li><a target="_blank" href="${student['hw'][key]}">${key}</a></li>
                % else:
                  <li class="redtext">${key}?</li>
                % endif
            % endfor
          % else:
            % for key in student['hw']:
              <li><a target="_blank" href="${student['hw'][key]}">${key}</a></li>
            % endfor
          % endif

          <!--This block used for quick grading reference ;)
          % if student.get('name'):
            <li>${student['name']}</li>
          % endif-->
        </ul>
        <!--<p><a class="btn" href="#">View details &raquo;</a></p>-->
      </div>
    </div><!--/span-->
    %if (loop.index + 1) % 3 == 0:
      </div>
      <div class="row">
    %endif
  %endfor
</div><!--/row-->
