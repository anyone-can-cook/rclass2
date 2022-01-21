% Setting up Git


## Setting up a GitHub account

If you have not already, make sure you have created an account on GitHub [here](https://github.com/) and are added to the [anyone-can-cook](https://github.com/anyone-can-cook) organization.

## Installing Git for Macs

Mac users should already have git installed. Open up your [**Terminal** application](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125/mac) and check that it is installed by running `git`. You should see some information about Git commands and usage being outputted to your screen.

If not, then you may need to install Git by downloading it from [here](https://git-scm.com/downloads).

## Installing Git for Windows

What is **Git for Windows**?

- Since Bash is not the default shell on Windows (unlike macOS), it must be installed. One way is by downloading [Git for Windows](https://gitforwindows.org/), which comes with Git Bash.
- "Git Bash is a package that installs Bash, some common bash utilities, and Git on a Windows operating system."
  - *Source: [Git Bash](https://www.atlassian.com/git/tutorials/git-bash) by Atlassian Tutorials*
- Specifically, this installation comes with executables that RStudio can find and use to make it possible to run Git and Bash commands in an RMarkdown code chunk.
  - *Source: [Install Git](https://happygitwithr.com/install-git.html) by Happy Git with R*

Steps to **install**:

- Download [Git for Windows](https://gitforwindows.org/) and run the installer
- You'll be going with the pre-selected (default) options for most steps _except one step towards the end as described later_
- One of the first screens you'll see in the setup process is the location where Git will be installed (e.g., `C:\Program Files\Git`). Leave it as default but just make a note of this path in case we need it later for troubleshooting purposes.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_install.png)</center>
- In the screen below, you can optionally select to install a shortcut to Git Bash on your Desktop for easier access.
<center>![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/master/assets/images/git_shortcut.png)</center>
- When asked about which default editor you would like Git to use, go with the option that is already pre-selected for you (i.e., Vim)
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

## Running bash in RMarkdown

Check that you are able to run bash in an RMarkdown code chunk:

- Create a new RMarkdown file
- Add a code chunk and indicate `{bash}`, as seen below
- Run `echo "Hello, World!"` inside the code chunk and make sure it works

![](https://raw.githubusercontent.com/anyone-can-cook/rclass2/main/assets/images/bash_chunk.png)

## Generating GitHub access token

What are **local** and **remote** repositories?

- Local vs. remote git repository:
    - __Local__ git repository: Git repository for a project stored on your machine
    - __Remote__ git repository: Git repository for a project stored on the internet (e.g., GitHub)
- Typically, a local git repository is connected to a remote git repository for collaboration
- A remote repository is identified by its URL, which can be used to connect your local repository
    - There are 2 types of URL: HTTPS and SSH
    - HTTPS and SSH are two different ways to authenticate that you are you
    - If you haven't set up SSH, then choose HTTPS (you will most likely be using this)
    
Steps to set up **access token**:

- If you are using **HTTPS**, you must first create a personal access token on GitHub following [these instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token)
- "Once you have a token, you can enter it instead of your password when performing Git operations over HTTPS." ([GitHub Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#using-a-token-on-the-command-line))

## Tutorials [optional]

- Codecademy tutorial (10-20 min read) 
    - Read through this tutorial on getting started with GitHub https://www.codecademy.com/articles/f1-u3-git-setup  
- Hello World GitHub Guide (10-20 min read) 
    - Read through this short tutorial on GitHub https://guides.github.com/activities/hello-world/  
