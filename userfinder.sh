#!/bin/bash

printf "\e[1;77m __   __  ______  _______  ______      _______  ___  __    _  ______   _______  ______ \e[0m\n"
printf "\e[1;77m|  | |  ||      ||       ||    _ |    |       ||   ||  |  | ||      | |       ||    _ |\e[0m\n"
printf "\e[1;77m|  | |  ||  ____||    ___||   | ||    |    ___||   ||   |_| ||  _    ||    ___||   | ||\e[0m\n"
printf "\e[1;77m|  |_|  || |____ |   |___ |   |_||_   |   |___ |   ||       || | |   ||   |___ |   |_||_ \e[0m\n"
printf "\e[1;77m|       ||____  ||    ___||    __  |  |    ___||   ||  _    || |_|   ||    ___||    __  |\e[0m\n"
printf "\e[1;77m|       | ____| ||   |___ |   |  | |  |   |    |   || | |   ||       ||   |___ |   |  | |\e[0m\n"
printf "\e[1;77m|_______||______||_______||___|  |_|  |___|    |___||_|  |__||______| |_______||___|  |_|\e[0m\n"
printf "\n"
printf "\e[1;93m             .:.:;..\e[0m\e[1;77m UserFinder v1.0 Developer: misha korzhik \e[0m\e[1;93m..;:.:.\e[0m\n"
printf "\n"


## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$1" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s\n" $1
printf "https://www.instagram.com/%s\n" $1 > $1.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## Facebook

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$1" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com/%s\n" $1
printf "https://www.facebook.com/%s\n" $1 >> $1.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## TWITTER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$1" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com/%s\n" $1
printf "https://www.twitter.com/%s\n" $1 >> $1.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## YOUTUBE

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$1" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com/%s\n" $1
printf "https://www.youtube.com/%s\n" $1 >> $1.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## BLOGGER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$1.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.blogspot.com\n" $1
printf "https://%s.blogspot.com\n" $1 >> $1.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## GLOOGLE PLUS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GooglePlus: \e[0m"
check=$(curl -s "https://plus.google.com/+$1/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://plus.google.com/+%s/posts\n" $1
printf "https://plus.google.com/+%s/posts\n" $1 >> $1.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## REDDIT

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check1=$(curl -s -i "https://www.reddit.com/user/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.reddit.com/user/%s\n" $1
printf "https://www.reddit.com/user/%s\n" $1 >> $1.txt
fi

## WORDPRESS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wordpress: \e[0m"
check1=$(curl -s -i "https://$1.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.wordpress.com\n" $1
printf "https://%s.wordpress.com\n" $1 >> $1.txt
fi

## PINTEREST

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check1=$(curl -s -i "https://www.pinterest.com/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.pinterest.com/%s\n" $1
printf "https://www.pinterest.com/%s\n" $1 >> $1.txt
fi

## GITHUB

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check1=$(curl -s -i "https://www.github.com/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.github.com/%s\n" $1
printf "https://www.github.com/%s\n" $1 >> $1.txt
fi

## TUMBLR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check1=$(curl -s -i "https://$1.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.tumblr.com\n" $1
printf "https://%s.tumblr.com\n" $1 >> $1.txt
fi

## FLICKR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check1=$(curl -s -i "https://www.flickr.com/people/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.flickr.com/photos/%s\n" $1
printf "https://www.flickr.com/photos/%s\n" $1 >> $1.txt
fi

## STEAM

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check1=$(curl -s -i "https://steamcommunity.com/id/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://steamcommunity.com/id/%s\n" $1
printf "https://steamcommunity.com/id/%s\n" $1 >> $1.txt
fi

## VIMEO

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check1=$(curl -s -i "https://vimeo.com/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://vimeo.com/%s\n" $1
printf "https://vimeo.com/%s\n" $1 >> $1.txt
fi


## SoundCloud

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SoundCloud: \e[0m"
check1=$(curl -s -i "https://soundcloud.com/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://soundcloud.com/%s\n" $1
printf "https://soundcloud.com/%s\n" $1 >> $1.txt
fi

## DISQUS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Disqus: \e[0m"
check1=$(curl -s -i "https://disqus.com/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://disqus.com/%s\n" $1
printf "https://disqus.com/%s\n" $1 >> $1.txt
fi

## MEDIUM

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Medium: \e[0m"
check1=$(curl -s -i "https://medium.com/@$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://medium.com/@%s\n" $1
printf "https://medium.com/@%s\n" $1 >> $1.txt
fi

## DEVIANTART

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check1=$(curl -s -i "https://$1.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.deviantart.com\n" $1
printf "https://%s.deviantart.com\n" $1 >> $1.txt
fi

## VK

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] VK: \e[0m"
check1=$(curl -s -i "https://vk.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://vk.com/%s\n" $1
printf "https://vk.com/%s\n" $1 >> $1.txt
fi

## About.me

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check1=$(curl -s -i "https://about.me/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://about.me/%s\n" $1
printf "https://about.me/%s\n" $1 >> $1.txt
fi

## Spotify

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check1=$(curl -s -i "https://open.spotify.com/user/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://open.spotify.com/user/%s\n" $1
printf "https://open.spotify.com/user/%s\n" $1 >> $1.txt
fi

## MixCloud

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] MixCloud: \e[0m"
check1=$(curl -s -i "https://www.mixcloud.com/$1" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.mixcloud.com/%s\n" $1
printf "https://www.mixcloud.com/%s\n" $1 >> $1.txt
fi

## Scribd

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Scribd: \e[0m"
check1=$(curl -s -i "https://www.scribd.com/$1" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.scribd.com/%s\n" $1
printf "https://www.scribd.com/%s\n" $1 >> $1.txt
fi

## Badoo

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Badoo: \e[0m"
check1=$(curl -s -i "https://www.badoo.com/en/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.badoo.com/en/%s\n" $1
printf "https://www.badoo.com/en/%s\n" $1 >> $1.txt
fi

# Patreon

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check1=$(curl -s -i "https://www.patreon.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.patreon.com/%s\n" $1
printf "https://www.patreon.com/%s\n" $1 >> $1.txt
fi

## BitBucket

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] BitBucket: \e[0m"
check1=$(curl -s -i "https://bitbucket.org/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://bitbucket.org/%s\n" $1
printf "https://bitbucket.org/%s\n" $1 >> $1.txt
fi

## CashMe

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CashMe: \e[0m"
check1=$(curl -s -i "https://cash.me/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://cash.me/%s\n" $1
printf "https://cash.me/%s\n" $1 >> $1.txt
fi

## Behance

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Behance: \e[0m"
check1=$(curl -s -i "https://www.behance.net/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.behance.net/%s\n" $1
printf "https://www.behance.net/%s\n" $1 >> $1.txt
fi

## GoodReads

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GoodReads: \e[0m"
check1=$(curl -s -i "https://www.goodreads.com/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.goodreads.com/%s\n" $1
printf "https://www.goodreads.com/%s\n" $1 >> $1.txt
fi

## Instructables

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instructables: \e[0m"
check1=$(curl -s -i "https://www.instructables.com/member/$1" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.instructables.com/member/%s\n" $1
printf "https://www.instructables.com/member/%s\n" $1 >> $1.txt
fi

## KeyBase

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Keybase: \e[0m"
check1=$(curl -s -i "https://keybase.io/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://keybase.io/%s\n" $1
printf "https://keybase.io/%s\n" $1 >> $1.txt
fi

## Kongregate

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Kongregate: \e[0m"
check1=$(curl -s -i "https://kongregate.com/accounts/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://kongregate.com/accounts/%s\n" $1
printf "https://kongregate.com/accounts/%s\n" $1 >> $1.txt
fi

## Livejournal

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] LiveJournal: \e[0m"
check1=$(curl -s -i "https://$1.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.livejournal.com\n" $1
printf "https://%s.livejournal.com\n" $1 >> $1.txt
fi

## AngelList

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] AngelList: \e[0m"
check1=$(curl -s -i "https://angel.co/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://angel.co/%s\n" $1
printf "https://angel.co/%s\n" $1 >> $1.txt
fi

## Last.fm

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] last.fm: \e[0m"
check1=$(curl -s -i "https://last.fm/user/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://last.fm/user/%s\n" $1
printf "https://last.fm/user/%s\n" $1 >> $1.txt
fi

## Dribbble

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Dribbble: \e[0m"
check1=$(curl -s -i "https://dribbble.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://dribbble.com/%s\n" $1
printf "https://dribbble.com/%s\n" $1 >> $1.txt
fi

## Codecademy

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Codecademy: \e[0m"
check1=$(curl -s -i "https://www.codecademy.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.codecademy.com/%s\n" $1
printf "https://www.codecademy.com/%s\n" $1 >> $1.txt
fi

## Gravatar

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gravatar: \e[0m"
check1=$(curl -s -i "https://en.gravatar.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://en.gravatar.com/%s\n" $1
printf "https://en.gravatar.com/%s\n" $1 >> $1.txt
fi

## Pastebin

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check1=$(curl -s -i "https://pastebin.com/u/$1" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://pastebin.com/u/%s\n" $1
printf "https://pastebin.com/u/%s\n" $1 >> $1.txt
fi

## Foursquare

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Foursquare: \e[0m"
check1=$(curl -s -i "https://foursquare.com/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://foursquare.com/%s\n" $1
printf "https://foursquare.com/%s\n" $1 >> $1.txt
fi

## Roblox

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Roblox: \e[0m"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://foursquare.com/%s\n" $1
printf "https://foursquare.com/%s\n" $1 >> $1.txt
fi

## Gumroad

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gumroad: \e[0m"
check1=$(curl -s -i "https://www.gumroad.com/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.gumroad.com/%s\n" $1
printf "https://www.gumroad.com/%s\n" $1 >> $1.txt
fi

## Newgrounds

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Newgrounds: \e[0m"
check1=$(curl -s -i "https://$1.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.newgrounds.com\n" $1
printf "https://%s.newgrounds.com\n" $1 >> $1.txt
fi

## Wattpad

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wattpad: \e[0m"
check1=$(curl -s -i "https://www.wattpad.com/user/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.wattpad.com/user/%s\n" $1
printf "https://www.wattpad.com/user/%s\n" $1 >> $1.txt
fi

## Canva

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Canva: \e[0m"
check1=$(curl -s -i "https://www.canva.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.canva.com/%s\n" $1
printf "https://www.canva.com/%s\n" $1 >> $1.txt
fi

## CreativeMarket

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CreativeMarket: \e[0m"
check1=$(curl -s -i "https://creativemarket.com/$1" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://creativemarket.com/%s\n" $1
printf "https://creativemarket.com/%s\n" $1 >> $1.txt
fi

## Trakt

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trakt: \e[0m"
check1=$(curl -s -i "https://www.trakt.tv/users/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.trakt.tv/users/%s\n" $1
printf "https://www.trakt.tv/users/%s\n" $1 >> $1.txt
fi

## 500px

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] 500px: \e[0m"
check1=$(curl -s -i "https://500px.com/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://500px.com/%s\n" $1
printf "https://500px.com/%s\n" $1 >> $1.txt
fi

## Buzzfeed

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check1=$(curl -s -i "https://buzzfeed.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://buzzfeed.com/%s\n" $1
printf "https://buzzfeed.com/%s\n" $1 >> $1.txt
fi

## TripAdvisor

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] TripAdvisor: \e[0m"
check1=$(curl -s -i "https://tripadvisor.com/members/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://tripadvisor.com/members/%s\n" $1
printf "https://tripadvisor.com/members/%s\n" $1 >> $1.txt
fi

## HubPages

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HubPages: \e[0m"
check1=$(curl -s -i "https://$1.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.hubpages.com/\n" $1
printf "https://%s.hubpages.com/\n" $1 >> $1.txt
fi

## Contently

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Contently: \e[0m"
check1=$(curl -s -i "https://$1.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.contently.com\n" $1
printf "https://%s.contently.com\n" $1 >> $1.txt
fi

## Houzz

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Houzz: \e[0m"
check1=$(curl -s -i "https://houzz.com/user/$1" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://houzz.com/user/%s\n" $1
printf "https://houzz.com/user/%s\n" $1 >> $1.txt
fi

## blip.fm

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] blip.fm: \e[0m"
check1=$(curl -s -i "https://blip.fm/$1" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://blip.fm/%s\n" $1
printf "https://blip.fm/%s\n" $1 >> $1.txt
fi

## Wikipedia

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.wikipedia.org/wiki/User:%s\n" $1
printf "https://www.wikipedia.org/wiki/User:%s\n" $1 >> $1.txt
fi

## HackerNews

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HackerNews: \e[0m"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$1" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://news.ycombinator.com/user?id=%s\n" $1
printf "https://news.ycombinator.com/user?id=%s\n" $1 >> $1.txt
fi

## CodeMentor

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CodeMentor: \e[0m"
check1=$(curl -s -i "https://www.codementor.io/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.codementor.io/%s\n" $1
printf "https://www.codementor.io/%s\n" $1 >> $1.txt
fi

## ReverbNation

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ReverbNation: \e[0m"
check1=$(curl -s -i "https://www.reverbnation.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.reverbnation.com/%s\n" $1
printf "https://www.reverbnation.com/%s\n" $1 >> $1.txt
fi

## Designspiration 65

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Designspiration: \e[0m"
check1=$(curl -s -i "https://www.designspiration.net/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.designspiration.net/%s\n" $1
printf "https://www.designspiration.net/%s\n" $1 >> $1.txt
fi

## Bandcamp

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Bandcamp: \e[0m"
check1=$(curl -s -i "https://www.bandcamp.com/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.bandcamp.com/%s\n" $1
printf "https://www.bandcamp.com/%s\n" $1 >> $1.txt
fi


## ColourLovers

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ColourLovers: \e[0m"
check1=$(curl -s -i "https://www.colourlovers.com/love/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.colourlovers.com/love/%s\n" $1
printf "https://www.colourlovers.com/love/%s\n" $1 >> $1.txt
fi


## IFTTT

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] IFTTT: \e[0m"
check1=$(curl -s -i "https://www.ifttt.com/p/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.ifttt.com/p/%s\n" $1
printf "https://www.ifttt.com/p/%s\n" $1 >> $1.txt
fi

## Ebay

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ebay: \e[0m"
check1=$(curl -s -i "https://www.ebay.com/usr/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.ebay.com/usr/%s\n" $1
printf "https://www.ebay.com/usr/%s\n" $1 >> $1.txt
fi

## Slack

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Slack: \e[0m"
check1=$(curl -s -i "https://$1.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.slack.com\n" $1
printf "https://%s.slack.com\n" $1 >> $1.txt
fi

## OkCupid

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.okcupid.com/profile/%s\n" $1
printf "https://www.okcupid.com/profile/%s\n" $1 >> $1.txt
fi

## Trip

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trip: \e[0m"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://www.trip.skyscanner.com/user/%s\n" $1
printf "https://www.trip.skyscanner.com/user/%s\n" $1 >> $1.txt
fi

## Ello

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ello: \e[0m"
check1=$(curl -s -i "https://ello.co/$1" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://ello.co/%s\n" $1
printf "https://ello.co/%s\n" $1 >> $1.txt
fi

## Tracky

#printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tracky: \e[0m"
#check1=$(curl -s -i "https://tracky.com/user/$1" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)

#if [[ $check1 == *'1'* ]] ; then
#printf "\e[1;93mNot Found!\e[0m\n"
#elif [[ $check1 == *'0'* ]]; then

#printf "\e[1;92m Found!\e[0m https://tracky.com/~%s\n" $1
#printf "https://tracky.com/~%s\n" $1 >> $1.txt
#fi

## Tripit

#printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tripit: \e[0m"
#check1=$(curl -s -i "https://www.tripit.com/people/$1#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location: https://www.tripit.com/home' ; echo $?)

#if [[ $check1 == *'0'* ]] ; then
#printf "\e[1;93mNot Found!\e[0m\n"
#elif [[ $check1 == *'1'* ]]; then

#printf "\e[1;92m Found!\e[0m https://www.tripit.com/people/%s#/profile/basic-info\n" $1
#printf "https://www.tripit.com/people/%s#/profile/basic-info\n" $1 >> $1.txt
#fi

## Basecamp

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Basecamp: \e[0m"
check1=$(curl -s -i "https://$1.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then

printf "\e[1;92m Found!\e[0m https://%s.basecamphq.com/login\n" $1
printf "https://%s.basecamphq.com/login\n" $1 >> $1.txt
fi
