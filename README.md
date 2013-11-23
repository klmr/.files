# .files

Pronounced <em>/'dɒtːfaɪlz/</em>. My repository of configuration files to be
shared between different working machines.

For organisational purposes they are kept *separate* from the actual home
directory, and inside a (conveniently hidden) folder `.files`.

Deployment happens via `./deploy`. This will read a local configuration file
(machine specific and thus not to be synched with Github) and only deploy the
components specified therein. Note that this will override files in the home
directory without questions asked – proceed with extreme caution and have a
backup handy!

## Configuration & deployment

To deploy the files to the local home directory, run `./deploy`. This will read
two configuration files to determine which config files to install:

 * [`components.conf`](components.conf): This file defines which files belong to
   which logical “components”, which form the units of installation. This file
   should reflect the files that are actually part of the repository, rather
   than any local machine configuration.
 * `local.conf`: The local (= machine specific) configuration. This contains a
   simple list of components to install on the local machine. Since the file is
   machine specific, it is not part of `origin/master` (but a local branch may
   be appropriate?). However, this repository has an
   [`example.conf`](example.conf) which can be used instead.


## To do

Modules to add:

 * `Rprofile`
 * `vimrc`
 * Vim modules (separate from `vimrc`?)
 * `lessrc`, `ackrc` etc.
 * Git/Mercurial config (but without user details?!)
