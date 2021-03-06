% Running Bash on Windows

## Installing Git for Windows

What is **Git for Windows**?

- Since Bash is not the default shell on Windows (unlike macOS), it must be installed. One way is by downloading [Git for Windows](https://gitforwindows.org/), which comes with Git Bash.
- "Git Bash is a package that installs Bash, some common bash utilities, and Git on a Windows operating system."
  - *Source: [Git Bash](https://www.atlassian.com/git/tutorials/git-bash) by Atlassian Tutorials*
- Specifically, this installation comes with executables that RStudio can find and use to make it possible to run Git and Bash commands in an RMarkdown code chunk.
  - *Source: [Install Git](https://happygitwithr.com/install-git.html) by Happy Git with R*

Steps to **install**:

- Download [Git for Windows](https://gitforwindows.org/) and run the installer
- You'll be going with the default option for most steps _except one step towards the end as described later_
- One of the first screens you'll see in the setup process is the location where Git will be installed (e.g., `C:\Program Files\Git`). Leave it as default but just make a note of this path in case we need it later for troubleshooting purposes.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_install.png)</center>
- In the screen below, you can optionally select to install a shortcut to Git Bash on your Desktop for easier access.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_shortcut.png)</center>
- When you get to the step shown below about **Adjusting your PATH environment**, make sure to select **Use Git and optional Unix tools from the Command Prompt**. If you do not, you may run into the issue described in the troubleshooting section below.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_path.png)</center>
- After you finish the installation process, check that **Git Bash** is your default terminal in **RStudio** by going under `Tools` > `Global Options...` (`Terminal` tab). You may need to restart **RStudio** for changes to be reflected.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_bash.png)</center>

## Troubleshooting

`PATH` environment variable:

- If you are not able to run Bash in an RMarkdown code chunk after installing Git for Windows, it may be because RStudio is not able to locate the necessary executables since its directory is not in your `PATH` environment variable
- "[`PATH`] specifies the directories in which executable programs are located on the machine that can be started without knowing and typing the whole path to the file on the command line."
  - *Source: [Super User](https://superuser.com/a/284351) answer*

Adding to `PATH` on Windows:

- You can run R code to check if the Bash executable is in your `PATH`
  - `Sys.which('bash')`: Path to your Bash executable (e.g., `C:\Program Files\Git\bin`)
  - `Sys.getenv('PATH')`: `PATH` environment variable containing list of paths separated by `;` that your machine knows to look for
- If the path to your Bash executable is not part of your `PATH`, you can add it
- One way to do it is by running the R command `Sys.setenv()` seen [here](https://github.com/orgs/Rucla-ed/teams/announcements/discussions/3?from_comment=2#discussion-3-comment-2), but this only modifies the `PATH` for your current R session
- Instead, you can follow [these steps](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/) to add `C:\Program Files\Git\bin` to your `PATH`
