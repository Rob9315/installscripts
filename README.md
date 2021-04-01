# installscripts
my installscripts for different distros

DISCLAIMER: USE AT OWN RISK
these scripts always reflect my current preferences and will change over time without notice, though they might be helpful to you

to use your own dotfiles repo, export a shell variable beforehand (with https:// prefix like `https://github.com/rob9315/dotfiles`)
the dotfiles repo has to have a format similar to as described [here](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained)
```sh
export dotfilesrepo="yourrepohere"
```

curl command: 
```sh
sh -c "$(curl "https://raw.githubusercontent.com/rob9315/installscripts/master/ezauto.sh")"
```
