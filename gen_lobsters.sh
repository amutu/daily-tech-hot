find . -name 'lobsters-2*' | sort -r | head -7 | cut -b3- > /tmp/file.txt
sed -e 's/lobsters-hot\/lobsters-//g' -e 's/.md//g' /tmp/file.txt > /tmp/date.txt
sed -e 's/^/[lobsters hot /g' -e 's/$/]/g' /tmp/date.txt > /tmp/title.txt
sed -e 's/^/(/g' -e 's/$/)/g' /tmp/file.txt > /tmp/url.txt

echo "" >> ./README.md
echo "## lobsters hot: " >> ./README.md
echo "" >> ./README.md
paste -d '\0' /tmp/title.txt /tmp/url.txt | sed 's/$/  /g' >> ./README.md
