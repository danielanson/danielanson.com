# danielanson.com
My Public website hosted on S3

get S3cmd, a better tool than aws s3 sync:

brew install s3cmd

Make sure and use the sync from s3cmd.  This syncs files
that may not be present in s3 yet but are present in git, also
using the --delete-removed flag removes any deleted files from
the working dir.

$ s3cmd sync --delete-removed . s3://danielanson.com --exclude '.git/\*' --exclude '.gitignore' --exclude 'README.md'

We want to ensure the .gitignore file is in source control but
it has no need in the s3 bucket.  Same as the .git folder which
we dont want in source control or s3.

Create the git pre-push hook"

\#!/bin/bash

$ s3cmd sync --dry-run --delete-removed . s3://danielanson.com --exclude '.git/\*' --exclude '.gitignore' --exclude 'README.md'

exit 0
