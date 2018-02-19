# danielanson.com
My Public website hosted on S3

1)  get a domain and write some html
2)  upload to an s3 bucket, in my case, danielanson.com, must be exact match to domain name.
3)  Write a bucket policy like so, this allows public access to pages/imgs/etc and allows the danson user from my master acct the ability to PutObject:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::danielanson.com/*"
        },
        {
            "Sid": "Stmt1518982431461",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::596017381274:user/danson"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::danielanson.com/*"
        }
    ]
}

4)  set up a bucket for www.danielanson.com and set it to redirect to danielanson.com.

5)  Commit everything to github, I am just pushing because its only me.

6)  get S3cmd, a better tool than aws s3 sync so everytime we add/commit/push a change, it get auto-synced with our s3 bucket:

brew install s3cmd

7)  Make sure and use the sync from s3cmd.  This syncs files that may not be present in s3 yet but are present in git, also using the --delete-removed flag removes any deleted files from the working dir.

8)  Write a git pre-push hook like so:

\#!/bin/bash
$ s3cmd sync --delete-removed . s3://danielanson.com --exclude '.git/\*' --exclude '.gitignore' --exclude 'README.md'

9)  We want to ensure the .gitignore file is in source control but it has no need in the s3 bucket.  Same as the .git folder which we dont want in source control or s3.

10)  Now as long as you add/commit/push in that order, your local repo will be in sync with both github and s3.