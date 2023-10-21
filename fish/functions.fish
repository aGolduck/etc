function cgh
    set repo_url (string replace -r 'https://github.com/' '' $argv[1])
    set repo_name (string replace -r '.git' '' $repo_url)
    git clone https://github.com/$repo_url.git ~/g/$repo_name
end

alias random-file 'fd \
--exclude ~/Applications \
--exclude ~/Library \
-t f . ~ -0 | shuf -zn1 | xargs -0 open -R'
