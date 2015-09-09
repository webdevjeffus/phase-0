# 1.1 Think About Time Reflection

To begin with, I spent longer on this assignment than I should have -- which is evidence that I need to work on the exact content of the research in my own life. I have difficulty making myself skim and survey multiple resources on a topic; either I'm interested in it, in which case I read each resource fully instead of skimming for highlights, or I'm not interested, in which case I breeze over the content so quickly and casually that I don't retain anything. These are obviously focus and time-management skills and habits I need to improve.

In general, these resources focused on...well...focus, as well as improving time management and productivity through building better habits and understanding how humans approach tasks. I'd encountered the concept of flow previously, though I'd never seen it connected to hyperfocus before. Hyperfocus is definitely a trait I often exhibit, becoming engrossed in an activity to the point that I don't take a break for many hours in a row. Many times, I've sat down at the computer after putting my daughter to bed, gotten involved in a project, and suddenly realized it was morning when the dog started crying to go out at sunrise. When I'm really engaged in a task, I have very little awareness of the passage of time...is this (good) flow, or (bad) hyperfocus? You tell me...

I generally liked the strategy of breaking things down into small, achievable chunks, a theme which was raised in many of the resources. I dug out an old kitchen timer and put it on my desk to try out Pomodoro. The hardest part is stopping at 25 minutes for the break, no matter what -- that bell breaks flow, but maybe that's a good thing. It certainly causes you to think about your task in half-hour chunks, instead of as a monolithic, all-day or all-week endeavor. And when building new habits, I really liked (and will attempt to implement) the strategy of taking inconvenient or unappealing responsibilities, starting with their minimum viable version (floss one tooth!), and attaching them to an existing behavior or habit. I will try to use this strategy to build habits in meditation, exercise, and daily responsibilities.

I'll continue to ruminate on these ideas, and perhaps post back when I've seen how they can affect my life, routines, and productivity.


# 1.2 The Command Line Reflection

### What is a shell? What is "bash?"

The shell is a command-line interface for working with files and programs on the computer without a GUI. It's called the terminal on a Mac (and Linux? don't recall...), and the DOS prompt on a Windows machine (although Zed Shaw recommends using PowerShell over the vanilla DOS prompt). Bash is a specific shell originally written for GNU, and now available for all major operating systems, including UNIX, Windows, and others. Bash is the dominant shell in use today.


### What was the most challenging for you in going through this material?

The most challenging part of working with the command line is learning and recalling all the commands, and especially their flags. I wound up creating my own reference document, listing the commands, their names, and brief descriptions of how to use them, along with their most useful flags -- writing things out helps me to internalize new information.

The other challenge when dealing with the shell is the anxiety that goes along with knowing that if misused, some shell commands can do real damage to your directory structure and files; I had a bit of a scare when I tried copying the contents of the current directory into a subdirectory with the **-r** (recursive) flag. This triggered a potentially infinite loop which created a deep, redundant directory tree before the system cut the process off. I was initially concerned that I might have filled my entire drive with millions of nested copies of a test directory, but it turned out to have cut off before it beyond a few dozen subdirectories, and I was able to use **rm -r** to remove them with a single command. (Whew.)


### Were you able to successfully use all of the commands?

Yes, I had no problem using the commands presented. I paused the video to try out each command as it was presented, and note it in my own reference document. When I did the Crash Course, I tried out any new commands or flags that hadn't been covered in the video, and added those to the reference document.


### In your opinion, what are the most important commands and arguments to know?

I'm sure I'd give a different answer in a few weeks (probably having to do with shell scripting), but for now, I'll say the commands which let you control the directory structure (**cd, mkdir, rmdir, rm, cp,** etc.). I started on PCs back in the DOS era (a few years before Windows 3.1), so I was very used to running my computer from the command line back then, and got pretty good at handling files and directories with it.


### Remember what each of the following does off the top of your head

- **pwd** -- Print Working Directory

- **ls** -- List directory contents (has several useful flags to refine output)

- **mv** -- Move (rename); lets you change the path and the file name for a file.

- **cd** -- Call Directory

- **../** -- parent directory of the current working directory

- **touch** -- create an empty file

- **mkdir** -- make a new directory

- **less** -- display the file on screen, allowing user to page up and down through the file

- **rmdir** -- Remove Directory; won't work if the directory isn't empty

- **rm** -- Remove; deletes file(s). With the -r flag, it can be used to delete a specified directory, along with any contents, including sub-directories (Danger, Will Robinson!)

- **help** -- Accesses general bash help; use man <command-name> to get full information about a specific command, including the meaning of all applicable flags.


# 1.4 Forking and Cloning Reflection

### Write instructions to create a new repo, fork a repo, and clone a repo?

**Create a new repo:**

1. Navigate to your own profile page on GitHub.
2. Click the "+" menu and choose "New Repository."
3. Give the new repo a unique, memorable and descriptive name; a one-line description; set the repo to Public; choose a license (MIT for DBC repos).
4. (I notice that in the directions for making a new, "phase-0" repo, we didn't make a README file...I assume that can be added later.)
5. Click "Create Repository."

**Fork an existing repo:**

1. Navigate to the GitHub page for the existing repo.
2. Click the "Fork" button at the top left corner of the page.
3. When asked where to fork the repo, select your own GitHub account.

**Clone a repo to your local system:**

1. After forking the repo, go to the page for your forked repo in your GitHub account (not the original master repo).
2. Click "Copy to clipboard" under "HTTPS clone URL" at the lower right corner of the page.
3. On your own computer, open a terminal session and navigate to the directory you intend to be the parent directory for the local version of the repo.
4. Enter at the prompt: "git clone <paste repo URL here>"
5. To verify the presence of the cloned repo, navigate to its directory and view the entire repo in Sublime by typing "subl ." (That's "subl" followed by a space and a period, which specifies the current directory.)


### Why would you fork a repository as opposed to create a new one?

This seems like a very obvious question, so I'm probably missing its subtlety somewhere, but the reason to fork an existing repo is that you intend to build upon existing code, either as a branch of the main project, or as a separate and divergent product. You'd create a new, empty repo in order to house an all-new project.


### What struggles did you have setting up git and GitHub? What did you learn in the process?

For me, the biggest stressor in getting rolling in git and GitHub is learning to deal with the lack of feedback you get when working in the terminal. At least having gone thru the last couple of assignments, I've learned enough to check myself at the command line with **pwd, ls,** etc., which eases some of the anxiety. Aside from that, I just followed the instructions as written in the module, and things seem to have worked out.

I was also confused when the directions told me, "You should now see the folder with the same name as the repo you cloned. Navigate into this folder with cd and open it in Sublime." I didn't know that it was possible to "open" a folder in a text editor. I fretted for a few minutes, then just typed in "subl .", not expecting it to do anything at all. I was pleasantly surprised when Sublime popped open with the entire directory, including subdirectories and files, popped open in a familiar, tree-style display in the left-hand nav column in the Sublime window.



### What is a commit?

*(This appears on the rubric for this assignment, though I am pretty sure it's just a copy-paste artifact from the rubric for the same question on the previous assignment. In that spirit, I've copied-and-pasted my answer from that assignment here.)*

A commit is a snapshot of a branch of a project, captured and archived at any point in the development process that seems "important" to the developer(s). For example, a developer might make a commit after finding and fixing a bug; implementing a single feature; or simply at the end of a work session. Of course, different developers are going to have different ideas of what constitutes a point "important" enough to merit a commit -- one developer might make commits several times a day, while another might go a day or even longer to make a commit, when she finishes a particular task on the project.