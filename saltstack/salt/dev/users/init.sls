{% for user, details in pillar['dev_users'].iteritems() %}
{{ user }}:
  user.present:
    - home: /home/{{ user }}
    - uid: {{ details['uid'] }}
    - password: {{ details['password'] }}
    - shell: /bin/bash
{% endfor %}
