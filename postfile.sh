#!/bin/bash
curl -H "Content-Type: multipart/form-data"  -X POST -F "file=@$1" https://testbot01001.freesites.eu.org/upload.php