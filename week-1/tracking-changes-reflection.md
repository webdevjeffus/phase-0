# 1.5 Tracking Changes Reflection

### Reflection questions

**How does tracking and adding changes make developers' lives easier?**

Tracking and adding changes automatically creates an indexed, retrievable archive of versions of the project at every important point in its development, and makes it possible for changes made by different developers working simultaneously to be integrated into a single, master version of the project, without creating conflicts or losing work.

**What is a commit?**

In making a commit, a dev creates a snapshot of the project in his present state within his own local repository, which can then be safely merged into the master repository, along with changes made by other developers on the team.

**What are the best practices for commit messages?**

- Begin with a summary line of 50 characters or less, followed by a blank line.
- Follow (if necessary) with paragraph(s) with more detail, with lines  wrapping at about 72 characters. If there is more than one paragraph, separate them with blank lines.
- Create bulleted lists of changes using a hyphen or asterisk for the bullets, followed by a single space, and blank lines in between bullet points. Use hanging indent when formatting text as bulleted list.
- Write in imperative case, rather than past tense, to explain what the commit *will do* when implemented.

**What does the HEAD^ argument mean?**

**HEAD** is an alias (is that correct usage?) for the current commit; **HEAD^** refers to the immediately preceding (last) commit. Commits before that can be referred to numerically: **HEAD~3, HEAD~4, HEAD~5,** etc. The git command **reset** allows you to roll back changes made in the current working feature-branch to a prior commit, indicated by the form of **HEAD** included as the final argument to the command.

**git reset --soft HEAD^** would reset the branch back to the last commit, without affecting the index file or working tree (that's what the **--soft** flag does).

**What are the 3 stages of a git change and how do you move a file from one stage to the other?**
1. *Untracked* - Newly-created files in the repo appear in a *git status* call as "untracked." Untracked files will not be included in a commit; to include an untracked file in the next commit, save it, then *add* it to the repo's metaphorical staging area, using the command *git add [filename]*.
2. *Staged* - Once a file has been *add*ed, it is "staged for commit"; that is, it will be included in the next commit. Once this has been done, a *git status* will show that filethat file as one of the "Changes to be commited." (If you decide you don't want to commit the changes to the file after all, use *git reset HEAD ,[filename] to remove it from the staging area.)
3. *Committed* - Once you are sure that you've made all the changes you intend for the current commit, and you've added all previously untracked files to the staging area, use the *git commit* command to commit the changes for merging into the master branch. The full command to use would be:
**git commit -m "[COMMIT-MSG-TXT]"**


**Write a cheatsheet of the commands needed to commit changes**

My walk-thru of the git/GitHub workflow can be found at:
https://github.com/webdevjeffus/phase-0/blob/master/week-1/git-workflow-ref.md

**What is a pull request and how do you create and merge one?**

A pull request allows a developer to fetch the remote repo from GitHub, and merge the changes in his working branch into it. I explain the process to accomplish this in the walk-thru provided in answer to the previous question.

**Why are pull requests preferred when working with teams?**

When teams of developers collaborate, the likelihood of conflicts and accidents within the code rises immensely. Pull requests provide a "gated process"(1) that allows developers to ensure against these conflicts and accidents, provides a means for reviewing changes and reverting code to a prior state if something bad does happen to it.

(1) Emmanuel Kaunitz, in "Pull request workflow" video, YouTube

