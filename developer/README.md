Developer
=========

Environment
-----------

Presuming you cloned each project under `~/lsn`:

Link `/usr/local/src/lsn` to `~/lsn`

Copy `./profile.sh` to `/etc/profile.d/livesite.sh` (or otherwise inlcude
it in your environment).

Syntax
------

Overlay `./vim` on top of your `~/.vim`.

Web Development
---------------

To run from sources, run `./link-to-source.sh` after you've fetched the lsn- 
projects. This will mimic an installation, that is:

    /usr/lib/livesite
    /usr/share/livesite

will contain symlinks to corresponding source folders throughout the
project hierarchy.
