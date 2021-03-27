files='
test-data.zip
'

for file in $files; do
    # call the load_tweets.py file to load data into pg_normalized
    :
done

for file in $files; do
	unzip -p $file | sed 's/\\u0000//g' | psql postgres://postgres:pass@localhost:2303/ -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
    # use SQL's COPY command to load data into pg_denormalized
done
