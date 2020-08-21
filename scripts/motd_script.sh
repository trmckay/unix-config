task sync

clear
echo ""

neofetch --disable Uptime Resolution WM Theme Icons Memory --off
task

echo ""
echo "from archinux.org:"
rsstail -u https://www.archlinux.org/feeds/news -1 -n 8 -N

echo ""
echo "from npr.org:"
rsstail -u https://feeds.npr.org/1001/rss.xml -1 -n 4 -N

echo ""
echo "from nytimes.com:"
rsstail -u https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml -1 -n 4 -N

echo ""
echo "from bbc.co.uk:"
rsstail -u http://feeds.bbci.co.uk/news/world/rss.xml -1 -n 4 -N

echo ""
echo "from cnn.com:"
rsstail -u http://rss.cnn.com/rss/edition.rss -1 -n 4 -N

/usr/bin/zsh
