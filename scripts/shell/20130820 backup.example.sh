Это для случая испльзования почтовой программы mailx.

#!/bin/bash
rsync --delete --log-file=/path/to/$(date +%Y%m%d)_logfile.log -avzq /path/to/source/directory/ /path/to/backup/directory/
cat /path/to/$(date +%&%m%d)_logfile.log | mail -s “subject line here” youremail@domain.com


или в случае использования почтовой программы mutt
cat /path/to/$(date +%Y%m%d)_logfile.log | mutt -s “subject line here” youremail@domain.com
