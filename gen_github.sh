find . -name 'github-top15-*' | sort -r | head -7 | cut -b3- > /tmp/file.txt
sed -e 's/github-top15\/github-top15-//g' -e 's/.md//g' /tmp/file.txt > /tmp/date.txt
sed -e 's/^/[github top hot /g' -e 's/$/]/g' /tmp/date.txt > /tmp/title.txt
sed -e 's/^/(/g' -e 's/$/)/g' /tmp/file.txt > /tmp/url.txt

echo "# github hot: " > ./README.md
echo "" >> ./README.md
paste -d '\0' /tmp/title.txt /tmp/url.txt | sed 's/$/  /g' >> ./README.md

./gen_lobsters.sh
