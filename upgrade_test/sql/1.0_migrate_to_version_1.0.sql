\! gpconfig -c shared_preload_libraries -v 'diskquota.so' > /dev/null
\! gpstop -raf > /dev/null

\! gpconfig -s 'shared_preload_libraries'

\c
alter extension diskquota update to '1.0';
-- downgrade to 1.0 need reboot, the version check is not in 1.0
-- worker status is undefined at just downgrade
\! gpstop -arf > /dev/null
