# .files

Pronounced <em>/'dɒtːfaɪlz/</em>. My repository of configuration files to be
shared between different working machines.

For organisational purposes they are kept *separate* from the actual home
directory, and inside a (conveniently hidden) folder `.files`.

Deployment happens via `make deploy`. This will read a local configuration file
(machine specific and thus not to be synched with Github) and only deploy the
components specified therein. Note that this will override files in the home
directory without questions asked – proceed with extreme caution and have a
backup handy!
